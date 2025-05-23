Jobs['uwu'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 80, color = 2, scale = 0.5, label = 'Cat Cafe', loc = vector3(-584.06, -1058.73, 22.38)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vector4(-574.73, -1071.35, 22.33, 175.12), label = 'uwu Cafe Shop'}
    },
    closedShopItems = {
        blueberry_uwu_tea = {name = 'blueberry_uwu_tea', price = 5},
        chocolate_uwu_tea = {name = 'chocolate_uwu_tea', price = 5},
        uwu_iced_coffee = {name = 'uwu_iced_coffee', price = 5},
        matcha_uwu_tea = {name = 'matcha_uwu_tea', price = 5},
        peach_iced_tea = {name = 'peach_iced_tea', price = 5},
        strawberry_uwu_tea = {name = 'strawberry_uwu_tea', price = 5},
        uwu_kare_curry = {name = 'uwu_kare_curry', price = 5},
        uwu_omurice = {name = 'uwu_omurice', price = 5},
        uwu_bento_box = {name = 'uwu_bento_box', price = 5},
        uwu_creme_caramel = {name = 'uwu_creme_caramel', price = 5},
        kitty_doughnut = {name = 'kitty_doughnut', price = 5},
        uwu_cookie = {name = 'uwucookie', price = 5},
        uwu_anpan = {name = 'uwu_anpan', price = 5},
    },
    craftingStations = {
        coffee = {
            {anim = 'uncuff', give = {}, take = {coffee=1}, progtext = 'Pouring' },
        },
        boba = {
            {anim = 'uncuff',give = {oat_milk = 1, tea_bag = 1, boba = 1, blueberries = 1,}, take = {blueberry_uwu_tea = 1},          progtext = 'Pouring' },
            {anim = 'uncuff',give = {oat_milk = 1, tea_bag = 1, boba = 1,chocolate = 1}, take = {chocolate_uwu_tea = 1},            progtext = 'Pouring' },
            {anim = 'uncuff',give = {oat_milk = 1, espresso = 1}, take = {uwu_iced_coffee = 1},          progtext = 'Pouring' },
            {anim = 'uncuff',give = {oat_milk = 1, tea_bag = 1, boba = 1, matcha = 1}, take = {matcha_uwu_tea = 1},      progtext = 'Pouring' },
            {anim = 'uncuff',give = {oat_milk = 1, tea_bag = 1, boba = 1, peach = 1}, take = {peach_iced_tea = 1}, progtext = 'Pouring' },
            {anim = 'uncuff',give = {oat_milk = 1, tea_bag = 1, boba = 1,strawberry = 1}, take = {strawberry_uwu_tea = 1},  progtext = 'Pouring' },
        },
        sautee = {
            {anim = 'cocktail', give = {raw_chicken = 1, rice = 1, sliced_onion = 1}, take = {uwu_kare_curry = 1}, progtext = 'Cooking'},
            {anim = 'cocktail', give = {rice = 1, sliced_onion = 1, eggs = 1}, take = {uwu_omurice = 1}, progtext = 'Cooking'},
            {anim = 'cocktail', give = {rice = 1, tofu = 1, raw_chicken = 1 }, take = {uwu_bento_box = 1}, progtext = 'Cooking'},
        },
        chop = {
            {anim = 'uncuff', give = {onion = 1}, take = {sliced_onion = 1}, progtext = 'Chopping'},
        },
        oven = {
            {anim = 'uncuff', give = {uwu_dough = 1}, take = {uwu_anpan = 1}, progtext = 'Baking'},
            {anim = 'uncuff', give = {uwu_dough = 1}, take = {kitty_doughnut = 1}, progtext = 'Baking'},
            {anim = 'uncuff', give = {uwu_cookie_dough = 1}, take = {uwu_cookie = 1}, progtext = 'Baking'},
            {anim = 'uncuff', give = {uwu_creme = 1}, take = {uwu_creme_caramel = 1}, progtext = 'Baking'},
        }
    },
    catering = {
            commission = 0.2,
            items = {
                {name = 'uwu_kare_curry',     minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'uwu_omurice',        minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'uwu_bento_box',      minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'blueberry_uwu_tea',   minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'chocolate_uwu_tea',   minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'uwu_iced_coffee',     minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'matcha_uwu_tea',       minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'peach_iced_tea',       minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'strawberry_uwu_tea',   minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'uwu_anpan',        minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'kitty_doughnut',   minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'uwu_cookie',       minPrice = 10, maxPrice = 20, maxAmount = 30},
                {name = 'uwu_creme_caramel',   minPrice = 10, maxPrice = 20, maxAmount = 30},

            },
            Van = {
                uwu = {model = 'burrito', label = 'Burrito', plate = 'uwucat', loc = vector4(-609.21, -1034.1, 21.79, 78.33), heading = 28.78},
            }

    },
    shops = {
        ingridients = {
            {name = 'raw_chicken', price = 5, amount = 50},
            {name = 'rice', price = 5, amount = 50},
            {name = 'onion', price = 5, amount = 50},
            {name = 'eggs', price = 5, amount = 50},
            {name = 'tofu', price = 5, amount = 50},
        },
        tea = {
            {name = 'tea_bag',            price = 5, amount = 50},
            {name = 'oat_milk',          price = 5, amount = 50},
            {name = 'espresso',          price = 5, amount = 50},
            {name = 'boba',              price = 5, amount = 50},
            {name = 'strawberry',        price = 5, amount = 50},
            {name = 'blueberries',       price = 5, amount = 50},
            {name = 'peach',             price = 5, amount = 50},
            {name = 'matcha',            price = 5, amount = 50},
            {name = 'chocolate', price = 5, amount = 50},
            {name = 'lemon',             price = 5, amount = 50},

        }, 
        dry = {
            {name = 'uwu_dough', price = 5, amount = 50},
            {name = 'uwu_cookie_dough', price = 5, amount = 50},
            {name = 'uwu_creme', price = 5, amount = 50},
        }
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(-586.83, -1061.9, 22.50), l = 0.65, w = 0.75, lwr = 0.05, upr = 0.75, r = 180, job = 'uwu'},

            {CraftData = {type = 'boba', targetLabel = 'Pour Tea', menuLabel = 'Pour Tea!'},
                loc = vector3(-584.22, -1058.19, 22.77),   l = 0.65, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = 'uwu'},

            {CraftData = {type = 'oven', targetLabel = 'Bake Treats', menuLabel = 'Bake Treats!'},
                loc = vector3(-590.63, -1059.79, 22.66),  l = 0.5, w = 0.75, lwr = 0.75, upr = 0.75, r = 180, job = 'uwu'},

            {CraftData = {type = 'chop', targetLabel = 'Chop Food', menuLabel = 'Chop Food!', prop = 'v_res_mchopboard'},
                loc = vector3(-587.88, -1057.71, 22.26), l = 0.7, w = 0.6, lwr = 0.25, upr = 0.25, r = 180, job = 'uwu'},

            {CraftData = {type = 'chop', targetLabel = 'Chop Food', menuLabel = 'Chop Food!'},
                loc = vector3(-591.06, -1063.04, 22.32), l = 0.5, w = 0.6, lwr = 0.25, upr = 0.25, r = 180, job = 'uwu'},


            {CraftData = {type = 'sautee', targetLabel = 'Sautee Food!', menuLabel = 'Sautee Food!'},
                loc = vector3(-590.89, -1056.5, 22.38), l = 0.5, w = 0.75, lwr = 0.5, upr = 0.5, r = 180, job = 'uwu'},

        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Ingredient Shop', menuLabel = 'Ingredient Shop'},
                loc =  vector3(-590.63, -1058.6, 22.57), l = 0.5, w = 1.1, lwr = 0.85, upr = 0.85, r = 180, job = 'uwu'},
            {StoreData = {type = 'ingridients', targetLabel = 'Freezer Department', menuLabel = 'Freezer Department'},
                loc =  vector3(-588.24, -1067.09, 22.41), l = 0.50, w = 3.5, lwr = 0.75, upr = 0.75, r = 180, job = 'uwu'},
            {StoreData = {type = 'ingridients', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-590.41, -1068.02, 22.35), l = 0.50, w = 1.75, lwr = 0.75, upr = 0.75, r = 180, job = 'uwu'},
            {StoreData = {type = 'dry', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-598.36, -1067.86, 22.58), l = 4.0, w = 0.5, lwr = 1.25, upr = 1.25, r = 180, job = 'uwu'},
            {StoreData = {type = 'dry', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-598.44, -1066.22, 22.63), l = 4.0, w = 0.5, lwr = 1.25, upr = 1.25, r = 180, job = 'uwu'},
            {StoreData = {type = 'dry', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-598.05, -1065.0, 22.51), l = 4.0, w = 0.5, lwr = 1.25, upr = 1.25, r = 180, job = 'uwu'},
            {StoreData = {type = 'dry', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-598.24, -1063.39, 22.58), l = 4.0, w = 0.5, lwr = 1.25, upr = 1.25, r = 180, job = 'uwu'},
            {StoreData = {type = 'dry', targetLabel = 'Fridge Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-598.23, -1062.17, 22.42), l = 4.0, w = 0.5, lwr = 1.25, upr = 1.25, r = 180, job = 'uwu'},
            {StoreData = {type = 'tea', targetLabel = 'Tea Department', menuLabel = 'Fridge Department'},
                loc =  vector3(-584.45, -1058.14, 21.86), l = 0.5, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = 'uwu'},
        },
        Tills = {
            {loc = vector3(-584.06, -1058.73, 22.38), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 180,  commission = 0.2, job = 'uwu'},
            {loc = vector3(-584.05, -1061.44, 22.38), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 180,  commission = 0.2, job = 'uwu'},
        },
        stash = {
            {label = 'Dry Storage', loc = vector3(-585.95, -1055.58, 22.43), l = 1.1, w = 0.5, lwr = 1.0, upr = 1.0, r = 180, slots = 20, weight = 100000, job = 'uwu'},
            {label = 'Dry Storage', loc = vector3(-584.79, -1055.58, 22.47), l = 1.1, w = 0.5, lwr = 1.0, upr = 1.0, r = 180, slots = 20, weight = 100000, job = 'uwu'},
        },
        trays = { -- storages to place things for people | prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
            {label = 'Grab Food', loc = vector3(-584.1, -1062.06, 22.42), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 214, slots = 20, weight = 100000, job = 'uwu'},
            {label = 'Grab Food', loc = vector3(-584.03, -1059.24, 22.42), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 214, slots = 20, weight = 100000, job = 'uwu'},
            {label = 'Grab Food', loc = vector3(-586.51, -1062.96, 22.42), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 214, slots = 20, weight = 100000, job = 'uwu'},
        }
    },
    consumables = {
        blueberry_uwu_tea = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        chocolate_uwu_tea = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        kitty_doughnut = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        matcha_uwu_tea = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        peach_iced_tea = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        strawberry_uwu_tea = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        uwu_anpan = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        uwu_bento_box = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        uwu_cookie = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        uwu_creme_caramel = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        uwu_iced_coffee = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        uwu_kare_curry = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        uwu_omurice = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
    },
}