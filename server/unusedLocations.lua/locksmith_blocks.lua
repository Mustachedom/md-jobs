
-- https://forum.cfx.re/t/free-locksmith-mlo/5309829
Jobs['locksmith'] = {
    CateringEnabled = false,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 52, color = 2, scale = 0.5, label = 'Locksmith', loc = vector3(174.11, -1801.95, 29.26)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vector4(174.11, -1801.95, 29.26, 321.03), label = 'Lockpicks Shop'}
    },
    closedShopItems = {
       lockpick = {name = 'lockpick', price = 5},
       advancedlockpick = {name = 'advancedlockpick', price = 5},
    },
    craftingStations = {
        shaper = {
            {anim = 'uncuff', give = {plastic = 10, steel = 20}, take = {lockpick = 1}, progtext = 'Pouring'  },
            {anim = 'uncuff', give = {plastic = 10, steel = 20, lockpick = 1}, take = {advancedlockpick = 1}, progtext = 'Pouring' },
        },
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'shaper', targetLabel = 'Work Materials', menuLabel = 'Work Materials'},
             loc = vector3(165.67, -1810.66, 29.12), l = 0.65, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = 'locksmith'},
        },
        Tills = {
            {loc = vector3(164.39, -1806.64, 29.56), l = 0.65, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = 'locksmith'},
        },
    }
}