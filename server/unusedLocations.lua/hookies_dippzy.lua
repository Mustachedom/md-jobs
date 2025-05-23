-- https://dipzzy.tebex.io/category/free
Jobs['hookies'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 214, color = 2, scale = 0.5, label = 'Hookies', loc = vector3(-2187.99, 4290.71, 49.17)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vec4(-2191.51, 4285.47, 49.18, 156.08), label = 'Hookies Shop'}
    },
    closedShopItems = {
        coffee = {name = 'coffee', price = 5},
        ecola = {name = 'ecola', price = 5},
        sprunk = {name = 'sprunk', price = 5},
        ambeer = {name = 'ambeer', price = 5},
        beer = {name = 'beer', price = 5},
        dusche = {name = 'dusche', price = 5},
        logger = {name = 'logger', price = 5},
        patochebeer = {name = 'patochebeer', price = 5},
        pisswaser = {name = 'pisswaser', price = 5},
        pisswaser_light = {name = 'pisswaser_light', price = 5},
        pisswaser_dark = {name = 'pisswaser_dark', price = 5},
        grilled_fish = {name = 'grilled_fish', price = 5},
        seafood_lobster_plate = {name = 'seafood_lobster_plate', price = 5},
        seafood_crabcakes = {name = 'seafood_crabcakes', price = 5},
        fish_taco = {name = 'fish_taco', price = 5},
        fishchips = {name = 'fishchips', price = 5},
        seafood_batter_fish = {name = 'seafood_batter_fish', price = 5},
        pinot_grigio = {name = 'pinot_grigio', price = 5},
        chardoney = {name = 'chardoney', price = 5},
    },
    catering = {
        commission = 0.2,
        items = {
            {name = 'grilled_fish',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'seafood_lobster_plate',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'seafood_crabcakes',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'fish_taco',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'fishchips',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'seafood_batter_fish',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'pinot_grigio',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'chardoney',     minPrice = 10, maxPrice = 20, maxAmount = 30},
        },
        Van = {
            hookies = {model = 'burrito', label = 'Burrito', plate = 'Hookies', loc = vec4(-2192.05, 4265.3, 48.58, 338.28)},
        }
    },
    craftingStations = {
        coffee = {
            {anim = 'uncuff',give = {}, take = {coffee=1}, progtext = 'Pouring'}
        },
        soda = {
            {anim = 'uncuff',give = {}, take = {ecola=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {sprunk=1}, progtext = 'Pouring'}
        },
        beer = {
            {anim = 'uncuff',give = {}, take = {ambeer=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {beer=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {dusche=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {logger=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {patochebeer=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {pisswaser=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {pisswaser_dark=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {pisswaser_light=1}, progtext = 'Crafting'}
        },
        cuttingboard = {
            {anim = 'uncuff',give = { onion = 1}, take = {sliced_onion=1}, progtext = 'Chopping'},
            {anim = 'uncuff',give = { fish = 1}, take = {fish_fillet=1}, progtext = 'Chopping'},
            {anim = 'uncuff',give = { potato = 1}, take = {uncooked_fries=1}, progtext = 'Chopping'},
            {anim = 'uncuff',give = { tomato = 1}, take = {sliced_tomato=1}, progtext = 'Chopping'}
        },
        grill = {
            {anim = 'uncuff',give = { fish = 1}, take = {grilled_fish=1}, progtext = 'Cooking'},
            {anim = 'uncuff',give = { lobster = 1}, take = {seafood_lobster_plate=1}, progtext = 'Cooking'},
            {anim = 'uncuff',give = { bread = 1, snowcrab = 1}, take = {seafood_crabcakes=1}, progtext = 'Cooking'},
            {anim = 'uncuff',give = { snowcrab = 1}, take = {seafood_kingcrab=1}, progtext = 'Cooking'},
            {anim = 'uncuff',give = { fish = 1}, take = {cooked_fish=1}, progtext = 'Cooking'}
        },
        stove = {
            {anim = 'uncuff',give = { sliced_tomato = 1, sliced_onion = 1, cooked_fish = 1, tortilla = 1}, take = {fish_taco=1}, progtext = 'Cooking'},
            {anim = 'uncuff',give = { uncooked_fries = 1, fish_fillet = 1}, take = {fishchips=1}, progtext = 'Cooking'},
            {anim = 'uncuff',give = { fish_fillet = 1, uncooked_fries = 1}, take = {seafood_batter_fish=1}, progtext = 'Cooking'}
        },
        wine = {
            {anim = 'uncuff',give = {}, take = {chardoney=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = {}, take = {pinot_grigio=1}, progtext = 'Pouring'}
        }
    },
    shops = {
        ingridients={
            {name = 'bread', price = 5, amount = 50},
            {name = 'fish', price = 5, amount = 50},
            {name = 'lobster', price = 5, amount = 50},
            {name = 'onion', price = 5, amount = 50},
            {name = 'potato', price = 5, amount = 50},
            {name = 'snowcrab', price = 5, amount = 50},
            {name = 'tortilla', price = 5, amount = 50},
            {name = 'tomato', price = 5, amount = 50}
        },
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'beer', targetLabel = 'Pour Beer', menuLabel = 'Pour Beer!'},
            loc = vector3(-2181.93, 4288.56, 49.68),  l = 0.5, w = 0.7, lwr = 0.10, upr = 0.35, r = 160, job = 'hookies'},
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
            loc = vector3(-2187.25, 4284.09, 49.48),  l = 0.5, w = 0.7, lwr = 0.10, upr = 0.35, r = 160, job = 'hookies'},
            {CraftData = {type = 'cuttingboard', targetLabel = 'Chop Food', menuLabel = 'Chop Food!'},
            loc = vector3(-2177.39, 4278.91, 49.28),  l = 0.5, w = 0.5, lwr = 0.10, upr = 0.35, r = 150, job = 'hookies'},
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(-2180.06, 4286.7, 49.23),l = 0.5, w = 0.5, lwr = 0.10, upr = 0.35, r = 150, job = 'hookies'},
            {CraftData = {type = 'grill', targetLabel = 'Grill Food', menuLabel = 'Grill Food!'},
                loc = vector3(-2177.01, 4280.08, 49.28),l = 0.5, w = 0.5, lwr = 0.10, upr = 0.35, r = 150, job = 'hookies'},
            {CraftData = {type = 'stove', targetLabel = 'Cook Food', menuLabel = 'Cook Food!'},
                loc = vector3(-2178.51, 4286.02, 49.11),l = 1.0, w = 1.0, lwr = 0.10, upr = 0.35, r = 150, job = 'hookies'},
            {CraftData = {type = 'wine', targetLabel = 'Pour Wine', menuLabel = 'Pour Wine!'},
                loc = vector3(-2186.62, 4284.59, 48.72),l = 1.0, w = 1.0, lwr = 0.10, upr = 0.35, r = 150, job = 'hookies'},
        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Ingridient Shop', menuLabel = 'Ingridient Shop'},
                loc =  vector3(-2180.54, 4279.42, 49.32),l = 0.5, w = 1.0, lwr = 0.5, upr = 1.0, r = 150, job = 'hookies'},
        },
        Tills = {
            {loc = vector3(-2184.21, 4289.11, 49.59), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 150,  commission = 0.2, job = 'limeys'},
            {loc = vector3(-2185.37, 4287.15, 49.59), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 150,  commission = 0.2, job = 'limeys'},
            {loc = vector3(-2186.56, 4285.18, 49.59), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 150,  commission = 0.2, job = 'limeys'},
        },
        stash = {
            {label = 'Open Stash', loc = vector3(-2185.47, 4286.59, 48.76), l = 0.75, w = 2.5, lwr = 0.50, upr = 0.50, r = 150, slots = 20, weight = 100000, job = 'limeys'},
        },
        trays = {
            {prop = 'prop_food_tray_01', label = 'Grab Drinks!', loc = vector3(253.71, -1021.59, 29.5),  l = 0.5, w = 0.5, lwr = 0.25, upr = 0.25, r = 160, slots = 20, weight = 100000, job = 'tequilala'},
        }
    },
    consumables = {
        beer = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        ambeer = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        chardoney = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        coffee = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        dusche = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        ecola = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        fishchips = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        fish_taco = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        grilled_fish = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        logger = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        patochebeer = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        pinot_grigio = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        pisswaser = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        pisswaser_dark = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        pisswaser_light = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        seafood_batter_fish = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        seafood_crabcakes = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        seafood_kingcrab = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        seafood_lobster_plate = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        sprunk = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
    },
}