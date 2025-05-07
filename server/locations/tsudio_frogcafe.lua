-- https://turbosaif.tebex.io/package/6389667

Jobs['frogperson'] = {
    CateringEnabled = false,
    closedShopsEnabled = true,
    Blip = {
        --{sprite = 106, color = 2, scale = 0.5, label = 'Burger Shot', loc = vector3(-1191.14, -897.66, 13.35)},
    },
    closedShops = {
        {ped = 'a_f_y_hipster_02', loc = vector4(1113.9280, -643.7979, 55.8214, 233.5980), label = 'Frog Cafe'}
    },
    closedShopItems = {
        macaron_a = {name = 'Macaron', price = 250},
        macaron_b = {name = 'Macaron', price = 250},
        cake_b = {name = 'Strawberry cake', price = 250},
        tiramisu_a = {name = 'Tiramisu', price = 250},
        mochi_a = {name = 'Lilly Mochi', price = 250},
        drink_a = {name = 'Frosty Iced Coffee', price = 100},
        drink_b = {name = 'Lillypad Iced Coffee', price = 100},
        drink_c = {name = 'Princess Iced Coffee', price = 100},
        drink_d = {name = 'Definitely Not Bloody Iced Coffee', price = 100},
        coffee_a = {name = 'Cute Coffee', price = 100},
        cappuccino_a = {name = 'Cute Cappuccino', price = 100},
        donut_a = {name = 'Sweet Donut', price = 250},
    },
    craftingStations = {
        soda = {        
            { anim = 'uncuff', give = {}, take = {drink_a = 1}, progtext = 'Mixing' },
            { anim = 'uncuff', give = {}, take = {drink_b = 1}, progtext = 'Mixing' },
            { anim = 'uncuff', give = {}, take = {drink_c = 1}, progtext = 'Mixing' },
            { anim = 'uncuff', give = {}, take = {drink_d = 1}, progtext = 'Mixing' },
        },
        coffee = {
            { anim = 'uncuff', give = {},    take = { coffee_a = 1 }, progtext = 'Brewing' },
            { anim = 'uncuff', give = {},    take = { cappuccino_a = 1 }, progtext = 'Brewing' },
        },
        fryer = { -- donuts mainly       
            { anim = 'uncuff', give = {flour = 1, milk = 1, egg = 1},  take = { donut_a = 1 }, progtext = 'Cooking' },
        },
        ingredients = { -- ingredients
            { anim = 'uncuff', give = {}, take = { flour = 1 }, progtext = 'Chopping' },
            { anim = 'uncuff', give = {}, take = { milk = 1 },  progtext = 'Chopping' },
            { anim = 'uncuff', give = {}, take = { egg = 1 },  progtext = 'Chopping' }
        },
        grill = {
        },
        bake = { -- bake
            { anim = 'uncuff', give = { flour = 1, milk = 1, egg = 1 }, take = { macaron_a = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { flour = 1, milk = 1, egg = 1 }, take = { macaron_b = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { flour = 1, milk = 1, egg = 1 }, take = { cake_b = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { flour = 1, milk = 1, egg = 1 }, take = { tiramisu_a = 1 }, progtext = 'Using' },
            { anim = 'uncuff', give = { flour = 1, milk = 1, egg = 1 }, take = { mochi_a = 1 }, progtext = 'Using' },
        }            
    },
    catering = {
            commission = 0.2,
            items = {
            },
            Van = {
                vu = {model = 'burrito', label = 'Burrito', plate = 'TEQCATER', loc = vector4(-563.02, 287.51, 82.39, 180.0), heading = 28.78},
            }

    },
    shops = {
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'soda', targetLabel = 'Pour Drinks', menuLabel = 'Pour Drinks'},
                loc = vector3(1113.8218, -640.8748, 56.9915), l = 0.65, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = jobloc},
            {CraftData = { type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee'},
                loc = vector3(1115.7621, -640.3949, 57.0113), l = 0.7, w = 0.6, lwr = 0.25, upr = 0.25, r = 180, job = jobloc},
            {CraftData = { type = 'fryer', targetLabel = 'Fry', menuLabel = 'Fry'},
                loc = vector3(1116.4873, -634.1001, 56.8131), l = 0.75, w = 0.5, lwr = 0.5, upr = 0.5, r = 180, job = jobloc},
            {CraftData = { type = 'ingredients', targetLabel = 'Grab Ingredients', menuLabel = 'Grab Ingredients'},
                loc = vector3(1118.8975, -638.6453, 56.9960), l = 2.5, w = 2.5, lwr = 0.10, upr = 0.25, r = 180, job = jobloc},
            {CraftData = { type = 'bake', targetLabel = 'Bake Goods', menuLabel = 'Bake Goods'},
                loc = vector3(1114.4725, -634.5179, 56.7670), l = 2.7, w = 1.4, lwr = 0.5, upr = 0.5, r = 180, job = jobloc},
        },
        Stores = {
            --{StoreData = {type = 'fridge', targetLabel = 'Fridge', menuLabel = 'Fridge'},
            --    loc = vector3(-1196.06, -897.27, 14.20), l = 0.7, w = 0.5, lwr = 0.75, upr = 1.25, r = 180, job = jobloc},
            --{StoreData = {type = 'ingridients', targetLabel = 'Ingridients', menuLabel = 'Ingridients'},
            --    loc = vector3(-1196.06, -897.27, 14.20), l = 0.7, w = 0.5, lwr = 0.75, upr = 1.25, r = 180, job = jobloc},
        },
       Tills = {
            { loc = vector3(1116.8439, -642.3646, 56.8509), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 168.27, commission = 0.8, job = jobloc },
        },
        trays = { -- storages to place things for people
            {label = 'Grab Food',loc = vec3(1116.0913, -642.5754, 56.8953), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 180, slots = 6, weight = 30000, job = jobloc},
        },
        stash = { -- storages to place things
            {label = 'Store Products', loc = vector3(1115.1011, -642.7894, 56.8111), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 180, slots = 100, weight = 600000, job = jobloc},  
        },
 
    },
    consumables = {
        macaron_a = {anim = 'eat', label = 'Eating', add = {hunger = 15}},
        macaron_b = {anim = 'eat', label = 'Eating', add = {hunger = 15}},
        cake_b = {anim = 'eat', label = 'Eating', add = {hunger = 15}},
        tiramisu_a = {anim = 'eat', label = 'Eating', add = {hunger = 15}},
        mochi_a = {anim = 'drink', label = 'Drinking', add = {thirst = 50}},
        drink_a = {anim = 'drink', label = 'Drinking', add = {thirst = 50}},
        drink_b = {anim = 'drink', label = 'Drinking', add = {thirst = 50}},
        drink_c = {anim = 'drink', label = 'Drinking', add = {thirst = 50}},
        drink_d = {anim = 'drink', label = 'Drinking', add = {thirst = 50}},
        coffee_a = {anim = 'drink', label = 'Drinking', add = {thirst = 50}},
        cappuccino_a = {anim = 'drink', label = 'Drinking', add = {thirst = 50}},
        donut_a = {anim = 'eat', label = 'Eating', add = {hunger = 15}},
    },
}
