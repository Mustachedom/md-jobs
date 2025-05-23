-- https://avoj.tebex.io/package/6060267 -- THIS IS FREE ON THE TEBEX!
-- MAKE SURE YOU ADD ITEMS > BEST BUDS 
-- (They use the Same Images & Items)

Jobs['weedshop'] = {
    CateringEnabled = false,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 469, color = 2, scale = 0.8, label = 'Weed Shop', loc = vector3(374.57, -825.79, 29.05)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vector4(-626.02, 287.51, 82.39, 180.0), label = 'Weed Shop'}
    },
    closedShopItems = {
        joint_whitewidow = {name = 'joint_whitewidow', price = 5},
        joint_ogkush = {name = 'joint_ogkush', price = 5},
        joint_purplehaze = {name = 'joint_purplehaze', price = 5},
        joint_skunk = {name = 'joint_skunk', price = 5},
        joint_ak47 = {name = 'joint_ak47', price = 5},
        blunt_whitewidow = {name = 'blunt_whitewidow', price = 5},
        blunt_ogkush = {name = 'blunt_ogkush', price = 5},
        blunt_purplehaze = {name = 'blunt_purplehaze', price = 5},
        blunt_skunk = {name = 'blunt_skunk', price = 5},
        blunt_ak47 = {name = 'blunt_ak47', price = 5},
        weed_oil = {name = 'weed_oil', price = 5},
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
        }
    },
    catering = {
        commission = 0.2,
        items = {
            {name = 'joint_whitewidow', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_ogkush', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_purplehaze', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_skunk',  minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_ak47',   minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_whitewidow', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_ogkush', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_purplehaze', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_skunk',  minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_ak47',   minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'weed_oil',     minPrice = 10, maxPrice = 20, maxAmount = 30},
        },
        Van = {
            taxi = {model = 'burrito', label = 'Burrito', plate = 'WeedMan', loc = vector4(364.85, -829.15, 29.29, 192.0), heading = 192.00},
        }
    },
    shops = {
        ingridients={
            {name = 'empty_weed_bag', price = 5, amount = 50},
            {name = 'rolling_paper', price = 5, amount = 50},
            {name = 'bluntwrap', price = 5, amount = 50},
            {name = 'weed_nutrition' , price = 5, amount = 50},
        },
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'whitewidow', targetLabel = 'Pick White Widow', menuLabel = 'Pick White Widow!'},
                loc = vector3(150.8684387207, -239.71032714844, 51.302871704102), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'weedshop'},
            {CraftData = {type = 'ogkush', targetLabel = 'Pick OG Kush', menuLabel = 'Pick OG Kush!'},
                loc = vector3(151.51245117188, -238.31314086914, 51.302871704102), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'weedshop'},
            {CraftData = {type = 'purplehaze', targetLabel = 'Pick Purple Haze', menuLabel = 'Pick Purple Haze!'},
                loc = vector3(151.86328125, -237.00411987305, 51.302871704102), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'weedshop'},
            {CraftData = {type = 'skunk', targetLabel = 'Pick Skunk', menuLabel = 'Pick Skunk!'},
                loc = vector3(152.5421295166, -235.310546875, 51.297054290771), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'weedshop'},
            {CraftData = {type = 'ak47', targetLabel = 'Pick AK47', menuLabel = 'Pick AK47!'},  
                loc = vector3(153.07093811035, -234.02696228027, 51.276222229004), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'weedshop'},
            {CraftData = {type = 'joints', targetLabel = 'Roll Weed', menuLabel = 'Roll Weed!'},
                loc = vector3(146.81190490723, -237.8708190918, 51.396114349365), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'weedshop'},
            {CraftData = {type = 'oil', targetLabel = 'Make Oil', menuLabel = 'Make Oil!'},
                loc = vector3(158.02426147461, -230.94273376465, 51.55135345459), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'weedshop'},
        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Open Shop', menuLabel = 'Open Shop!'},
                loc = vector3(160.66017150879, -221.57981872559, 54.603721618652), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'weedshop'},
        },
        Tills = {
            {loc = vector3(158.58695983887, -221.70268249512, 54.522632598877), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'weedshop'},
        },
        trays = {
            {label = 'Open Tray', prop = 'prop_food_tray_01', loc = vector3(379.24, -827.39, 29.28), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 90.0, slots = 20, weight = 100000, job = 'weedshop'},
            {label = 'Open Tray', prop = 'prop_food_tray_01', loc = vector3(375.52, -829.0, 29.28),  l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 90.0, slots = 20, weight = 100000, job = 'weedshop'},
        },
        stash = {
            {label = 'Storage', loc = vector3(161.39862060547, -225.29019165039, 54.30322265625), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'weedshop'},
            {label = 'Storage', loc = vector3(159.97087097168, -229.759765625, 54.138988494873), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'weedshop'},
            {label = 'Storage', loc = vector3(155.59909057617, -225.5242767334, 54.24808883667), l = 0.5, w = 1.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'weedshop'},
        }
    },
    consumables = {
        blunt_ak47 = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        blunt_og_kush = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        blunt_purple_haze = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        blunt_skunk = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, thirst = -10}},
        blunt_white_widow = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_ak47 = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_og_kush = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_purple_haze = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_skunk = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, thirst = -10}},
        joint_white_widow = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
    },
}
