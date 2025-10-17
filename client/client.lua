local props = {}
local blips = {}
local trackingBlips = {}
local peds = {}
local zones = {}

--- Create closed shop zones
--- @return nil
local function createZones()
    CreateThread(function()
        local jobs = lib.callback.await('md-jobs:server:getJobConfigs', false)
        if not jobs then return end

        --- Helper to get shop target options
        --- @param job string the job to target
        --- @param num number the closed shop num
        --- @return table - the options tree
        local function getOpts(job, num)
            return {
                {
                    icon = Icons.shop,
                    label = L.T.shop,
                    action = function()
                        OpenClosedShop(job, num)
                    end,
                    canInteract = function()
                        return CanOpenClosed(job)
                    end
                },
                {
                    icon = Icons.shop,
                    label = L.T.manage,
                    action = function()
                        ManageClosed(job, num)
                    end,
                    canInteract = function()
                        return HasJob(job)
                    end
                },
                {
                    icon = Icons.shop,
                    label = "Adjust Prices",
                    action = function()
                        AdjustPrices(job, num)
                    end,
                    canInteract = function()
                        return IsBoss() and HasJob(job)
                    end
                },
            }
        end

        --- Helper to spawn closed shop peds
        ---@param shopObj table the shop config
        --- @return nil
        local function spawnShop(jobName, shopObj)
            local cfg = shopObj.config
            local opts = getOpts(jobName, cfg.num)
            if shopObj.type == "ped" then
                local ped = Config.UseClientPeds
                    and SpawnLocalPed(cfg.model, cfg.loc)
                    or (NetworkDoesEntityExistWithNetworkId(cfg.model) and NetToPed(cfg.model))
                if not ped or not DoesEntityExist(ped) then
                    print("[ERROR] - Failed to spawn ped for closed shop:", jobName, cfg.num)
                    return
                end
                SetBlockingOfNonTemporaryEvents(ped, true)
                SetPedFleeAttributes(ped, 0, false)
                SetPedCanRagdoll(ped, false)
                SetEntityCanBeDamaged(ped, false)
                SetEntityInvincible(ped, true)
                if math.random(1, 4) > 1 then
                    SetEntityAsMissionEntity(ped, true, true)
                    PlayPedAmbientSpeechNative(ped, 'GENERIC_HI', 'SPEECH_PARAMS_FORCE_NORMAL_CLEAR')
                end
                peds[cfg.num] = ped
                AddTargModel(ped, opts)
            elseif shopObj.type == "target" then
                AddTargSphere(
                    jobName .. "_" .. cfg.num,
                    vector3(cfg.loc.x, cfg.loc.y, cfg.loc.z),
                    opts
                )
            end
        end

        --- Helper to remove closed shop peds
        --- @param shopObj table the shop config
        --- @return nil
        local function removeShop(jobName, shopObj)
            local cfg = shopObj.config
            local opts = getOpts(jobName, cfg.num)

            if shopObj.type == "ped" then
                local ped = peds[cfg.num]
                if not ped or not DoesEntityExist(ped) then
                    -- fallback to network ped
                    ped = (NetworkDoesEntityExistWithNetworkId(cfg.model) and NetToPed(cfg.model))
                end
                if not ped or not DoesEntityExist(ped) then
                    print("[ERROR] - Failed to find ped to remove for closed shop:", jobName, cfg.num)
                    return
                end
                if math.random(1, 4) > 1 then
                    SetEntityAsMissionEntity(ped, true, true)
                    PlayPedAmbientSpeechNative(ped, 'GENERIC_BYE', 'SPEECH_PARAMS_FORCE_NORMAL_CLEAR')
                    Wait(1000)
                end
                if Config.UseClientPeds then
                    DeleteEntity(ped)
                    peds[cfg.num] = nil
                else
                    RemoveTargModel(ped, opts)
                end
            elseif shopObj.type == "target" then
                RemoveTargSphere(jobName .. "_" .. cfg.num)
            end
        end

        for jobName, jobConfig in pairs(jobs) do
            local zonePoints = jobConfig.zone
            local closedShops = jobConfig.closedShops
            if zones[jobName] then
                zones[jobName]:remove()
                zones[jobName] = nil
            end

            local zone = nil
            local zoneConfig = {
                debug   = Config.Debug,
                onEnter = function()
                    TriggerServerEvent("md-jobs:server:enterJobZone", jobName)
                    for _, shopObj in ipairs(closedShops) do
                        spawnShop(jobName, shopObj)
                    end
                end,
                onExit  = function()
                    TriggerServerEvent("md-jobs:server:leaveJobZone", jobName)
                    for _, shopObj in ipairs(closedShops) do
                        removeShop(jobName, shopObj)
                    end
                end,
            }
            if jobConfig.polyzone then
                -- Polyzone configuired, using polyzone
                zoneConfig.points = zonePoints
                zone = lib.zones.poly(zoneConfig)
            else
                -- No polyzone configured, using box zone
                zoneConfig.coords = vector3(zonePoints.x, zonePoints.y, zonePoints.z)
                zoneConfig.size = vector3(30, 30, 3)
                zone = lib.zones.box(zoneConfig)
            end
            zones[jobName] = zone
        end
    end)
end


--- Create blips
--- @return nil
local function spawnBlips()
    local blipConfigs = lib.callback.await('md-jobs:server:getBlips', false)
    local registeredCategories = {}

    for jobName, blipConfig in pairs(blipConfigs) do
        local blipInfo = blipConfig.info
        if blips[jobName] ~= nil then
            if DoesBlipExist(blips[jobName]) then
                RemoveBlip(blips[jobName])
            end
            blips[jobName] = nil
        end

        blips[jobName] = CreateBlip(blipInfo.loc, {
            sprite = blipInfo.sprite or 52,
            display = blipInfo.disp or 4,
            scale  = blipInfo.scale or 0.8,
            color  = blipInfo.color or 2,
            label  = blipInfo.label or jobName
        }, true, false)

        if Config.GroupBlips and blipInfo.category then
            SetBlipCategory(blips[jobName], blipInfo.category)

            if not registeredCategories[blipInfo.category] then
                local catName = Config.CategoryNames and Config.CategoryNames[blipInfo.category]
                    or ("Category " .. blipInfo.category)
                AddTextEntry("BLIP_CAT_" .. blipInfo.category, catName)
                registeredCategories[blipInfo.category] = true
            end
        end
    end
end

--- Remove Delivery Peds, Zones, and Blips
--- @param job string the job to end delivery for
--- @param netId integer the netId of the catering delivery ped
--- @return nil
local function cleanupDelivery(job, netId)
    local ped
    if Config.UseClientPeds then
        ped = peds[job .. '_delivery']
        peds[job .. '_delivery'] = nil
    elseif netId and NetworkDoesEntityExistWithNetworkId(netId) then
        ped = NetworkGetEntityFromNetworkId(netId)
    end
    if DoesEntityExist(ped) then
        SetEntityAsMissionEntity(ped, true, true)
        PlayPedAmbientSpeechNative(ped, 'GENERIC_THANKS', 'SPEECH_PARAMS_FORCE_NORMAL_CLEAR')
        Wait(1000)
        FreezeEntityPosition(ped, false)
        SetBlockingOfNonTemporaryEvents(ped, false)
        SetPedFleeAttributes(ped, 0, true)
        SetPedCanRagdoll(ped, true)
        SetEntityCanBeDamaged(ped, true)
        SetEntityInvincible(ped, false)
        TaskWanderStandard(ped, 10.0, 10)
        SetEntityAsMissionEntity(ped, false, false)
        SetEntityAsNoLongerNeeded(ped)
        SetEntityCleanupByEngine(ped, true)
        RemoveTargModel(ped, { { label = L.cater.manage.deliver } }) -- THIS MUST MATCH THE OPTIONS LABEL
    end
    local blip = blips[job .. '_delivery']
    if blip then
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
        blips[job .. '_delivery'] = nil
    end
    if zones[job .. "_delivery"] then
        zones[job .. "_delivery"]:remove()
        zones[job .. "_delivery"] = nil
    end
end

--- Remove Catering Peds, Zones, and Blips
--- @param job string the job to end delivery for
--- @return nil
local function endCatering(job)
    local blip = blips[job .. '_catering']
    if blip then
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
        blips[job .. '_catering'] = nil
    end
    local trackingBlip = trackingBlips[job]
    if trackingBlip then
        if DoesBlipExist(trackingBlip) then
            RemoveBlip(trackingBlip)
        end
        trackingBlips[job] = nil
    end
    if zones[job .. "_catering"] then
        zones[job .. "_catering"]:remove()
        zones[job .. "_catering"] = nil
    end
    lib.hideTextUI()
end

------------------
---- Keybinds ----
------------------

local parkVehicleKeybind = lib.addKeybind({
    name          = "md_jobs_park",
    description   = "Park Company Vehicle",
    defaultKey    = Config.ParkVehicleKey,
    defaultMapper = "keyboard",
    disabled      = true,
    onPressed     = function(self)
        local success = lib.callback.await('md-jobs:server:endCatering', false)
        if success then
            self:disable(true)
        end
    end,
})

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

AddEventHandler('onClientResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for _, prop in pairs(props) do if DoesEntityExist(prop) then DeleteEntity(prop) end end
    props = {}
    for _, blip in pairs(blips) do if DoesBlipExist(blip) then RemoveBlip(blip) end end
    blips = {}
    for _, trackingBlip in pairs(trackingBlips) do if DoesBlipExist(trackingBlip) then RemoveBlip(trackingBlip) end end
    trackingBlips = {}
    if Config.UseClientPeds then
        for _, ped in pairs(peds) do if DoesEntityExist(ped) then DeleteEntity(ped) end end
        peds = {}
    end
    for _, zone in pairs(zones) do zone:remove() end
    zones = {}
    lib.hideTextUI()
end)

RegisterNetEvent('md-jobs:client:setVehicleLivery', function(netId, livery)
    if netId and livery and NetworkDoesEntityExistWithNetworkId(netId) then
        local vehicle = NetToVeh(netId)
        if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
            SetVehicleLivery(vehicle, livery)
        end
    end
end)

RegisterNetEvent('md-jobs:client:cateringStarted', function(job, info, npcNetId, vehicleNetId, blipConfig)
    if not job or GetJobName() ~= job then return end
    info.employees = info.employees
    info.totals    = info.totals
    info.details   = info.details
    info.data      = info.data
    local details  = info.details
    if blips[job .. '_delivery'] ~= nil then
        if DoesBlipExist(blips[job .. '_delivery']) then
            RemoveBlip(blips[job .. '_delivery'])
        end
        blips[job .. '_delivery'] = nil
    end
    local blip                = CreateBlip(details.location.loc, {
        sprite = blipConfig.sprite or 280,
        display = blipConfig.display or 2,
        scale = blipConfig.scale or 0.8,
        color = blipConfig.color or 8,
        label = blipConfig.label or "Catering Order"
    }, true, true)
    blips[job .. '_delivery'] = blip

    local options             = {
        {
            icon   = 'fas fa-utensils',
            label  = L.cater.manage.deliver,
            action = function()
                TriggerServerEvent('md-jobs:server:deliverCatering', job)
            end,
        }
    }

    if zones[job .. "_delivery"] then
        zones[job .. "_delivery"]:remove()
        zones[job .. "_delivery"] = nil
    end
    zones[job .. "_delivery"] = lib.zones.sphere({
        coords = vector3(details.location.loc.x, details.location.loc.y, details.location.loc.z),
        radius = 50,
        debug = Config.Debug,
        onEnter = function()
            local npcPed
            if Config.UseClientPeds then
                npcPed = SpawnLocalPed(details.location.model, details.location.loc)
                peds[job .. "_delivery"] = npcPed
            elseif npcNetId and NetworkDoesEntityExistWithNetworkId(npcNetId) then
                npcPed = NetworkGetEntityFromNetworkId(npcNetId)
            end
            if not npcPed or not DoesEntityExist(npcPed) then
                print("[ERR] - Failed to spawn catering delivery ped")
                return
            end

            SetBlockingOfNonTemporaryEvents(npcPed, true)
            SetPedFleeAttributes(npcPed, 0, false)
            SetPedCanRagdoll(npcPed, false)
            SetEntityCanBeDamaged(npcPed, false)
            SetEntityInvincible(npcPed, true)

            AddTargModel(npcPed, options)
        end,
        onExit = function()
            local npcPed = peds[job .. "_delivery"]
            if Config.UseClientPeds then
                if DoesEntityExist(npcPed) then
                    DeleteEntity(npcPed)
                    peds[job .. "_delivery"] = nil
                end
            else
                RemoveTargModel(npcPed, options)
            end
        end,
    })
    AddTargModel(peds[job .. "_delivery"], options)

    if vehicleNetId == -1 then
        Notify(L.cater.manage.van_dup, 'error')
        return
    elseif vehicleNetId and NetworkDoesEntityExistWithNetworkId(vehicleNetId) then
        local vehicle = NetworkGetEntityFromNetworkId(vehicleNetId)
        if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
            GiveKeys(vehicle)
            SetVehicleFuelLevel(vehicle, 100.0)
            Notify(L.cater.manage.van, 'success')
            return
        else
            print('[ERROR] - Failed to get company vehicle', vehicle, DoesEntityExist(vehicle), IsEntityAVehicle(vehicle))
        end
    else
        print('[ERROR] - Failed to get valid vehicle network ID', vehicleNetId,
            NetworkDoesEntityExistWithNetworkId(vehicleNetId))
    end
end)

RegisterNetEvent('md-jobs:client:endDelivery', function(job, npcNetId, vehModel, coords, blipConfig)
    if not job or GetJobName() ~= job then return end
    cleanupDelivery(job, npcNetId)
    if blips[job .. '_catering'] ~= nil then
        if DoesBlipExist(blips[job .. '_catering']) then
            RemoveBlip(blips[job .. '_catering'])
        end
        blips[job .. '_catering'] = nil
    end
    blips[job .. '_catering'] = CreateBlip(coords.xyz, {
        sprite = blipConfig.sprite or 357,
        display = blipConfig.display or 4,
        scale = blipConfig.scale or 0.8,
        color = blipConfig.color or 2,
        label = blipConfig.label or "Park Vehicle"
    }, true, true)

    local minDim, maxDim = GetModelDimensions(vehModel)
    local sizeVec = vector3(
        math.abs(maxDim.x - minDim.x),
        math.abs(maxDim.y - minDim.y),
        math.abs(maxDim.z - minDim.z)
    )
    if zones[job .. '_catering'] ~= nil then
        zones[job .. '_catering']:remove()
        zones[job .. '_catering'] = nil
    end
    zones[job .. '_catering'] = lib.zones.box({
        coords = vector3(coords.x, coords.y, coords.z - 0.8),
        size = sizeVec,
        rotation = coords.w,
        onEnter = function()
            parkVehicleKeybind:disable(false)
            lib.showTextUI(('[%s] - Park Company Vehicle'):format(Config.ParkVehicleKey), {
                position = Config.TextUIPosition,
            })
        end,
        onExit = function()
            lib.hideTextUI()
            parkVehicleKeybind:disable(true)
        end,
        debug = Config.Debug
    })

    Citizen.CreateThread(function()
        local thicknessCount  = 5   -- how many horizontal layers in Z
        local thicknessHeight = 0.1 -- height of each layer
        local halfWidth       = 0.03

        local function rotate2D(offset, thetaRad)
            local x = offset.x * math.cos(thetaRad) - offset.y * math.sin(thetaRad)
            local y = offset.x * math.sin(thetaRad) + offset.y * math.cos(thetaRad)
            return vector3(x, y, 0.0)
        end

        -- Get the color of the blip
        local tempBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
        SetBlipColour(tempBlip, blipConfig.color or 2)
        local r, g, b, _ = GetHudColour(GetBlipHudColour(tempBlip))
        RemoveBlip(tempBlip)
        local baseColor  = { r = r or 255, g = g or 255, b = b or 255, a = 255 }

        local headingDeg = coords.w or 0
        local theta      = math.rad(headingDeg)
        local halfW      = sizeVec.x / 2.0
        local halfD      = sizeVec.y / 2.0
        local baseZ      = coords.z - 1.25
        local offsets    = {
            vector3(halfW, halfD, 0.0),   -- front‐right
            vector3(halfW, -halfD, 0.0),  -- back‐right
            vector3(-halfW, -halfD, 0.0), -- back‐left
            vector3(-halfW, halfD, 0.0),  -- front‐left
        }

        local corners    = {}
        for i = 1, 4 do
            local rOff = rotate2D(offsets[i], theta)
            corners[i] = vector3(
                coords.x + rOff.x,
                coords.y + rOff.y,
                baseZ
            )
        end

        local edgeData = {}
        for i = 1, 4 do
            local nextI = (i % 4) + 1
            local A = corners[i]
            local B = corners[nextI]
            local dx = (B.x - A.x)
            local dy = (B.y - A.y)
            local lenAB = math.sqrt(dx * dx + dy * dy)
            if lenAB == 0 then
                goto skip_edge
            end
            local dirX = dx / lenAB
            local dirY = dy / lenAB
            local Ax = A.x - dirX * halfWidth
            local Ay = A.y - dirY * halfWidth
            local Bx = B.x + dirX * halfWidth
            local By = B.y + dirY * halfWidth
            local perpX = -dirY
            local perpY = dirX
            local A1x, A1y = Ax + perpX * halfWidth, Ay + perpY * halfWidth
            local A2x, A2y = Ax - perpX * halfWidth, Ay - perpY * halfWidth
            local B1x, B1y = Bx + perpX * halfWidth, By + perpY * halfWidth
            local B2x, B2y = Bx - perpX * halfWidth, By - perpY * halfWidth

            edgeData[i] = {
                A1xy = vector2(A1x, A1y),
                A2xy = vector2(A2x, A2y),
                B1xy = vector2(B1x, B1y),
                B2xy = vector2(B2x, B2y),
            }

            ::skip_edge::
        end

        local zLower = {}
        local zUpper = {}
        local alpha  = {}
        for layer = 0, thicknessCount - 1 do
            local zl = baseZ + (layer * thicknessHeight)
            zLower[layer] = zl
            zUpper[layer] = zl + thicknessHeight

            local t = layer / (thicknessCount - 1)
            alpha[layer] = math.floor(255 * (1.0 - 0.8 * t))
        end

        while zones[job .. '_catering'] ~= nil do
            Wait(0)
            for layer = 0, thicknessCount - 1 do
                local zl = zLower[layer]
                local zu = zUpper[layer]
                local a  = alpha[layer]
                for i = 1, 4 do
                    local ed = edgeData[i]
                    if not ed then
                        goto continue_edge
                    end
                    local A1 = vector3(ed.A1xy.x, ed.A1xy.y, zl)
                    local A2 = vector3(ed.A2xy.x, ed.A2xy.y, zl)
                    local B1 = vector3(ed.B1xy.x, ed.B1xy.y, zl)
                    local B2 = vector3(ed.B2xy.x, ed.B2xy.y, zl)
                    local A1u = vector3(ed.A1xy.x, ed.A1xy.y, zu)
                    local A2u = vector3(ed.A2xy.x, ed.A2xy.y, zu)
                    local B1u = vector3(ed.B1xy.x, ed.B1xy.y, zu)
                    local B2u = vector3(ed.B2xy.x, ed.B2xy.y, zu)
                    DrawPoly(
                        A1.x, A1.y, A1.z,
                        B1.x, B1.y, B1.z,
                        A2.x, A2.y, A2.z,
                        baseColor.r, baseColor.g, baseColor.b, a
                    )
                    DrawPoly(
                        B1.x, B1.y, B1.z,
                        B2.x, B2.y, B2.z,
                        A2.x, A2.y, A2.z,
                        baseColor.r, baseColor.g, baseColor.b, a
                    )
                    DrawPoly(
                        A1u.x, A1u.y, A1u.z,
                        A2u.x, A2u.y, A2u.z,
                        B1u.x, B1u.y, B1u.z,
                        baseColor.r, baseColor.g, baseColor.b, a
                    )
                    DrawPoly(
                        B1u.x, B1u.y, B1u.z,
                        A2u.x, A2u.y, A2u.z,
                        B2u.x, B2u.y, B2u.z,
                        baseColor.r, baseColor.g, baseColor.b, a
                    )
                    ::continue_edge::
                end
            end
        end
    end)
end)

RegisterNetEvent('md-jobs:client:endCatering', function(job, netId)
    if not job or GetJobName() ~= job then return end
    cleanupDelivery(job, netId)
    endCatering(job)
end)

RegisterNetEvent('md-jobs:client:trackVan', function(job, coords, blipData)
    if not job or GetJobName() ~= job then return end
    if not blipData then return end
    if DoesBlipExist(trackingBlips[job]) then
        RemoveBlip(trackingBlips[job])
        trackingBlips[job] = nil
        Wait(0)
    end
    local newBlip = CreateBlip(coords, {
        sprite = blipData.sprite or 67,
        display = 4,
        scale = blipData.scale or 0.8,
        color = blipData.color or 2,
        label = blipData.label or 'Company Vehicle'
    }, true, false)
    trackingBlips[job] = newBlip
end)

RegisterNetEvent('md-jobs:client:untrackVan', function(job)
    if not job or GetJobName() ~= job then return end
    if DoesBlipExist(trackingBlips[job]) then
        RemoveBlip(trackingBlips[job])
        trackingBlips[job] = nil
    end
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


