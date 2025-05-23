Jobs = Jobs or {}

-- Initialize jobs
for jobName in pairs(Jobs) do
    if Config.Framework == 'qb' then
        if not QBCore.Shared.Jobs[jobName] then
            print('MD-Jobs: Job ' .. jobName .. ' does not exist in qb-core jobs.lua')
            print('Removing job from table')
            Jobs[jobName] = nil
        end
    elseif Config.Framework == 'qbx' then
        local qbxJobs = QBOX:GetJobs()
        if not qbxJobs[jobName] then
            print('MD-Jobs: Job ' .. jobName .. ' does not exist in qbx-core jobs.lua')
            print('Removing job from table')
            Jobs[jobName] = nil
        end
    elseif Config.Framework == 'esx' then
        if not ESX.GetJobs()[jobName] then
            print('MD-Jobs: Job ' .. jobName .. ' does not exist in es_extended jobs.lua')
            print('Removing job from table')
            Jobs[jobName] = nil
        end
    end
end

-------------------------
---- Local Functions ----
-------------------------

--- Get location data
--- @param job string the job name
--- @param event string the event name
--- @param index number the location index
--- @return table - the location data
local function getLocData(job, event, index)
    return Jobs[job].locations[event][index]
end

--- Get location coordinates for OX shops
--- @param job string the job name
--- @return table - list of location vectors
local function getLocsOx(job)
    local coords = {}
    for _, storeEntry in pairs(Jobs[job].locations.Stores) do
        if storeEntry.job == job then
            table.insert(coords, storeEntry.loc)
        end
    end
    return coords
end

--- Register OX stashes for trays and stash locations
--- @return nil
local function oxPrep()
    if GetResourceState('ox_inventory') ~= 'started' then
        return
    end
    for jobName, jobConfig in pairs(Jobs) do
        local jobLabel = jobName
        if Config.Framework == 'qbx' then
            jobLabel = QBOX:GetJob(jobName).label
        end
        local trayLocations = jobConfig.locations.trays or {}
        for trayIndex, trayConfig in pairs(trayLocations) do
            local stashName = jobLabel .. ' Tray ' .. trayIndex
            exports.ox_inventory:RegisterStash(
                stashName,
                stashName,
                trayConfig.slots,
                trayConfig.weight
            )
        end
        local stashLocations = jobConfig.locations.stash or {}
        for stashIndex, stashConfig in pairs(stashLocations) do
            local stashName = jobLabel .. ' stash ' .. stashIndex
            exports.ox_inventory:RegisterStash(
                stashName,
                stashName,
                stashConfig.slots,
                stashConfig.weight
            )
        end
    end
end
oxPrep()

--- Check distance from crafting stations
--- @param source number the player source
--- @param job string the job name
--- @param craftType string the craft location type
--- @return boolean - true if within 5.0 units, false otherwise
local function checkCraftDist(source, job, craftType)
    local candidateCoords = {}
    for _, stationEntry in pairs(Jobs[job].locations.Crafter) do
        if stationEntry.job == job and stationEntry.CraftData.type == craftType then
            table.insert(candidateCoords, stationEntry.loc)
        end
    end
    local minDistance = 100.0
    local playerPed   = GetPlayerPed(source)
    local playerPos   = GetEntityCoords(playerPed)
    for _, coord in ipairs(candidateCoords) do
        local dist = #(playerPos - vector3(coord.x, coord.y, coord.z))
        if dist < minDistance then
            minDistance = dist
        end
        if minDistance <= 5.0 then
            break
        end
    end
    if minDistance < 5.0 then
        return true
    else
        Notifys(source, L.T.toofar, 'error')
        return false
    end
end

--- Check distance from shop locations
--- @param source number the player source
--- @param job string the job name
--- @param storeType string the store location type
--- @return boolean - true if within 5.0 units, false otherwise
local function checkDistShops(source, job, storeType)
    local candidateCoords = {}
    for _, storeEntry in pairs(Jobs[job].locations.Stores) do
        if storeEntry.job == job and storeEntry.StoreData.type == storeType then
            table.insert(candidateCoords, storeEntry.loc)
        end
    end
    local minDistance = 100.0
    local playerPed   = GetPlayerPed(source)
    local playerPos   = GetEntityCoords(playerPed)
    for _, coord in ipairs(candidateCoords) do
        local dist = #(playerPos - vector3(coord.x, coord.y, coord.z))
        if dist < minDistance then
            minDistance = dist
        end
    end
    if minDistance < 5.0 then
        return true
    else
        Notifys(source, L.T.toofar, 'error')
        return false
    end
end

--- Get the player's source ID from a player object
--- @param Player table the player object
--- @return number - the player source ID
local function getSRC(Player)
    if Config.Framework == 'esx' then
        return Player.source
    else
        return Player.PlayerData.source
    end
end

--- Get the player object by citizen ID
--- @param cid string the citizen ID
--- @return table - the player object
local function getPlayerByCid(cid)
    if Config.Framework == 'qb' then
        return QBCore.Functions.GetPlayerByCitizenId(cid)
    elseif Config.Framework == 'qbx' then
        return QBOX:GetPlayerByCitizenId(cid)
    elseif Config.Framework == 'esx' then
        return ESX.GetPlayerFromIdentifier(cid)
    end
    return {}
end

--- Remove money from a player
--- @param source number the player source
--- @param amount number the amount to remove
--- @param accountType string the account type ('cash' or 'bank')
--- @return boolean - true if successful, false otherwise
local function removeMoney(source, amount, accountType)
    local Player = GetPlayer(source)
    if not Player then
        return false
    end
    if Config.Framework == 'qb' then
        if Player.Functions.RemoveMoney(accountType, amount) then
            return true
        else
            Notifys(source, L.Error.too_poor, 'error')
            return false
        end
    elseif Config.Framework == 'qbx' then
        if QBOX:RemoveMoney(source, accountType, amount) then
            return true
        else
            Notifys(source, L.Error.too_poor, 'error')
            return false
        end
    elseif Config.Framework == 'esx' then
        if accountType == 'bank' then
            if Player.getAccount('bank').money >= amount then
                Player.removeAccountMoney('bank', amount)
                return true
            end
        else
            if Player.getMoney() >= amount then
                Player.removeMoney(amount)
                return true
            end
        end
        Notifys(source, L.Error.too_poor, 'error')
        return false
    end
    return false
end

--- Dispense commission and salary to a player
--- @param source number the player source
--- @param amount number the total earned amount
--- @param commissionRate number|nil the commission percentage (0-1), or nil for no commission
--- @return nil
local function dispenseCommission(source, amount, commissionRate)
    if commissionRate == nil then
        AddJobMoney(GetJobName(source), amount)
        return
    end
    local commissionAmt = math.floor(amount * commissionRate)
    local salaryAmt     = amount - commissionAmt
    AddMoney(source, commissionAmt)
    Notifys(source, Format(L.cater.commission, commissionAmt), 'success')
    AddJobMoney(GetJobName(source), salaryAmt)
end

------------------------
---- Event Handlers ----
------------------------

RegisterNetEvent('md-jobs:server:billPlayer', function(job, tillIndex)
    local src = source
    if not src then return end
    local tillData  = getLocData(job, 'Tills', tillIndex)
    if job ~= tillData.job then
        return
    end
    if not CheckLoc(src, job, 'Tills', tillIndex) then
        return
    end
    if GetJobName(src) ~= tillData.job then
        return
    end
    local nearbyPlayers = GetNear(src)
    local chargeInfo    = lib.callback.await('md-jobs:client:chargePerson', src, nearbyPlayers)
    if not chargeInfo then
        return
    end
    local billedPlayerObj = getPlayerByCid(chargeInfo.cid)
    local billedSrc       = getSRC(billedPlayerObj)
    local acceptedCharge  = lib.callback.await('md-jobs:client:acceptCharge', billedSrc, chargeInfo.amount)
    if not acceptedCharge then
        Notifys(src, GetName(src) .. ' Refused To Pay', 'error')
        return
    end
    if BillPlayer(billedSrc, acceptedCharge.type, chargeInfo.amount) then
        Notifys(
            src,
            Format(L.billing.billed, chargeInfo.amount, GetName(billedSrc)),
            'success'
        )
        Notifys(
            billedSrc,
            Format(L.billing.paid, chargeInfo.amount, GetName(src)),
            'success'
        )
        dispenseCommission(src, chargeInfo.amount, tillData.commission)
        Log(
            'Charged: ' .. job ..
            ' Name:' .. GetName(src) ..
            ' Billed: ' .. GetName(billedSrc) ..
            '$' .. chargeInfo.amount,
            'billing'
        )
    else
        Notifys(src, Format(L.billing.too_poor, GetName(billedSrc)), 'error')
    end
end)

----------------------------
---- Callback Functions ----
----------------------------

lib.callback.register('md-jobs:server:getLocations', function()
    local allLocations = {}
    for jobName, jobConfig in pairs(Jobs) do
        allLocations[jobName] = jobConfig.locations
    end
    return allLocations
end)

lib.callback.register('md-jobs:server:getRecipes', function(source, job, station)
    local playerJob = GetJobName(source)
    if job ~= playerJob then
        return false
    end
    return Jobs[job].craftingStations[station] or false
end)

lib.callback.register('md-jobs:server:canCraft', function(source, job, station, stationIndex)
    local playerJob = GetJobName(source)
    if job ~= playerJob or not checkCraftDist(source, job, station) then
        return false
    end
    local recipe = Jobs[job].craftingStations[station][stationIndex]
    local requiredCount, satisfiedCount = 0, 0
    for itemName, requiredQty in pairs(recipe.give) do
        requiredCount = requiredCount + 1
        if HasItem(source, itemName, requiredQty) then
            satisfiedCount = satisfiedCount + 1
        end
    end
    if requiredCount == satisfiedCount then
        for itemName, qty in pairs(recipe.take) do
            AddItem(source, itemName, qty)
        end
        for itemName, qty in pairs(recipe.give) do
            RemoveItem(source, itemName, qty)
        end
    end
    Log('Crafted: ' .. job .. ' Name:' .. GetName(source), 'crafting')
    return true
end)

lib.callback.register('md-jobs:server:getCraftingMax', function(source, job, station, _, stationIndex)
    local playerJob = GetJobName(source)
    if job ~= playerJob then
        return false
    end
    local recipe = Jobs[job].craftingStations[station][stationIndex]
    if next(recipe.give) == nil then
        return Config.MultiCraftDefault
    end
    local maxPossible = math.huge
    for itemName, requiredQty in pairs(recipe.give) do
        local ownedQty = GetItemCount(source, itemName)
        local possible = math.floor(ownedQty / requiredQty)
        if possible < maxPossible then
            maxPossible = possible
        end
    end
    local limit = recipe.max or Config.MultiCraftDefault
    return math.min(maxPossible, limit)
end)

lib.callback.register('md-jobs:server:getShops', function(source, job, storeType)
    local playerJob = GetJobName(source)
    if job ~= playerJob or not checkDistShops(source, job, storeType) then
        return false
    end
    if Config.UseShops then
        if Config.Inv == 'qb' then
            local shopName = job .. ' ' .. storeType
            exports['qb-inventory']:CreateShop({
                name  = shopName,
                label = storeType,
                slots = #Jobs[job].shops[storeType],
                items = Jobs[job].shops[storeType],
            })
            exports['qb-inventory']:OpenShop(source, shopName)
            return true
        elseif Config.Inv == 'ox' then
            local shopKey = job .. ' ' .. storeType
            exports.ox_inventory:RegisterShop(shopKey, {
                name      = shopKey,
                inventory = Jobs[job].shops[storeType],
                locations = getLocsOx(job),
            })
            return shopKey, storeType
        end
    end
    return Jobs[job].shops[storeType] or false
end)

lib.callback.register('md-jobs:server:purchaseShops', function(source, job, storeType, itemName, amount)
    if not checkDistShops(source, job, storeType) then
        return
    end
    if GetJobName(source) ~= job then
        return
    end
    local totalPrice
    for _, shopItem in ipairs(Jobs[job].shops[storeType]) do
        if shopItem.name == itemName then
            totalPrice = shopItem.price * amount
            break
        end
    end
    if not totalPrice then
        return
    end

    if removeMoney(source, totalPrice, 'cash') then
        Log('Purchased: ' .. job .. ' Name:' .. GetName(source), 'purchasing')
        AddItem(source, itemName, amount)
        return true
    else
        return false
    end
end)

lib.callback.register('md-jobs:server:getBlips', function()
    local blipList = {}
    for _, jobConfig in pairs(Jobs) do
        local blips = jobConfig.Blip or {}
        for _, blipData in pairs(blips) do
            table.insert(blipList, blipData)
        end
    end
    return blipList
end)
