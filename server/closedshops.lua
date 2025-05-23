-------------------------
---- Local Functions ----
-------------------------

--- Initialize closed shop peds
--- @return nil
local function initializePeds()
    for jobName, jobData in pairs(Jobs) do
        if jobData.closedShopsEnabled then
            for _, shopData in pairs(Jobs[jobName].closedShops) do
                local items = MySQL.query.await('SELECT * FROM mdjobs_closedshop WHERE label = ?', { shopData.label })
                if #items == 0 then
                    local itemPrices = {}
                    for index, item in pairs(Jobs[jobName].closedShopItems) do
                        if item.price == nil then item.price = 5 end
                        itemPrices[index] = item.price
                    end
                    MySQL.insert('INSERT INTO mdjobs_closedshop (job, label, items, prices) VALUES (?, ?, ?,?)',
                        { jobName, shopData.label, json.encode({}), json.encode(itemPrices) })
                end
            end
        end
    end
end
initializePeds()

--- Check if the player is a boss
--- @param source number the player ID
--- @return boolean - true if the player is a boss, false otherwise
local function isBoss(source)
    local Player = GetPlayer(source)
    if not Player then return false end
    if Config.Framework == 'esx' then
        return Player.getJob(nil).isboss -- idk ESX, someone else PR this
    else
        return Player.PlayerData.job.isboss
    end
end

--- Get all jobs from the framework
--- @return table - a table containing all jobs
local function getAllJobs()
    if Config.Framework == 'qb' then
        return QBCore.Shared.Jobs
    elseif Config.Framework == 'qbx' then
        return QBOX:GetJobs()
    elseif Config.Framework == 'esx' then
        return ESX.Jobs
    end
    return {}
end

--- Spawn server-sided closed shop ped
--- @param shop table - the shop data
--- @return number | nil - the network ID of the spawned ped or nil if it fails
local function spawnPed(shop)
    if Config.UseClientPeds and shop.ped then
        local timeout = 5000
        local startTime = GetGameTimer()
        local ped = CreatePed(0, shop.ped, shop.loc.x, shop.loc.y, shop.loc.z, shop.loc.w, true, true)
        while not DoesEntityExist(ped) do
            Wait(100)
            if GetGameTimer() - startTime > timeout then
                if Config.Debug then print("Timeout: Ped creation failed.") end
                return
            end
        end
        FreezeEntityPosition(ped, true)
        local netId = NetworkGetNetworkIdFromEntity(ped)
        shop.netId = netId
    end
end

------------------------
---- Event Handlers ----
------------------------

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() or Config.UseClientPeds then return end
    for _, job in pairs(Jobs) do
        local closedShop = job.closedShops
        if closedShop ~= nil then
            for _, shop in pairs(closedShop) do
                local netId = shop.ped and shop.ped.netId or nil -- Fall back if ped is nil
                if netId and NetworkDoesEntityExistWithNetworkId(netId) then
                    local ped = NetworkGetEntityFromNetworkId(netId)
                    if DoesEntityExist(ped) then
                        DeleteEntity(ped)
                    end
                end
            end
        end
    end
end)

----------------------------
---- Callback Functions ----
----------------------------

lib.callback.register('md-jobs:server:getClosedShops', function()
    local shops = {}
    for jobName, jobData in pairs(Jobs) do
        if jobData.closedShopsEnabled then
            if jobData.closedShops then
                for index, shop in pairs(Jobs[jobName].closedShops) do
                    if shop.ped then
                        local modelValue = nil -- Ped model if client spawned else netId
                        if Config.UseClientPeds then
                            modelValue = shop.ped
                        else
                            local netId = shop.netId
                            if not netId or not NetworkDoesEntityExistWithNetworkId(netId) then
                                netId = spawnPed(shop)
                                shop.netId = netId
                            end
                            modelValue = netId
                        end
                        table.insert(shops, { type = "ped", config = { model = modelValue, loc = shop.loc, job = jobName, num = index }})
                    else
                        table.insert(shops, { type = "target", config = { loc = shop.loc, job = jobName, num = index }})
                    end
                end
            end
        end
    end
    return shops
end)


lib.callback.register('md-jobs:server:getClosedShops', function(source, job, loc)
    local src = source
    local location = GetEntityCoords(GetPlayerPed(src))
    local coords = Jobs[job]['closedShops'][loc].loc
    if #(location - vector3(coords.x, coords.y, coords.z)) < 5.0 then
        local items = MySQL.query.await('SELECT * FROM mdjobs_closedshop WHERE job = ? and label = ?',
            { job, Jobs[job]['closedShops'][loc].label })
        local data = {}
        local has = json.decode(items[1].items)
        local prices = json.decode(items[1].prices)
        for name, num in pairs(has) do
            table.insert(data, { name = name, amount = num or 0, price = prices[name] or 999999 })
        end
        Sort(data, 'name')
        Log('Opened Closed Shop: ' .. job .. ' Name:' .. GetName(src), 'closedshop')
        return data
    end
    return false
end)

lib.callback.register('md-jobs:server:addItemsToClosed', function(source, job, num)
    local src = source
    local location = GetEntityCoords(GetPlayerPed(src))
    if GetJobName(src) ~= job then return end
    if #(location - vector3(Jobs[job]['closedShops'][num].loc.x, Jobs[job]['closedShops'][num].loc.y, Jobs[job]['closedShops'][num].loc.z)) < 5.0 then
        local data = {}
        for item, itemData in pairs(Jobs[job].closedShopItems) do
            local has = GetItemCount(src, item)
            if has > 0 then
                table.insert(data,
                    {
                        item = item,
                        type = 'number',
                        placeholder = has,
                        min = 0,
                        max = has,
                        label = GetLabels(itemData.name),
                        default =
                            has
                    })
            end
        end
        Sort(data, 'label')
        local items = lib.callback.await('md-jobs:client:addItemsToClosed', src, data)
        if items == nil then return end
        local git = MySQL.query.await('SELECT * FROM mdjobs_closedshop WHERE job = ? AND label = ?',
            { job, Jobs[job]['closedShops'][num].label })
        local alreadyin = json.decode(git[1].items) or json.encode(git.items)

        if not items then return end
        for item, itemData in pairs(data) do
            if items[item] >= 1 then
                if RemoveItem(src, itemData.item, items[item]) then
                    if alreadyin[itemData.item] ~= nil then
                        alreadyin[itemData.item] = alreadyin[itemData.item] + items[item]
                    else
                        alreadyin[itemData.item] = items[item]
                    end
                end
            end
        end

        MySQL.update('UPDATE mdjobs_closedshop SET items = ? WHERE job = ? and label = ?',
            { json.encode(alreadyin), job, Jobs[job]['closedShops'][num].label })
        Log('Added Items to Closed Shop: ' .. job .. ' Name:' .. GetName(src), 'closedshop')
    end
end)

lib.callback.register('md-jobs:server:removeItemsFromClosed', function(source, job, loc)
    local src          = source
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local shopConfig   = Jobs[job]['closedShops'][loc]
    if GetJobName(src) ~= job then return end
    if #(playerCoords - vector3(shopConfig.loc.x, shopConfig.loc.y, shopConfig.loc.z)) >= 5.0 then
        return
    end
    local dbRows       = MySQL.query.await(
        'SELECT * FROM mdjobs_closedshop WHERE job = ? AND label = ?',
        { job, shopConfig.label }
    )
    local record       = dbRows[1]
    local storedItems  = json.decode(record.items)
    local inputOptions = {}
    for itemName, itemCount in pairs(storedItems) do
        table.insert(inputOptions, {
            type    = 'number',
            max     = itemCount,
            min     = 0,
            default = itemCount,
            item    = itemName,
            label   = GetLabels(itemName),
            amount  = itemCount
        })
    end
    Sort(inputOptions, 'item')
    local removalSelections = lib.callback.await(
        'md-jobs:client:removeItemsFromClosed',
        src, inputOptions
    )
    if not removalSelections then return end
    for idx, option in ipairs(inputOptions) do
        local removeCount = removalSelections[idx]
        local key         = option.item

        if removeCount < 0 then
            storedItems[key] = nil
        elseif storedItems[key] then
            storedItems[key] = storedItems[key] - removeCount
            if storedItems[key] <= 0 then
                storedItems[key] = nil
            end
            AddItem(src, key, removeCount)
        end
    end
    MySQL.update(
        'UPDATE mdjobs_closedshop SET items = ? WHERE job = ? AND label = ?',
        { json.encode(storedItems), job, shopConfig.label }
    )
    Log(
        'Removed Items from Closed Shop: ' .. job .. ' Name:' .. GetName(src),
        'closedshop'
    )
end)

lib.callback.register('md-jobs:server:purchaseClosedShops', function(source, job, item, amount, loc, type)
    local src = source
    local location = GetEntityCoords(GetPlayerPed(src))
    local data = Jobs[job]['closedShops']
    if #(location - vector3(data[loc].loc.x, data[loc].loc.y, data[loc].loc.z)) < 5.0 then
        local items = MySQL.query.await('SELECT * FROM mdjobs_closedshop WHERE job = ? and label = ?',
            { job, data[loc].label })
        local has = json.decode(items[1].items)
        local prices = json.decode(items[1].prices)
        if has[item] >= amount then
            local totalPrice = amount * prices[item]
            if BillPlayer(src, type, totalPrice) then
                has[item] = has[item] - amount
                if has[item] <= 0 then has[item] = nil end
                MySQL.update('UPDATE mdjobs_closedshop SET items = ? WHERE job = ? and label = ?',
                    { json.encode(has), job, data[loc].label })
                AddItem(src, item, amount)
                AddJobMoney(job, math.floor(totalPrice * (1 - Config.ClosedShopFee)))
                Notifys(src, Format(L.closed.bought, amount, GetLabels(item), totalPrice), 'success')
                Log('Purchased from Closed Shop: ' .. job .. ' Name:' .. GetName(src), 'closedshop')
                return true
            end
            return false
        else
            Notifys(src, L.closed.not_enough_stock 'error')
            return false
        end
    end
    return true
end)

lib.callback.register('md-jobs:server:adjustPrices', function(source, job, shopIndex)
    local src = source
    if not isBoss(src) then return end
    if GetJobName(src) ~= job then return end
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local shopConfig   = Jobs[job]['closedShops'][shopIndex]
    if #(playerCoords - vector3(shopConfig.loc.x, shopConfig.loc.y, shopConfig.loc.z)) >= 5.0 then
        return
    end
    local dbRows        = MySQL.query.await(
        'SELECT * FROM mdjobs_closedshop WHERE job = ? AND label = ?',
        { job, shopConfig.label }
    )
    local dbRecord      = dbRows[1]
    local currentPrices = json.decode(dbRecord.prices)
    local priceOptions  = {}
    for itemName, priceValue in pairs(currentPrices) do
        table.insert(priceOptions, {
            name        = itemName,
            oldPrice    = priceValue,
            type        = 'number',
            placeholder = priceValue,
            default     = priceValue,
            min         = 0,
            max         = 999999,
            label       = GetLabels(itemName),
        })
    end
    Sort(priceOptions, 'name')
    local updatedPrices = lib.callback.await(
        'md-jobs:client:adjustPrices',
        src,
        priceOptions
    )
    if not updatedPrices then return end
    for index, option in ipairs(priceOptions) do
        local newPrice = updatedPrices[index]
        if newPrice ~= nil then
            currentPrices[option.name] = newPrice
        end
    end
    MySQL.update(
        'UPDATE mdjobs_closedshop SET prices = ? WHERE job = ? AND label = ?',
        { json.encode(currentPrices), job, shopConfig.label }
    )
end)

-----------------
---- Threads ----
-----------------

-- Primary thread
CreateThread(function()
    if Config.ClosedShopAlwaysActive then return end
    local ClosedShopPlayers = {}
    for jobName, _ in pairs(getAllJobs()) do
        ClosedShopPlayers[jobName] = 0
    end
    repeat
        for jobName, _ in pairs(ClosedShopPlayers) do
            ClosedShopPlayers[jobName] = 0
        end
        local players = GetPlayers()
        if not next(players) then goto continue end
        for _, player in pairs(players) do
            if player then
                local src = player
                local Player = GetPlayer(src --[[ @as number ]])
                if not Player then goto playerContinue end
                local job = GetJobName(src --[[ @as number ]])
                if Config.Framework == 'qb' then
                    if job and GetPlayer(src --[[ @as number ]]).PlayerData.job.onduty == true then
                        ClosedShopPlayers[job] = ClosedShopPlayers[job] + 1 or 0
                    end
                elseif Config.Framework == 'qbx' then
                    if job and GetPlayer(src --[[ @as number ]]).PlayerData.job.onduty == true then
                        ClosedShopPlayers[job] = ClosedShopPlayers[job] + 1 or 0
                    end
                elseif Config.Framework == 'esx' then
                    if job then
                        ClosedShopPlayers[job] = ClosedShopPlayers[job] + 1 or 0
                    end
                end
            end
            ::playerContinue::
        end
        ::continue::
        GlobalState.MDJobsCount = ClosedShopPlayers
        Wait(1000 * 60 * Config.ClosedShopLoop)
    until false
end)
