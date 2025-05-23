Jobs['tacoshop'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 469, color = 2, scale = 0.8, label = 'Taco Shop', loc = vector3(13.6, -1606.69, 29.4)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vector4(13.6, -1606.69, 29.4, 147.99), label = 'Pablito Taco Shop'}
    },
    closedShopItems = {
    },
    craftingStations = {
        soda = {
            {anim = 'uncuff',give = {}, take = {ecola = 1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {sprunk = 1}, progtext = 'Pouring'},
        },
        hotplate = {
            {anim = 'uncuff',give = {ground_beef = 1, sliced_onion = 1, cilantro = 1, taco_shell = 1, taco_cheese = 1 }, take = {taco_beef = 1}, progtext = 'Cooking'},
            {anim = 'uncuff',give = {raw_chicken = 1, sliced_onion = 1, cilantro = 1, taco_shell = 1, taco_cheese = 1 }, take = {taco_chicken = 1}, progtext = 'Cooking'},
            {anim = 'uncuff',give = {fish_fillet = 1, sliced_onion = 1, cilantro = 1, taco_shell = 1, taco_cheese = 1 }, take = {taco_fish = 1}, progtext = 'Cooking'},
        },
        cuttingboard = {
            {anim = 'uncuff',give = {onion = 1}, take = {sliced_onion = 1}, progtext = 'Chopping'},
        },
    },
    catering = {
        commission = 0.2,
        items = {
            {name = 'taco_beef',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'taco_chicken',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'taco_fish',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'ecola',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'sprunk',     minPrice = 10, maxPrice = 20, maxAmount = 30},
        },
        Van = {
            tacoshop = {model = 'burrito', label = 'Burrito', plate = 'taco4lf', loc = vec4(16.63, -1594.74, 29.28, 50.18)}
        }
    },
    shops = {
        ingridients={
            {name = 'taco_shell',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'taco_cheese',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'cilantro',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'onion',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'ground_beef',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'fish_fillet',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'raw_chicken',     minPrice = 10, maxPrice = 20, maxAmount = 30},
        },
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(13.51, -1595.55, 29.43), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 140, job = 'tacoshop'},
            {CraftData = {type = 'hotplate', targetLabel = 'Grill Food', menuLabel = 'Grill Food!'},
                loc = vector3(10.89, -1599.01, 29.42), l = 1.0, w = 1.2, lwr = 0.25, upr = 0.75, r = 140, job = 'tacoshop'},
            {CraftData = {type = 'cuttingboard', targetLabel = 'Chop Food', menuLabel = 'Chop Food!'},
                loc = vector3(15.53, -1597.26, 29.34), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.50, r = 140, job = 'tacoshop'},  
        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Open Shop', menuLabel = 'Open Shop!'},
                loc = vector3(17.08, -1599.31, 29.49), l = 0.7, w = 0.7, lwr = 1.25, upr = 1.25, r = 140, job = 'tacoshop'},
            {StoreData = {type = 'ingridients', targetLabel = 'Open Shop', menuLabel = 'Open Shop!'},
                loc = vector3(12.51, -1600.61, 29.63), l = 1.7, w = 0.7, lwr = 1.25, upr = 1.25, r = 140, job = 'tacoshop'},
        },
        Tills = {
            { loc = vector3(9.77, -1605.59, 29.61), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 160, job = 'tacoshop'},
        },
        trays = {
            {label = 'Open Tray', prop = 'prop_food_tray_01', loc = vector3(10.68, -1605.42, 29.53), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 230.0, slots = 20, weight = 100000, job = 'tacoshop'},
        },
        stash = {
            {label = 'Dry Storage', loc = vector3(20.51, -1601.69, 29.34), l = 0.7, w = 1.7, lwr = 0.25, upr = 0.50, r = 230, slots = 20, weight = 100000, job = 'tacoshop'},
        }
    },
    consumables = {
        taco_beef = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        taco_chicken = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        taco_fish = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        ecola = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        sprunk = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
    },
}