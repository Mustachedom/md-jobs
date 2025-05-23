Jobs['hornys'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 80, color = 2, scale = 0.5, label = 'hornys', loc = vector4(1251.36, -353.5, 74.02, 96.8)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vec4(1239.19, -367.96, 69.21, 217.86), label = 'Horny Little Shop'}
    },
    closedShopItems = {
        coffee =        {name = 'coffee', price = 5},
        ecola =         {name = 'ecola', price = 5},
        sprunk =        {name = 'sprunk', price = 5},
        bacon_cheese_fries = {name = 'bacon_cheese_fries', price = 5},
        cheese_fries =  {name = 'cheese_fries', price = 5},
        sirloin_burger = {name = 'sirloin_burger', price = 5},
        bacon_cheeseburger = {name = 'bacon_cheeseburger', price = 5},
        friedpick =     {name = 'friedpick', price = 5},
        wings =         {name = 'wings', price = 5},
        basket_fries =  {name = 'basket_fries', price = 5},

    },
    craftingStations = {
        coffee = {
            {anim = 'uncuff', give = {}, take = {coffee=1}, progtext = 'Pouring' },
        },
        soda = {
            {anim = 'uncuff', give = {}, take = {ecola=1}, progtext = 'Pouring' },
            {anim = 'uncuff', give = {}, take = {sprunk=1}, progtext = 'Pouring' },
        },
        chop = {
            {anim = 'uncuff', give = {onion = 1}, take = {sliced_onion = 1}, progtext = 'Chopping' },
            {anim = 'uncuff', give = {tomato = 1}, take = {sliced_tomato = 1}, progtext = 'Chopping' },
            {anim = 'uncuff', give = {potato = 1}, take = {uncooked_fries = 1}, progtext = 'Chopping' },
            {anim = 'uncuff', give = {pickle = 1}, take = {pickle_slices = 1}, progtext = 'Chopping' },
        },
        grill = {
            {anim = 'uncuff', give = {basket_fries = 1, burger_cheese = 1, raw_bacon = 1 }, take = {bacon_cheese_fries=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {burger_meat = 1, burger_bun = 1, lettuce = 1, raw_bacon = 1, sliced_onion = 1, sliced_tomato = 1}, take = {bacon_cheeseburger=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {basket_fries = 1, burger_cheese = 1}, take = {cheese_fries=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {burger_meat = 1, burger_bun = 1, sliced_onion = 1, sliced_tomato = 1}, take = {sirloin_burger=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {tortilla = 1, chicken_strips = 1}, take = {chicken_fajita=1}, progtext = 'Grilling' },
        },
        fryer = {
            {anim = 'uncuff', give = {uncooked_fries = 1}, take = {basket_fries=1}, progtext = 'Frying' },
            {anim = 'uncuff', give = {chicken_wings_raw = 1}, take = {wings=1}, progtext = 'Frying' },
            {anim = 'uncuff', give = {pickle_slices = 1}, take = {fried_pickles=1}, progtext = 'Frying' },
        }
    },
    catering = {
            commission = 0.2,
            items = {
                {name = 'bacon_cheese_fries', minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'cheese_fries',      minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'sirloin_burger',    minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'bacon_cheeseburger',minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'friedpick',        minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'wings',            minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'basket_fries',     minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'coffee',           minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'ecola',            minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'sprunk',           minPrice = 1, maxPrice = 4, maxAmount = 30},
            },
            Van = {
                hornys = {model = 'burrito', label = 'Burrito', plate = 'Horny1', loc = vec4(1242.17, -333.7, 69.08, 354.92)},
            }
    },
    shops = {
        ingridients = {
            {name = 'burger_patty',          price = 5, amount = 50},
            {name = 'burger_bun',           price = 5, amount = 50},
            {name = 'raw_bacon',            price = 5, amount = 50},
            {name = 'chicken_wings_raw',    price = 5, amount = 50},
            {name = 'potato',               price = 5, amount = 50},
            {name = 'pickle',               price = 5, amount = 50},
            {name = 'onion',                price = 5, amount = 50},
            {name = 'tomato',               price = 5, amount = 50},
            {name = 'lettuce',              price = 5, amount = 50},
            {name = 'burger_cheese',         price = 5, amount = 50},

        }
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(1246.26, -357.55, 69.16), l = 0.5, w = 0.5, lwr = 0.05, upr = 0.75, r = 165, job = 'hornys'},

            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(1246.41, -356.75, 69.39),   l = 0.65, w = 0.9, lwr = 0.25, upr = 0.75, r = 165, job = 'hornys'},

            {CraftData = {type = 'chop', targetLabel = 'Chop Items', menuLabel = 'Chop Items'},
                loc = vector3(1249.6, -355.6, 69.08),  l = 1.4, w = 0.8, lwr = 0.25, upr = 0.25, r = 165, job = 'hornys'},

            {CraftData = {type = 'grill', targetLabel = 'Grill Food', menuLabel = 'Grill Food!',},
                loc = vector3(1253.52, -355.52, 69.07), l = 1.0, w = 1.4, lwr = 0.25, upr = 0.25, r = 165, job = 'hornys'},

            {CraftData = {type = 'fryer', targetLabel = 'Fry Food', menuLabel = 'Fry Food!'},
                loc = vector3(1254.26, -352.87, 69.07), l = 1.0, w = 1.4, lwr = 0.75, upr = 0.25, r = 165, job = 'hornys'},
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(1251.67, -361.55, 69.19),   l = 0.65, w = 1.6, lwr = 0.25, upr = 0.75, r = 165, job = 'hornys'},

        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Ingredient Shop', menuLabel = 'Ingredient Shop'},
                loc =  vector3(1249.56, -352.39, 69.33), l = 1.5, w = 0.5, lwr = 0.9, upr = 0.9, r = 165, job = 'hornys'},
            {StoreData = {type = 'ingridients', targetLabel = 'Ingredient Shop', menuLabel = 'Ingredient Shop'},
                loc =  vector3(1248.09, -351.99, 69.36), l = 1.5, w = 0.5, lwr = 0.9, upr = 0.9, r = 165, job = 'hornys'},
        },
        Tills = {
            {loc = vector3(1250.78, -359.4, 69.17), l = 0.5, w = 0.5,  lwr = 0.10, upr = 0.25, r = 165,  commission = 0.2, job = 'hornys'},
            {loc = vector3(1252.89, -357.57, 69.17), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 165,  commission = 0.2, job = 'hornys'},
            {loc = vector3(1249.44, -359.03, 69.17), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 165,  commission = 0.2, job = 'hornys'},
            {loc = vector3(1248.13, -358.68, 69.16), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 165,  commission = 0.2, job = 'hornys'},
        },
        stash = {
            {label = 'Dry Storage', loc = vector3(1251.76, -357.16, 69.42), l = 1.5, w = 1.3, lwr = 0.5, upr = 0.4, r = 165, slots = 20, weight = 100000, job = 'hornys'},
        },
        trays = { -- storages to place things for people | prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
            {label = 'Grab Food', loc = vector3(1248.78, -358.97, 68.99), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 165, slots = 20, weight = 100000, job = 'hornys'},
            {label = 'Grab Food', loc = vector3(1250.07, -359.37, 68.99), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 165, slots = 20, weight = 100000, job = 'hornys'},
            {label = 'Grab Food', loc = vector3(1251.44, -359.72, 68.99), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 165, slots = 20, weight = 100000, job = 'hornys'},
            {label = 'Grab Food', loc = vector3(1253.03, -358.89, 69.01), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 165, slots = 20, weight = 100000, job = 'hornys'},
        }
    },
    consumables = {
        bacon_cheeseburger = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        bacon_cheese_fries = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        basket_fries = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        cheese_fries = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        ecola = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        sprunk = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        coffee = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        fried_pickles = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        sirloin_burger = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        wings = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
    },
}