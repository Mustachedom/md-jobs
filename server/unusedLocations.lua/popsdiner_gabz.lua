Jobs['popsdiner'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 267, color = 2, scale = 0.5, label = 'Pops Diner', loc = vector3(1591.95, 6447.57, 25.32)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vector4(1591.95, 6447.57, 25.32, 143.8), label = 'Pops Diner Shop'}
    },
    closedShopItems = {
        chicken_soup =  {name = 'chicken_soup',     price = 5},
        chili =         {name = 'chili',            price = 5},
        hotdog =        {name = 'hotdog',           price = 5},  
        baked_potato =  {name = 'baked_potato',     price = 5},
        bacon_eggs =    {name = 'bacon_eggs',       price = 5},
        popsburger =    {name = 'popsburger',       price = 5},
        steak_and_potato =  {name = 'steak_and_potato',     price = 5},
        ecola =         {name = 'ecola',            price = 5},
        sprunk =        {name = 'sprunk',           price = 5},
        coffee =        {name = 'coffee',           price = 5},
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
        },
        grill = {
            {anim = 'uncuff', give = {canned_chicken_soup = 1}, take = {chicken_soup=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {canned_chili = 1}, take = {chili=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {burger_patty = 1}, take = {burger_meat=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {hotdogweiner = 1, hotdog_bun = 1}, take = {hotdog=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {potato = 1}, take = {baked_potato=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {raw_bacon = 1, eggs = 2}, take = {bacon_eggs=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {burger_bun = 1, burger_meat = 1, sliced_tomato = 1, sliced_onion = 1}, take = {popsburger=1}, progtext = 'Grilling' },
            {anim = 'uncuff', give = {raw_steak = 1, potato = 1}, take = {steak_and_potato=1}, progtext = 'Grilling' },
        }
    },
    catering = {
            commission = 0.2,
            items = {
                {name = 'chicken_soup', minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'chili',        minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'hotdog',       minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'baked_potato', minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'bacon_eggs',   minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'popsburger',   minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'steak_and_potato', minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'ecola',        minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'coffee',       minPrice = 1, maxPrice = 4, maxAmount = 30},
                {name = 'sprunk',       minPrice = 1, maxPrice = 4, maxAmount = 30},

            },
            Van = {model = 'burrito', label = 'Burrito', plate = 'PopCater', loc = vector4(1605.18, 6441.77, 25.47, 155.49), heading = 28.78},
    },
    shops = {
        ingridients = {
            {name = 'canned_chicken_soup',  price = 5, amount = 50},
            {name = 'canned_chili',         price = 5, amount = 50},
            {name = 'potato',               price = 5, amount = 50},
            {name = 'burger_patty',          price = 5, amount = 50},
            {name = 'burger_bun',           price = 5, amount = 50},
            {name = 'hotdog_bun',            price = 5, amount = 50},
            {name = 'hotdogweiner',         price = 5, amount = 50},
            {name = 'eggs',                 price = 5, amount = 50},
            {name = 'raw_bacon',            price = 5, amount = 50},
            {name = 'raw_steak',            price = 5, amount = 50},
            {name = 'tomato',               price = 5, amount = 50},
            {name = 'onion',                price = 5, amount = 50},
        }
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(1593.06, 6456.75, 26.21), l = 0.5, w = 0.9, lwr = 0.05, upr = 0.75, r = 155, job = 'popsdiner'},

            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(1592.17, 6456.69, 26.42),   l = 0.65, w = 0.5, lwr = 0.25, upr = 0.25, r = 155, job = 'popsdiner'},

            {CraftData = {type = 'grill', targetLabel = 'Grill', menuLabel = 'Grill'},
                loc = vector3(1587.91, 6458.9, 26.26),  l = 1.4, w = 0.5, lwr = 0.25, upr = 0.25, r = 155, job = 'popsdiner'},

            {CraftData = {type = 'chop', targetLabel = 'Chop Food', menuLabel = 'Chop Food!',},
                loc = vector3(1586.96, 6459.27, 26.16), l = 0.4, w = 0.6, lwr = 0.25, upr = 0.25, r = 155, job = 'popsdiner'},

            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(1586.06, 6459.72, 26.32), l = 1.3, w = 0.6, lwr = 0.75, upr = 0.25, r = 155, job = 'popsdiner'},
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(1594.13, 6455.93, 26.31), l = 0.5, w = 0.6, lwr = 0.75, upr = 0.5, r = 155, job = 'popsdiner'}

        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Ingredient Shop', menuLabel = 'Ingredient Shop'},
                loc =  vector3(1588.91, 6456.22, 25.58), l = 1.5, w = 0.5, lwr = 0.5, upr = 0.4, r = 155, job = 'popsdiner'},       
        },
        Tills = {
            {loc = vector3(1589.14, 6458.27, 26.33), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 155,  commission = 0.2, job = 'popsdiner'},
            {loc = vector3(1595.3, 6455.35, 26.33), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 155,  commission = 0.2, job = 'popsdiner'},
        },
        stash = {
            {label = 'Dry Storage', loc = vector3(1587.02, 6457.13, 25.7), l = 1.5, w = 0.5, lwr = 0.5, upr = 0.4, r = 155, slots = 20, weight = 100000, job = 'popsdiner'},
            {label = 'Dry Storage', loc = vector3(1590.71, 6455.4, 25.7), l = 1.5, w = 0.5, lwr = 0.5, upr = 0.4, r = 155, slots = 20, weight = 100000, job = 'popsdiner'},
        },
        trays = { -- storages to place things for people | prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
            {label = 'Grab Food', loc = vector3(1593.57, 6453.77, 26.21), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 155, slots = 20, weight = 100000, job = 'popsdiner'},
            {label = 'Grab Food', loc = vector3(1590.32, 6455.25, 26.21), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 155, slots = 20, weight = 100000, job = 'popsdiner'},
            {label = 'Grab Food', loc = vector3(1586.66, 6457.04, 26.21), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 150, slots = 20, weight = 100000, job = 'popsdiner'},
            {label = 'Grab Food', loc = vector3(1584.73, 6458.45, 26.21), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 214, slots = 20, weight = 100000, job = 'popsdiner'},
        }
    },
    consumables = {
        bacon_eggs = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        baked_potato = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        chicken_soup = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        chili = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        hotdog = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        popsburger = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        steak_and_potato = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
    },
}