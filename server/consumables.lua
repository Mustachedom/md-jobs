local consumables = {}

local function handleConsumablePerks(src, statType, changeAmount)
    if Config.Framework == 'qb' or Config.Framework == 'qbx' then
        local player   = GetPlayer(src)
        if not player then return end
        local metadata = player.PlayerData.metadata
        if statType == 'thirst' then
            local oldValue = metadata.thirst or 0
            local newValue = math.min(oldValue + changeAmount, 100.0)
            player.Functions.SetMetaData('thirst', newValue)
            TriggerClientEvent('hud:client:UpdateNeeds', src, metadata.hunger, newValue)
        elseif statType == 'hunger' then
            local oldValue = metadata.hunger or 0
            local newValue = math.min(oldValue + changeAmount, 100.0)
            player.Functions.SetMetaData('hunger', newValue)
            TriggerClientEvent('hud:client:UpdateNeeds', src, newValue, metadata.thirst)
        elseif statType == 'stress' then
            local oldValue = metadata.stress or 0
            local newValue = oldValue + changeAmount
            if newValue > 100.0 then
                newValue = 0.0
            end
            player.Functions.SetMetaData('stress', newValue)
            TriggerClientEvent('hud:client:UpdateStress', src, newValue)
        end
    elseif Config.Framework == 'esx' then
        if statType == 'thirst' then
            TriggerClientEvent('esx_status:add', src, 'thirst', changeAmount)
        elseif statType == 'hunger' then
            TriggerClientEvent('esx_status:add', src, 'hunger', changeAmount)
        elseif statType == 'stress' then
            if changeAmount < 0 then
                TriggerClientEvent('esx_status:remove', src, 'stress', changeAmount)
            else
                TriggerClientEvent('esx_status:add', src, 'stress', changeAmount)
            end
        end
    end
end

for _, jobConfig in pairs(Jobs) do
    if jobConfig.consumables then
        for consumableName, consumableData in pairs(jobConfig.consumables) do
            consumables[consumableName] = consumableData
        end
    end
end
for consumableName, consumableData in pairs(consumables) do
    CUI(consumableName, function(src, _)
        if not consumables[consumableName] then
            return
        end
        local finished = lib.callback.await(
            'md-jobs:client:consume',
            src,
            consumableName,
            consumableData
        )
        if not finished then
            return
        end
        if not RemoveItem(src, consumableName, 1) then
            return
        end
        consumableData.add = consumableData.add or {}
        for perkType, perkAmount in pairs(consumableData.add) do
            handleConsumablePerks(src, perkType, perkAmount)
        end
        if consumableData.action then
            consumableData.action(src, consumableName)
        end
    end)
end
