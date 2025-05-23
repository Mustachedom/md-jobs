-- https://www.gta5-mods.com/maps/mlo-limeys-juice-bar-fivem-add-on-sp
Jobs['limeys'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 214, color = 2, scale = 0.5, label = 'Limeys', loc = vector3(253.36, -1019.27, 29.54)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vec4(249.7, -1025.82, 29.25, 120.7), label = 'Limeys Juice Shop'}
    },
    closedShopItems = {
        coffee         =   {name = 'coffee',            price = 5},
        banana_smoothie = {name = 'banana_smoothie',   price = 5},
        blueberry_smoothie = {name = 'blueberry_smoothie', price = 5},
        strawberry_smoothie = {name = 'strawberry_smoothie', price = 5},
        mango_smoothie  = {name = 'mango_smoothie',    price = 5},
        pomegranate_smoothie = {name = 'pomegranate_smoothie', price = 5},
        lemonade       = {name = 'lemonade',          price = 5},
        limeade        = {name = 'limeade',           price = 5},
    },
    craftingStations = {
        coffee = {
            {anim = 'uncuff',give = {}, take = {coffee=1}, progtext = 'Pouring' },
        },
        smoothies = {
            {anim = 'uncuff', give = {ice=1, banana=1}, take = {banana_smoothie = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {ice=1, blueberry=1}, take = {blueberry_smoothie = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {ice=1, strawberry=1}, take = {strawberry_smoothie = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {ice=1, mango=1}, take = {mango_smoothie = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {ice=1, pomegranate=1}, take = {pomegranate_smoothie = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {ice=1, lemon=1, sugar = 1}, take = {lemonade = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {ice=1, lime=1, sugar = 1}, take = {limeade = 1}, progtext = 'Making' },
        }
    },
    shops = {
        ingridients={
            {name = 'sugar',            price = 2, amount = 50},
            {name = 'ice',              price=2, amount=50 },
            {name = 'banana',           price=2, amount=50 },
            {name = 'blueberry',        price=2, amount=50 },
            {name = 'strawberry',      price=2, amount=50 },
            {name = 'mango',            price=2, amount=50 },
            {name = 'pomegranate',     price=2, amount=50 },
            {name = 'lemon',            price=2, amount=50 },
            {name = 'lime',             price=2, amount=50 },
        },
    },
    catering = {
        commission = 0.2,
        items = {
            {name = 'coffee',       minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'banana_smoothie', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blueberry_smoothie', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'strawberry_smoothie', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'mango_smoothie', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'pomegranate_smoothie', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'lemonade',     minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'limeade',      minPrice = 10, maxPrice = 20, maxAmount = 30},
        },
        Van = {
            limeys = {model = 'burrito', label = 'Burrito', plate = 'LIMEYSPK', loc = vec4(245.28, -1012.76, 29.14, 342.51)},
        }
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
            loc = vector3(251.94, -1023.17, 29.64),  l = 0.5, w = 0.7, lwr = 0.10, upr = 0.35, r = 160, job = 'limeys'},
            {CraftData = {type = 'smoothies', targetLabel = 'Pour Smoothie', menuLabel = 'Pour Smoothie!'},
            loc = vector3(251.4, -1022.8, 29.71),  l = 0.5, w = 0.7, lwr = 0.10, upr = 0.35, r = 160, job = 'limeys'},
            {CraftData = {type = 'smoothies', targetLabel = 'Pour Smoothie', menuLabel = 'Pour Smoothie!'},
            loc = vector3(252.58, -1019.26, 29.64),  l = 0.5, w = 0.7, lwr = 0.10, upr = 0.35, r = 160, job = 'limeys'},
        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Ingridient Shop', menuLabel = 'Ingridient Shop'},
                loc =  vector3(252.76, -1019.33, 29.07), l = 1.5, w =0.5, lwr = 0.25, upr = 0.25, r = 160, job = 'limeys'},
        },
        Tills = {
            {loc = vector3(253.38, -1022.38, 29.65), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 160,  commission = 0.2, job = 'limeys'},
        },
        stash = {
            {loc = vec3(253.8, -1016.9, 29.54), l = 0.75, w = 0.5, lwr = 0.50, upr = 0.50, r = 160, slots = 20, weight = 100000, job = 'limeys'},
        },
        trays = {
            {prop = 'prop_food_tray_01', label = 'Grab Drinks!', loc = vector3(253.71, -1021.59, 29.5),  l = 0.5, w = 0.5, lwr = 0.25, upr = 0.25, r = 160, slots = 20, weight = 100000, job = 'tequilala'},
        }
    },
    consumables = {
        banana_smoothie = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        blueberry_smoothie = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        lemonade = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        limeade = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        mango_smoothie = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        pomegranate_smoothie = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        strawberry_lemonade = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        strawberry_smoothie = {anim = 'drink', label = 'Drinking', add = {hunger = 10}},
    },
}
