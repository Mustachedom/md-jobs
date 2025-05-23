local props = {}
local blips = {}
local peds = {}

--- Spawn peds
--- @return nil
local function createZones()
    local closedShops = lib.callback.await('md-jobs:server:getClosedShops', false)
    for _, shopObj in pairs(closedShops) do
        local shopConfig = shopObj.config
        local shopOptions = {
            {
                icon = Icons.shop,
                label = L.T.shop,
                action = function() OpenClosedShop(shopConfig.job, shopConfig.num) end,
                canInteract = function()
                    return CanOpenClosed(shopConfig.job)
                end
            },
            {
                icon = Icons.shop,
                label = L.T.manage,
                action = function() ManageClosed(shopConfig.job, shopConfig.num) end,
                canInteract = function()
                    return HasJob(shopConfig.job)
                end
            },
            {
                icon = Icons.shop,
                label = "Adjust Prices",
                action = function() AdjustPrices(shopConfig.job, shopConfig.num) end,
                canInteract = function()
                    return IsBoss() and HasJob(shopConfig.job)
                end
            }
        }
        lib.zones.box({
            coords = vector3(shopConfig.loc.x, shopConfig.loc.y, shopConfig.loc.z),
            size = vector3(30, 30, 3),
            rotation = shopConfig.loc.w or 0,
            debug = Config.Debug,
            onEnter = function()
                if shopObj.type == "ped" then
                    local ped = nil
                    if Config.UseClientPeds then
                        local model = shopConfig.model
                        lib.requestModel(model, 30000)
                        local timeout = 5000
                        local startTime = GetGameTimer()
                        ped = CreatePed(4, model, shopConfig.loc.x, shopConfig.loc.y, shopConfig.loc.z, shopConfig.loc.w,
                            false,
                            true)
                        while not DoesEntityExist(ped) do
                            Wait(100)
                            if GetGameTimer() - startTime > timeout then
                                if Config.Debug then print("[ERROR] - Timeout: Ped creation failed.") end
                                return
                            end
                        end
                        SetEntityHeading(ped, shopConfig.loc.w)
                        FreezeEntityPosition(ped, true)
                        SetModelAsNoLongerNeeded(model)
                        peds[shopConfig.num] = ped
                    else
                        local netId = shopConfig.model -- If server spawned shopConfig.model is netId
                        ped = NetToPed(netId)
                    end
                    if not ped or not DoesEntityExist(ped) then
                        print("[ERROR] - Failed to get ped for interaction")
                        return
                    end
                    SetEntityInvincible(ped, true)
                    SetBlockingOfNonTemporaryEvents(ped, true)

                    AddTargModel(ped, shopOptions)
                elseif shopObj.type == "target" then
                    AddTargSphere(shopConfig.job .. ' ' .. shopConfig.num,
                        vector3(shopConfig.loc.x, shopConfig.loc.y, shopConfig.loc.z), shopOptions)
                end
            end,
            onExit = function()
                if shopObj.type == "ped" then
                    if Config.UseClientPeds then
                        if DoesEntityExist(peds[shopConfig.num]) then
                            DeleteEntity(peds[shopConfig.num])
                            peds[shopConfig.num] = nil
                        end
                    else
                        local netId = shopConfig.model -- If server spawned shopConfig.model is netId
                        local ped = NetToPed(netId)
                        if not ped or not DoesEntityExist(ped) then
                            print("[ERROR] - Failed to get ped for removal")
                            return
                        end
                        RemoveTargModel(ped, shopOptions)
                    end
                elseif shopObj.type == "target" then
                    RemoveTargSphere(shopConfig.job .. ' ' .. shopConfig.num)
                end
            end,
        })
    end
end

--- Create blips
--- @return nil
local function spawnBlips()
    local blipConfigs = lib.callback.await('md-jobs:server:getBlips', false)
    for blipIndex, blipInfo in pairs(blipConfigs) do
        blips[blipIndex] = AddBlipForCoord(blipInfo.loc.x, blipInfo.loc.y, blipInfo.loc.z)
        SetBlipSprite(blips[blipIndex], blipInfo.sprite or 52)
        SetBlipDisplay(blips[blipIndex], 4)
        SetBlipScale(blips[blipIndex], blipInfo.scale or 0.8)
        SetBlipColour(blips[blipIndex], blipInfo.color or 2)
        SetBlipAsShortRange(blips[blipIndex], true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(blipInfo.label or 'Lazy Ass')
        EndTextCommandSetBlipName(blips[blipIndex])
    end
end

------------------------
---- Event Handlers ----
------------------------

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    spawnBlips()
    createZones()
end)

AddEventHandler('onClientResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    spawnBlips()
    createZones()
end)

AddEventHandler('onClientResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    for _, prop in pairs(props) do
        if DoesEntityExist(prop) then
            DeleteEntity(prop)
        end
    end

    if Config.UseClientPeds then
        for _, ped in pairs(peds) do
            if DoesEntityExist(ped) then
                DeleteEntity(ped)
            end
        end
    end

    for _, blip in pairs(blips) do RemoveBlip(blip) end
    props = {}
    blips = {}
    peds = {}
end)

-----------------
---- Threads ----
-----------------

CreateThread(function()
    local jobLocations = lib.callback.await('md-jobs:server:getLocations', false)
    for jobName, locationData in pairs(jobLocations) do
        local jobLabel = jobName
        if Config.Framework == 'qbx' then
            jobLabel = QBOX:GetJob(jobName).label
        end
        if locationData.Crafter then
            for crafterIndex, crafterEntry in pairs(locationData.Crafter) do
                local craftData = crafterEntry.CraftData
                craftData.targetLabel = craftData.targetLabel or 'Craft'
                craftData.menuLabel = craftData.menuLabel or 'Craft'
                local interactionOptions = {
                    {
                        icon = Icons.crafter,
                        label = craftData.targetLabel,
                        action = function()
                            MakeCrafter(craftData.type, craftData.menuLabel, jobName, crafterIndex)
                        end,
                        canInteract = function()
                            return HasJob(jobName)
                        end
                    }
                }
                if craftData.prop then
                    local propIndex = #props + 1
                    lib.requestModel(craftData.prop)
                    props[propIndex] = CreateObject(craftData.prop, crafterEntry.loc.x, crafterEntry.loc.y,
                        crafterEntry.loc.z, false, false, false)
                    PropsSpawn(props[propIndex], craftData.r or 180.0, interactionOptions)
                    SetModelAsNoLongerNeeded(craftData.prop)
                else
                    AddBoxZone('craft' .. jobName .. crafterIndex, crafterEntry, interactionOptions)
                end
            end
        end
        if locationData.Stores then
            for storeIndex, storeEntry in pairs(locationData.Stores) do
                local storeData = storeEntry.StoreData
                storeData.targetLabel = storeData.targetLabel or 'Open Shop'
                storeData.menuLabel = storeData.menuLabel or 'Open Shop'
                local interactionOptions = {
                    {
                        icon = Icons.store,
                        label = storeData.targetLabel,
                        action = function()
                            MakeStore(storeData.type, jobName, storeData.menuLabel, storeIndex)
                        end,
                        canInteract = function()
                            return HasJob(jobName)
                        end
                    }
                }
                if storeData.prop then
                    local propIndex = #props + 1
                    lib.requestModel(storeData.prop)
                    props[propIndex] = CreateObject(storeData.prop, storeEntry.loc.x, storeEntry.loc.y, storeEntry.loc.z,
                        false, false, false)
                    PropsSpawn(props[propIndex], storeData.r or 180.0, interactionOptions)
                    SetModelAsNoLongerNeeded(storeData.prop)
                else
                    AddBoxZone('store' .. jobName .. storeIndex, storeEntry, interactionOptions)
                end
            end
        end
        if locationData.Tills then
            for tillIndex, tillConfig in pairs(locationData.Tills) do
                local interactionOptions = {
                    {
                        icon = Icons.till,
                        label = L.T.till,
                        action = function()
                            TriggerServerEvent('md-jobs:server:billPlayer', jobName, tillIndex)
                        end,
                        canInteract = function()
                            return HasJob(jobName)
                        end
                    },
                    {
                        icon = Icons.till,
                        label = L.T.managecat,
                        action = function() ManageCatering(jobName) end,
                        canInteract = function()
                            return HasJob(jobName) and GlobalState.Cater[jobName]
                        end
                    },
                    {
                        icon = Icons.till,
                        label = L.T.boss,
                        action = function() OpenBossMenu(jobName) end,
                        canInteract = function()
                            return IsBoss() and HasJob(jobName)
                        end
                    },
                    {
                        icon = Icons.till,
                        label = 'Toggle Duty',
                        action = function() ToggleDuty() end,
                        canInteract = function()
                            return HasJob(jobName)
                        end
                    }
                }
                if tillConfig.prop then
                    lib.requestModel(tillConfig.prop)
                    local propIndex = #props + 1
                    props[propIndex] = CreateObject(tillConfig.prop, tillConfig.loc.x, tillConfig.loc.y, tillConfig.loc
                        .z, false, false, false)
                    PropsSpawn(props[propIndex], tillConfig.r or 180.0, interactionOptions)
                    SetModelAsNoLongerNeeded(tillConfig.prop)
                else
                    AddBoxZone('till' .. jobName .. tillIndex, tillConfig, interactionOptions)
                end
            end
        end
        if locationData.stash then
            for stashIndex, stashEntry in pairs(locationData.stash) do
                stashEntry.label = stashEntry.label or 'Open Stash'
                local interactionOptions = {
                    {
                        icon = Icons.stash,
                        label = stashEntry.label,
                        action = function()
                            OpenStash(jobLabel .. ' stash ' .. stashIndex, stashEntry.weight, stashEntry.slot, stashIndex,
                                jobName)
                        end,
                        canInteract = function()
                            return HasJob(jobName)
                        end
                    }
                }
                if stashEntry.prop then
                    lib.requestModel(stashEntry.prop)
                    local propIndex = #props + 1
                    props[propIndex] = CreateObject(stashEntry.prop, stashEntry.loc.x, stashEntry.loc.y, stashEntry.loc
                        .z, false, false, false)
                    PropsSpawn(props[propIndex], stashEntry.r or 180.0, interactionOptions)
                    SetModelAsNoLongerNeeded(stashEntry.prop)
                else
                    AddBoxZone('stash' .. jobName .. stashIndex, stashEntry, interactionOptions)
                end
            end
        end
        if locationData.trays then
            for trayIndex, trayConfig in pairs(locationData.trays) do
                trayConfig.label = trayConfig.label or 'Grab Items'
                local interactionOptions = {
                    {
                        icon = Icons.trays,
                        label = trayConfig.label,
                        action = function()
                            OpenTray(jobLabel .. ' Tray ' .. trayIndex, trayConfig.weight, trayConfig.slot, trayIndex,
                                jobName)
                        end
                    }
                }
                if trayConfig.prop then
                    lib.requestModel(trayConfig.prop)
                    local propIndex = #props + 1
                    props[propIndex] = CreateObject(trayConfig.prop, trayConfig.loc.x, trayConfig.loc.y, trayConfig.loc
                        .z, false, false, false)
                    PropsSpawn(props[propIndex], trayConfig.r or 180.0, interactionOptions)
                    SetModelAsNoLongerNeeded(trayConfig.prop)
                else
                    AddBoxZone('trays' .. jobName .. trayIndex, trayConfig, interactionOptions)
                end
            end
        end
    end
end)
