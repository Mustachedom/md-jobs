-- https://dipzzy.tebex.io/category/free

Jobs['pharmacy'] = {
    CateringEnabled = false,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 52, color = 2, scale = 0.5, label = 'Pharmacy', loc = vec3(-507.56, 278.91, 83.33)},
    },
    closedShops = {
        {ped = 's_m_m_doctor_01', loc = vec4(-507.56, 278.91, 83.33, 179.96), label = 'Pharmacy Shop'}
    },
    closedShopItems = {
       bandage = {name = 'bandage', price = 15},
       painkillers = {name = 'painkillers', price = 20},
       ifaks = {name = 'ifaks', price = 35},
       firstaid = {name = 'firstaid', price = 35},
    },
    craftingStations = {
        shaper = {
            {anim = 'mechanic', give = {cloth = 4}, take = {bandage = 1}, progtext = 'Grabbing' },
            {anim = 'mechanic', give = {cloth = 8}, take = {ifaks = 1}, progtext = 'Grabbing' },
            {anim = 'mechanic', give = {cloth = 16}, take = {firstaid = 1}, progtext = 'Grabbing' },
            {anim = 'mechanic', give = {cloth = 16}, take = {painkillers = 1}, progtext = 'Grabbing' },
        },
    },
    shops = { -- must match the key value in locations
        materials = {
            {name = 'cloth',        price = 5, amount = 50},
        }
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'shaper', targetLabel = 'Work Materials', menuLabel = 'Work Materials'},
             loc = vector3(-507.99, 291.78, 83.58), l = 0.65, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = 'pharmacy'},
        },
        Tills = {
            {loc = vector3(-508.98, 291.66, 83.77), l = 0.65, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = 'pharmacy'},
            {loc = vector3(-506.86, 291.53, 83.77), l = 0.65, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = 'pharmacy'},
        },
        Stores = { -- prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
            {StoreData = {type = 'materials', targetLabel = 'Get materials', menuLabel = 'Get materials!'},
                loc = vector3(-504.2, 298.65, 83.35), l = 0.5, w = 0.5, lwr = 1.0, upr = 0.75, r = 180, job = 'pharmacy'},
        },
        stash = {
            {label = 'Dry Storage', loc = vector3(-510.39, 293.74, 83.45), l = 0.5, w = 1.5, lwr = 0.5, upr = 1.0, r = 180, slots = 20, weight = 100000, job = 'pharmacy'},
            {label = 'Dry Storage', loc = vector3(-506.12, 294.79, 82.92), l = 1.5, w = 0.5, lwr = 0.5, upr = 0.4, r = 90, slots = 20, weight = 100000, job = 'pharmacy'},
        },
        trays = { -- storages to place things for people | prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
            {prop = 'prop_food_tray_01', loc =vector3(-509.57, 291.89, 83.54), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 180, slots = 20, weight = 100000, job = 'pharmacy'},
            {prop = 'prop_food_tray_01', loc =vector3(-504.77, 291.33, 83.54), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 180, slots = 20, weight = 100000, job = 'pharmacy'},
        }
    }
}
