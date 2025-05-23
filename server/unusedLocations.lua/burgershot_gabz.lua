Jobs['burgershot'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 106, color = 2, scale = 0.5, label = 'Burger Shot', loc = vec3(-1178.93, -888.79, 13.95)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vec4(-1178.93, -888.79, 13.95, 304.48), label = 'Burgershot Shop'}
    },
    closedShopItems = {
        bs_fries = {name = 'bs_fries', price = 5},
        bs_nuggets = {name = 'bs_nuggets', price = 5},
        bs_heartstopper = {name = 'bs_heartstopper', price = 5},
        bs_bleeder = {name = 'bs_bleeder', price = 5},
        bs_torpedo = {name = 'bs_torpedo', price = 5},
        bs_moneyshot = {name = 'bs_moneyshot', price = 5},
        bs_heartstopper_meal = {name = 'bs_heartstopper_meal', price = 5},
        bs_nugget_meal = {name = 'bs_nugget_meal', price = 5},
        bs_torpedo_meal = {name = 'bs_torpedo_meal', price = 5},
        bs_moneyshot_meal = {name = 'bs_moneyshot_meal', price = 5},
        sprunk = {name = 'sprunk', price = 5},
        ecola = {name = 'ecola', price = 5},
    },
    craftingStations = {
        soda = {
            { anim = 'uncuff', give = {}, take = {ecola = 1}, progtext = 'Pouring' },
            { anim = 'uncuff', give = {}, take = { sprunk = 1 }, progtext = 'Pouring' },             
        },
        coffee = {
            { anim = 'uncuff', give = {}, take = { coffee = 1 }, progtext = 'Pouring' } 
        },
        fryer = {            
            { anim = 'uncuff', give = { frozen_fries = 1, cooking_oil = 1 },    take = { bs_fries = 1 }, progtext = 'Cooking' },
            { anim = 'uncuff', give = { frozen_nuggets = 1, cooking_oil = 1 },  take = { bs_nuggets = 1 }, progtext = 'Cooking' }     
        },
        cuttingboard = {
            { anim = 'uncuff', give = { tomato = 1 }, take = { sliced_tomato = 1 }, progtext = 'Chopping' },
            { anim = 'uncuff', give = { onion = 1  }, take = { sliced_onion = 1 },  progtext = 'Chopping' }
        },
        grill = {
            { anim = 'uncuff', give = { burger_patty = 1 }, take = { burger_meat = 1 }, progtext = 'Grilling' },
            { anim = 'uncuff', give = { raw_chicken = 1 }, take = { cooked_chicken = 1 }, progtext = 'Cooking' }
        },
        assembly = {
            { anim = 'uncuff', give = { burger_bun = 1, burger_meat = 1, sliced_tomato = 1, lettuce = 1, sliced_onion = 1, burger_cheese = 1 }, take = { bs_heartstopper = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { burger_bun = 1, burger_meat = 1, sliced_tomato = 1, lettuce = 1, sliced_onion = 1, burger_cheese = 1 }, take = { bs_bleeder = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { burger_bun = 1, cooked_chicken = 1, sliced_tomato = 1, lettuce = 1, sliced_onion = 1, burger_cheese = 1 }, take = { bs_torpedo = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { burger_bun = 1, burger_meat = 1, sliced_tomato = 1, lettuce = 1, sliced_onion = 1, burger_cheese = 1 }, take = { bs_moneyshot = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { bs_heartstopper = 1, bs_fries = 1, sprunk = 1 }, take = { bs_heartstopper_meal = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { bs_moneyshot = 1, bs_fries = 1, ecola = 1 }, take = { bs_moneyshot_meal = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { bs_nuggets = 1, bs_fries = 1, sprunk = 1 }, take = { bs_nugget_meal = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { bs_torpedo = 1, bs_fries = 1, ecola = 1 }, take = { bs_torpedo_meal = 1 }, progtext = 'Using' }
        }        
    },
    catering = {
            commission = 0.2,
            items = {
                {name = 'bs_fries',     minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'bs_nuggets',   minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'bs_heartstopper', minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'bs_bleeder',   minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'bs_torpedo',   minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'bs_moneyshot', minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'sprunk',        minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'ecola',         minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'bs_heartstopper_meal', minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'bs_nugget_meal', minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'bs_torpedo_meal', minPrice = 5, maxPrice = 10, maxAmount = 30},
                {name = 'bs_moneyshot_meal', minPrice = 5, maxPrice = 10, maxAmount = 30},

            },
            Van = {
                burgershot = {model = 'burrito', label = 'Burrito', plate = 'BSCater', loc = vec4(-1171.46, -880.38, 14.1, 302.39)},
            }

    },
    shops = {
        fridge = {
            { name = 'frozen_fries', price = 3,  amount = 50, },
            { name = 'frozen_nuggets', price = 3,  amount = 50, },
            { name = 'burger_patty', price = 2,  amount = 50, },
            { name = 'raw_chicken', price = 1,  amount = 50, },
            { name = 'burger_cheese', price = 1,  amount = 50, },
        },
        ingridients = {

            { name = 'burger_bun', price = 1, amount = 50 },
            {name = 'cooking_oil', price = 2, amount = 50},
            {name = 'lettuce', price = 1, amount = 50},
            {name = 'tomato', price = 1, amount = 50},
            {name = 'onion', price = 1, amount = 50},
        }
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(-1190.89, -898.42, 14.2), l = 0.50, w = 0.50, lwr = 0.05, upr = 0.75, r = 35.0, job = 'burgershot'},
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(-1192.0, -896.86, 14.33), l = 0.50, w = 0.50, lwr = 0.05, upr = 0.75, r = 35.0, job = 'burgershot'},
            
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(-1191.62, -897.77, 14.1),   l = 1.3, w = 0.65, lwr = 0.25, upr = 0.50, r = 35, job = 'burgershot'},

            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(-1189.75, -898.08, 14.16),  l = 0.5, w = 0.75, lwr = 0.05, upr = 0.75, r = 180, job = 'burgershot'},

            {CraftData = {type = 'fryer', targetLabel = 'Fry Food', menuLabel = 'Fry Food',},
                loc = vector3(-1187.38, -899.86, 14.09), l = 1.3, w = 0.9, lwr = 0.25, upr = 0.25, r = 35, job = 'burgershot'},

            {CraftData = {type = 'grill', targetLabel = 'Grill Patties', menuLabel = 'Grill Patties'},
                loc = vector3(-1186.85, -900.57, 14.09), l = 1.3, w = 0.9, lwr = 0.25, upr = 0.25, r = 35, job = 'burgershot'},

            {CraftData = {type = 'cuttingboard', targetLabel = 'Chop Ingridients', menuLabel = 'Chop Ingridients'},
                loc = vector3(-1188.27, -900.79, 13.8), l = 1.0, w = 1.5, lwr = 0.25, upr = 0.25, r = 35, job = 'burgershot'},

            {CraftData = {type = 'assembly', targetLabel = 'Assemble Food', menuLabel = 'Assemble Food'},
                loc = vector3(-1185.78, -899.27, 14.07), l = 0.5, w = 0.75, lwr = 0.5, upr = 0.5, r = 35, job = 'burgershot'},
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(-1190.91, -905.56, 14.15), l = 1.0, w = 1.2, lwr = 0.5, upr = 0.5, r = 35, job = 'burgershot'},
        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-1191.14, -897.66, 13.35), l = 0.50, w = 1.75, lwr = 0.75, upr = 0.55, r = 125, job = 'burgershot'},
            {StoreData = {type = 'fridge', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-1183.53, -900.58, 14.0), l = 2.5, w = 0.5, lwr = 1.25, upr = 1.25, r = 35, job = 'burgershot'},
            {StoreData = {type = 'fridge', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-1192.3, -898.26, 13.94), l = 2.5, w = 0.5, lwr = 1.25, upr = 1.25, r = 35, job = 'burgershot'},
            {StoreData = {type = 'fridge', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-1192.48, -899.63, 13.96), l = 1.5, w = 0.5, lwr = 1.25, upr = 1.25, r = 125, job = 'burgershot'},
            {StoreData = {type = 'ingridients', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-1196.07, -904.03, 13.41), l = 1.0, w = 0.5, lwr = 0.5, upr = 0.5, r = 85, job = 'burgershot'},
            
        },
        Tills = {
            {loc = vector3(-1187.52, -893.64, 14.11), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 35.0,  commission = 0.2, job = 'burgershot'},
            {loc = vector3(-1189.05, -894.65, 14.12), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 35.0,  commission = 0.2, job = 'burgershot'},
            {loc = vector3(-1190.56, -895.71, 14.11), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 35.0,  commission = 0.2, job = 'burgershot'},
            {loc = vector3(-1194.74, -905.13, 13.94), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 80.0,  commission = 0.2, job = 'burgershot'},
        },
        stash = {
            {label = 'Food Warmer', loc = vector3(-1187.78, -896.71, 14.46), l = 1.4, w = 1.3, lwr = 0.5, upr = 0.5, r = 35, slots = 20, weight = 100000, job = 'burgershot'},
            {label = 'Food Warmer', loc = vector3(-1191.48, -903.96, 14.41), l = 1.4, w = 1.0, lwr = 0.5, upr = 0.5, r = 35, slots = 20, weight = 100000, job = 'burgershot'},
            {label = 'Dry Storage', loc = vector3(-584.79, -1055.58, 22.47), l = 1.1, w = 0.5, lwr = 1.0, upr = 1.0, r = 180, slots = 20, weight = 100000, job = 'burgershot'},
        },
        trays = { -- storages to place things for people | prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
            {label = 'Grab Food', loc = vector3(-1188.01, -894.0, 13.95),  l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 35.0, slots = 20, weight = 100000, job = 'burgershot'},
            {label = 'Grab Food', loc = vector3(-1188.48, -894.31, 13.95), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 35.0, slots = 20, weight = 100000, job = 'burgershot'},
            {label = 'Grab Food', loc = vector3(-1189.55, -895.03, 13.95), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 35.0, slots = 20, weight = 100000, job = 'burgershot'},
            {label = 'Grab Food', loc = vector3(-1190.01, -895.32, 13.95), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 35.0, slots = 20, weight = 100000, job = 'burgershot'},
            {label = 'Grab Food', loc = vector3(-1191.17, -896.09, 13.95), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 35.0, slots = 20, weight = 100000, job = 'burgershot'},
            {label = 'Grab Food', loc = vector3(-1191.62, -896.41, 13.95), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 35.0, slots = 20, weight = 100000, job = 'burgershot'},
            {label = 'Grab Food', loc = vector3(-1193.92, -905.43, 13.78), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 80.0, slots = 20, weight = 100000, job = 'burgershot'},
        }
    },
    consumables = {
        bs_bleeder = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        bs_fries = {anim = 'eat', label = 'Eating', add = {hunger = 5}},
        bs_heartstopper = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        bs_heartstopper_meal = {anim = 'eat', label = 'Consuming', add = {hunger = 25, thirst = 10}},
        bs_moneyshot = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        bs_moneyshot_meal = {anim = 'eat', label = 'Eating', add = {hunger = 25, thirst = 10}},
        bs_nuggets = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        bs_nugget_meal = {anim = 'eat', label = 'Eating', add = {hunger = 25, thirst = 10}},
        bs_torpedo = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        bs_torpedo_meal = {anim = 'eat', label = 'Eating', add = {hunger = 25, thirst = 10}},
        ecola = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        sprunk = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
    },
}