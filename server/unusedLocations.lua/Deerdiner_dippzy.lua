Jobs['deerdiner'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 469, color = 2, scale = 0.8, label = 'Deer Diner', loc = vector3(454.46, 131.0, 99.4)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vec4(454.52, 131.05, 99.4, 151.87), label = 'Deer Diner Shop'}
    },
    closedShopItems = {
        deer_cheeseburger = {name = 'deer_cheeseburger', price = 5},
        bacon_cheeseburger = {name = 'bacon_cheeseburger', price = 5},
        hot_wings = {name = 'hot_wings', price = 5},
        basket_fries = {name = 'basket_fries', price = 5},
        coffee = {name = 'coffee', price = 5},
        ecola = {name = 'ecola', price = 5},
        sprunk = {name = 'sprunk', price = 5},
        sirloin_steak = {name = 'sirloin_steak', price = 5},
        bacon_and_eggs = {name = 'bacon_and_eggs', price = 5},
        hashbrown = {name = 'hashbrowns', price = 5},
    },
    craftingStations = {
       coffee = {
            {anim = 'uncuff',give = {}, take = {coffee = 1}, progtext = 'Pouring'},
        },
        soda = {
            {anim = 'uncuff',give = {}, take = {ecola = 1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {sprunk = 1}, progtext = 'Pouring'},
        },
        hotplate = {
            {anim = 'uncuff',give = {burger_meat = 1}, take = {burger_patty = 1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {raw_steak = 1}, take = {cooked_steak = 1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {raw_chicken = 1}, take = {cooked_chicken = 1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {raw_bacon = 1, eggs = 2}, take = {bacon_and_eggs = 1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {potato = 1}, take = {hashbrown = 1}, progtext = 'Pouring'},
            {anim = 'uncuff', give = {sirloin_steak = 1}, take = {cooked_steak = 1}, progtext = 'Pouring'},
        },
        cuttingboard = {
            {anim = 'uncuff', give = {onion = 1}, take = {sliced_onion = 1}, progtext = 'Chopping'},
            {anim = 'uncuff', give = {pickle = 1}, take = {pickle_slices = 1}, progtext = 'Chopping'},
            {anim = 'uncuff', give = {tomato = 1}, take = {sliced_tomato = 1}, progtext = 'Chopping'},
            {anim = 'uncuff', give = {potato = 1}, take = {uncooked_fries = 1}, progtext = 'Chopping'},
        },
        stove = {
            {anim = 'uncuff', give = {burger_meat = 1, burger_cheese = 1, burger_bun = 1, pickle_slices = 1, sliced_tomato = 1, sliced_onion = 1}, take = {deer_cheeseburger = 1}, progtext = 'Cooking'},
            {anim = 'uncuff', give = {burger_meat = 1, burger_bun = 1, pickle_slices = 1, sliced_tomato = 1, sliced_onion = 1, raw_bacon = 1}, take = {bacon_cheeseburger = 1}, progtext = 'Cooking'},
        },
        fryer = {
            {anim = 'uncuff', give = {uncooked_fries = 1}, take = {basket_fries = 1}, progtext = 'Cooking'},
            {anim = 'uncuff', give = {chicken_wings_raw = 1}, take = {hot_wings = 1}, progtext = 'Cooking'},
        },

    },
    catering = {
        commission = 0.2,
        items = {
            {name = 'basket_fries',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'deer_cheeseburger',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'bacon_cheeseburger',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'hot_wings',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'coffee',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'ecola',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'sprunk',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'sirloin_steak',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'bacon_and_eggs',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'hashbrown',     minPrice = 10, maxPrice = 20, maxAmount = 30},
        },
        Van = {
            deerdiner = {model = 'burrito', label = 'Burrito', plate = 'DeerDin', loc = vec4(452.42, 118.26, 99.08, 74.45)},
        }
    },
    shops = {
        ingridients={
            {name = 'eggs', price = 5, amount = 50},
            {name = 'onion', price = 5, amount = 50},
            {name = 'tomato', price = 5, amount = 50},
            {name = 'potato' , price = 5, amount = 50},
            {name = 'pickle', price = 5, amount = 50},
            {name = 'burger_bun', price = 5, amount = 50},
            {name = 'burger_patty', price = 5, amount = 50},
            {name = 'burger_cheese', price = 5, amount = 50},
            {name = 'raw_steak', price = 5, amount = 50},
            {name = 'raw_chicken', price = 5, amount = 50},
            {name = 'raw_bacon', price = 5, amount = 50},
            {name = 'chicken_wings_raw', price = 5, amount = 50},

        },
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(460.5, 139.35, 99.59), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 250, job = 'deerdiner'},
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(460.18, 138.58, 99.53), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 250, job = 'deerdiner'},
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(458.25, 139.2, 99.34), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 250, job = 'deerdiner'},
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(458.48, 139.64, 99.42), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 250, job = 'deerdiner'},
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(458.86, 140.58, 99.48), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 250, job = 'deerdiner'},
            {CraftData = {type = 'hotplate', targetLabel = 'Grill Food', menuLabel = 'Grill Food!'},
                loc = vector3(460.94, 149.53, 99.51), l = 1.0, w = 1.2, lwr = 0.25, upr = 0.75, r = 250, job = 'deerdiner'},
            {CraftData = {type = 'cuttingboard', targetLabel = 'Chop Food', menuLabel = 'Chop Food!'},
                loc = vector3(459.85, 149.88, 99.45), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.50, r = 250, job = 'deerdiner'},
            {CraftData = {type = 'stove', targetLabel = 'Cook Food', menuLabel = 'Cook Food!'},
                loc = vector3(462.43, 151.47, 99.31), l = 0.8, w = 1.2, lwr = 0.25, upr = 0.75, r = 250, job = 'deerdiner'},
            {CraftData = {type = 'fryer', targetLabel = 'Fry Food', menuLabel = 'Fry Food!'},  
                loc = vector3(465.44, 150.32, 99.34), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 250, job = 'deerdiner'},
        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Open Shop', menuLabel = 'Open Shop!'},
                loc = vector3(457.58, 152.4, 99.55), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.75, r = 250, job = 'deerdiner'},
            {StoreData = {type = 'ingridients', targetLabel = 'Open Shop', menuLabel = 'Open Shop!'},
                loc = vector3(458.17, 153.02, 99.26), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.75, r = 250, job = 'deerdiner'},
            {StoreData = {type = 'ingridients', targetLabel = 'Open Shop', menuLabel = 'Open Shop!'},
                loc = vector3(464.28, 148.37, 98.96), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.40, r = 250, job = 'deerdiner'},
        },
        Tills = {
            {prop = 'p_till_01_s', loc = vector3(458.91, 137.36, 99.34), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 160, job = 'deerdiner'},
        },
        trays = {
            {label = 'Open Tray', prop = 'prop_food_tray_01', loc = vector3(459.46, 136.56, 99.59), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 250.0, slots = 20, weight = 100000, job = 'deerdiner'},
        },
        stash = {
            {label = 'Dry Storage', loc = vector3(463.71, 146.79, 98.94), l = 0.7, w = 1.7, lwr = 0.25, upr = 0.50, r = 250, slots = 20, weight = 100000, job = 'deerdiner'},
            {label = 'Dry Storage', loc = vector3(456.64, 149.55, 98.92), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'deerdiner'},
            {label = 'Dry Storage', loc = vector3(458.85, 137.51, 98.91), l = 0.5, w = 1.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'deerdiner'},
        }
    },
    consumables = {
        bacon_and_eggs = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        bacon_cheeseburger = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        basket_fries = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        deer_cheeseburger = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        hashbrown = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        hot_wings = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        sirloin_steak = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        sprunk = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        ecola = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        coffee = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        
    },
}