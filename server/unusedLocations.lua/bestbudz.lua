-- https://www.gta5-mods.com/maps/mlo-legion-weed-clinic

Jobs['bestbudz'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 469, color = 2, scale = 0.8, label = 'Best Budz', loc = vec3(381.92, -833.4, 29.29)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vec4(381.92, -833.4, 29.29, 184.21), label = 'Best Budz Shop'}
    },
    closedShopItems = {
        joint_whitewidow = {name = 'joint_whitewidow', price = 5},
        joint_ogkush = {name = 'joint_ogkush', price = 5},
        joint_purplehaze = {name = 'joint_purplehaze', price = 5},
        joint_skunk = {name = 'joint_skunk', price = 5},
        joint_ak47 = {name = 'joint_ak47', price = 5},
        blunt_whitewidow = {name = 'blunt_whitewidow', price = 5},
        blunt_ogkush = {name = 'blunt_ogkush', price = 5},
        blunt_purple_haze = {name = 'blunt_purple_haze', price = 5},
        blunt_skunk = {name = 'blunt_skunk', price = 5},
        blunt_ak47 = {name = 'blunt_ak47', price = 5},
        weed_oil = {name = 'weed_oil', price = 5},
        weed_gummies = {name = 'weed_gummies', price = 5},
        empty_weed_bag = {name = 'empty_weed_bag', price = 5},
        rolling_paper = {name = 'rolling_paper', price = 5},
        bluntwrap = {name = 'bluntwrap', price = 5},
        weed_nutrition = {name = 'weed_nutrition', price = 5},
    },
    craftingStations = {
        whitewidow = {
            {anim = 'uncuff',give = {empty_weed_bag = 1}, take = {weed_job_white_widow = 1}, progtext = 'Pouring'},
        },
        ogkush = {
            {anim = 'uncuff',give = {empty_weed_bag = 1}, take = {weed_job_og_kush=1}, progtext = 'Pouring' },
        },
        purplehaze = {
            {anim = 'uncuff',give = {empty_weed_bag = 1}, take = {weed_job_purple_haze=1}, progtext = 'Pouring' },
        },
        skunk = {
            {anim = 'uncuff',give = {empty_weed_bag = 1}, take = {weed_job_skunk=1}, progtext = 'Pouring' },
        },
        ak47 = {
            {anim = 'uncuff',give = {empty_weed_bag = 1}, take = {weed_job_ak47=1}, progtext = 'Pouring' },
        },
        joints = {
            {anim = 'uncuff',give = {rolling_paper = 1, weed_job_white_widow=1}, take = {joint_whitewidow=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {rolling_paper = 1, weed_job_og_kush=1}, take = {joint_og_kush=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {rolling_paper = 1, weed_job_purple_haze=1}, take = {joint_purplehaze=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {rolling_paper = 1, weed_job_skunk=1}, take = {joint_skunk=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {rolling_paper = 1, weed_job_ak47=1}, take = {joint_ak47=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {bluntwrap = 1, weed_job_white_widow=1}, take = {blunt_white_widow=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {bluntwrap = 1, weed_job_og_kush=1}, take = {blunt_og_kush=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {bluntwrap = 1, weed_job_purple_haze=1}, take = {blunt_purple_haze=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {bluntwrap = 1, weed_job_skunk=1}, take = {blunt_skunk=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {bluntwrap = 1, weed_job_ak47=1}, take = {blunt_ak47=1}, progtext = 'Rolling' }, 
        },
        oil = {
            {anim = 'uncuff',give = {weed_job_white_widow = 1}, take = {weed_oil=1}, progtext = 'Pouring' },
            {anim = 'uncuff',give = {weed_job_og_kush = 1}, take = {weed_oil=1}, progtext = 'Pouring' },
            {anim = 'uncuff',give = {weed_job_purplehaze = 1}, take = {weed_oil=1}, progtext = 'Pouring' },
            {anim = 'uncuff',give = {weed_job_ak47 = 1}, take = {weed_oil=1}, progtext = 'Pouring' },
            {anim = 'uncuff',give = {weed_job_skunk = 1}, take = {weed_oil=1}, progtext = 'Pouring' },
            {anim = 'uncuff',give = {weed_oil = 1, candy_gummies = 1}, take = {weed_gummies =1}, progtext = 'mixing' },
        }
    },
    catering = {
        commission = 0.2,
        items = {
            {name = 'joint_whitewidow', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_og_kush', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_purplehaze', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_skunk',  minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_ak47',   minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_white_widow', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_og_kush', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_purple_haze', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_skunk',  minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_ak47',   minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'weed_oil',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'weed_gummies', minPrice = 10, maxPrice = 20, maxAmount = 30},
        },
        Van = {
            bestbudz = {model = 'burrito', label = 'Burrito', plate = 'WeedMan', loc = vec4(370.64, -829.05, 29.29, 179.82)},
        }
    },
    shops = {
        ingridients={
            {name = 'empty_weed_bag', price = 5, amount = 50},
            {name = 'rolling_paper', price = 5, amount = 50},
            {name = 'bluntwrap', price = 5, amount = 50},
            {name = 'weed_nutrition' , price = 5, amount = 50},
            {name = 'candy_gummies', price = 5, amount = 50},
        },
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'whitewidow', targetLabel = 'Pick White Widow', menuLabel = 'Pick White Widow!'},
                loc = vector3(379.42, -813.45, 29.03), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'whitewidow', targetLabel = 'Pick White Widow', menuLabel = 'Pick White Widow!'},
                loc = vector3(380.42, -813.53, 29.02), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'ogkush', targetLabel = 'Pick OG Kush', menuLabel = 'Pick OG Kush!'},
                loc = vector3(382.07, -813.59, 29.02), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'ogkush', targetLabel = 'Pick OG Kush', menuLabel = 'Pick OG Kush!'},
                loc = vector3(383.1, -813.5, 28.99), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'purplehaze', targetLabel = 'Pick Purple Haze', menuLabel = 'Pick Purple Haze!'},
                loc = vector3(378.32, -813.37, 29.02), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'purplehaze', targetLabel = 'Pick Purple Haze', menuLabel = 'Pick Purple Haze!'},
                loc = vector3(378.3, -811.64, 29.08), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'skunk', targetLabel = 'Pick Skunk', menuLabel = 'Pick Skunk!'},
                loc = vector3(379.26, -811.68, 29.04), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'skunk', targetLabel = 'Pick Skunk', menuLabel = 'Pick Skunk!'},
                loc = vector3(380.57, -811.65, 29.07), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'ak47', targetLabel = 'Pick AK47', menuLabel = 'Pick AK47!'},  
                loc = vector3(381.8, -811.65, 29.06), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'ak47', targetLabel = 'Pick AK47', menuLabel = 'Pick AK47!'},
                loc = vector3(382.76, -811.6, 29.01), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'joints', targetLabel = 'Roll Weed', menuLabel = 'Roll Weed!'},
                loc = vector3(375.7, -824.38, 29.09), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'oil', targetLabel = 'Make Oil', menuLabel = 'Make Oil!'},
                loc = vector3(382.38, -817.04, 29.41), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Open Shop', menuLabel = 'Open Shop!'},
                loc = vector3(374.57, -825.79, 29.05), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {StoreData = {type = 'ingridients', targetLabel = 'Open Shop', menuLabel = 'Open Shop!'},
                loc = vector3(379.53, -825.79, 29.07), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
        },
        Tills = {
            {loc = vector3(380.22, -827.26, 29.4), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {loc = vector3(375.55, -827.27, 29.4), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
        },
        trays = {
            {label = 'Open Tray', prop = 'prop_food_tray_01', loc = vector3(379.24, -827.39, 29.28), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 90.0, slots = 20, weight = 100000, job = 'bestbudz'},
            {label = 'Open Tray', prop = 'prop_food_tray_01', loc = vector3(375.52, -829.0, 29.28),  l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 90.0, slots = 20, weight = 100000, job = 'bestbudz'},
        },
        stash = {
            {label = 'Dry Storage', loc = vector3(377.07, -825.79, 29.06), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'bestbudz'},
            {label = 'Dry Storage', loc = vector3(375.7, -824.38, 29.09), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'bestbudz'},
            {label = 'Dry Storage', loc = vector3(373.94, -827.81, 29.02), l = 0.5, w = 1.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'bestbudz'},
        }
    },
    consumables = {
        blunt_ak47 = {anim = 'smoke2', label = 'Smoking', add = {hunger = -3, stress = -10}},
        blunt_og_kush = {anim = 'smoke2', label = 'Smoking', add = {hunger = -3, stress = -10}},
        blunt_purple_haze = {anim = 'smoke2', label = 'Smoking', add = {hunger = -3, stress = -10}},
        blunt_skunk = {anim = 'smoke2', label = 'Smoking', add = {hunger = -3, thirst = -10}},
        blunt_white_widow = {anim = 'smoke2', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_ak47 = {anim = 'smoke2', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_og_kush = {anim = 'smoke2', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_purple_haze = {anim = 'smoke2', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_skunk = {anim = 'smoke2', label = 'Smoking', add = {hunger = -3, thirst = -10}},
        joint_white_widow = {anim = 'smoke2', label = 'Smoking', add = {hunger = -3, stress = -10}},
        weed_gummies = {anim = 'eat', label = 'Eating', add = {hunger = 1, stress = -10}},
    },
}