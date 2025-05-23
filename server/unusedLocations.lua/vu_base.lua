Jobs['vu'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 279, color = 2, scale = 0.5, label = 'Vanilla Unicorn', loc = vector3(129.02, -1283.25, 29.27)},
    },
    closedShops = { -- allows multiple peds with their own inventory label MUST BE UNIQUE
        {ped = 'mp_m_freemode_01', loc = vector4(129.02, -1283.25, 29.27, 120.67), label = 'Vanilla Unicorn Shop'}
    },
    closedShopItems = { -- items allowed in closed shops
        vodka_soda = {name = 'vodka_soda', price = 5},
        moscow_mule = {name = 'moscow_mule', price = 5},
        tequila_sunrise = {name = 'tequila_sunrise', price = 5},
        whiskey_sour = {name = 'whiskey_sour', price = 5},
        gin_and_tonic = {name = 'gin_and_tonic', price = 5},
        rum_and_coke = {name = 'rum_and_coke', price = 5},
        gin_fizz = {name = 'gin_fizz', price = 5},
        rum_punch = {name = 'rum_punch', price = 5},
        screwdriver = {name = 'screwdriver', price = 5},
        mojito = {name = 'mojito', price = 5},
        daiquiri = {name = 'daiquiri', price = 5},
        coffee = {name = 'coffee', price = 5},

    },
    craftingStations = { --must match the key value in locations
        cocktail = {
            {anim = 'cocktail', give = {ice = 1, soda_water = 1, vodka = 1},                    take = {vodka_soda = 1},        progtext = 'Making'},
            {anim = 'cocktail', give = {vodka = 1, ginger_ale = 1, lime = 1, ice = 1},          take = {moscow_mule = 1},       progtext = 'Making'},
            {anim = 'cocktail', give = {tequila = 1, orange = 1, grenadine = 1, ice = 1},       take = {tequila_sunrise = 1},   progtext = 'Making'},
            {anim = 'cocktail', give = {whiskey = 1, lemon = 1, sugar = 10, ice = 1},            take = {whiskey_sour = 1},      progtext = 'Making'},
            {anim = 'cocktail', give = {gin = 1, tonic_water = 1, ice = 1, lime = 1},           take = {gin_and_tonic = 1},     progtext = 'Making'},
            {anim = 'cocktail', give = {rum = 1, ecola = 1, ice = 1},                           take = {rum_and_coke = 1},      progtext = 'Making'},
            {anim = 'cocktail', give = {gin = 1, soda_water = 1, lime = 1, sugar = 1, ice = 1}, take = {gin_fizz = 1},          progtext = 'Making'},
            {anim = 'cocktail', give = {rum = 1, lime = 1, orange = 1, grenadine = 1, ice = 1}, take = {rum_punch = 1},         progtext = 'Making'},
            {anim = 'cocktail', give = {vodka = 1, orange = 1, ice = 1},                        take = {screwdriver = 1},       progtext = 'Making'},
            {anim = 'cocktail', give = {rum = 1, lime = 1, sugar = 1, soda_water = 1, ice = 1}, take = {mojito = 1},            progtext = 'Making'},
            {anim = 'cocktail', give = {rum = 1, lime = 1, sugar = 1, ice = 1},                 take = {daiquiri = 1},          progtext = 'Making'}
        },
        coffee = {
            {anim = 'uncuff',give = {}, take = {coffee = 1}, progtext = 'Pouring' }
        },
        ice = {
            {anim = 'uncuff', give = {}, take = {ice = 1}, progtext = 'Scooping' }
        }
    },
    catering = { -- accessible in Till
        commission = 0.2,
        items = {
            {name = 'vodka',        minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'tequila',      minPrice = 10, maxPrice = 20, maxAmount = 30},
        },
        Van = {model = 'burrito', label = 'Burrito', plate = 'VUCATER', loc = vector4(144.72, -1300.25, 28.89, 121.44), heading = 118.78},
    },
    shops = { -- must match the key value in locations
        ingridients = {
            {name = 'vodka',        price = 5, amount = 50},
            {name = 'tequila',      price = 5, amount = 50},
            {name = 'whiskey',      price = 5, amount = 50},
            {name = 'rum',          price = 5, amount = 50},
            {name = 'gin',          price = 5, amount = 50},
            {name = 'lime',         price = 5, amount = 50},
            {name = 'lemon',        price = 5, amount = 50},
            {name = 'orange',       price = 5, amount = 50},
            {name = 'sugar',        price = 5, amount = 50},
            {name = 'salt',         price = 5, amount = 50},
            {name = 'ice',          price = 5, amount = 50},
            {name = 'soda_water',   price = 5, amount = 50},
            {name = 'tonic_water',  price = 5, amount = 50},
            {name = 'ecola',        price = 5, amount = 50},
            {name = 'ginger_ale',   price = 5, amount = 50},
            {name = 'bitters',      price = 5, amount = 50},
            {name = 'grenadine',    price = 5, amount = 50},
            {name = 'vermouth',     price = 5, amount = 50},
            {name = 'simple_syrup', price = 5, amount = 50},
        }
    },
        --- in CraftData/StoreData YOU DO NOT NEED prop or heading as these are not needed for the interaction. If you want to spawn an Object, They ARE needed
    locations = { -- l = length, w = width, lwr = (for target) lower height, upr = (for target)  upper height, r = rotation
        Crafter = { -- CraftData.type MUST MATCH A KEY VALUE IN craftStations ABOVE so type = 'cocktail' will look for cocktail in craftingStations
            {CraftData = {type = 'coffee', targetLabel = 'Make Coffee', menuLabel = 'Make Coffee!',prop = 'prop_coffee_mac_02'},
                loc = vector3(130.66, -1281.72, 29.5), l = 0.5, w = 0.4, lwr = 0.25, upr = 0.25, r = 40, job = 'vu'},
            {CraftData = {type = 'ice', targetLabel = 'Grab Ice', menuLabel = 'Grab Ice!' }, 
                loc = vector3(127.95, -1281.9, 28.99), l = 1.25, w = 0.65, lwr = 0.5, upr = 0.5, r = 40, job = 'vu'},
            {CraftData = {type = 'cocktail', targetLabel = 'Make Cocktail', menuLabel = 'Make Cocktail!' },
                loc = vector3(128.19, -1282.81, 29.44), l = 0.7, w = 0.6, lwr = 0.25, upr = 0.25, r = 120, job = 'vu'},
            {CraftData = {type = 'cocktail', targetLabel = 'Make Cocktail', menuLabel = 'Make Cocktail!'},
                loc = vector3(128.57, -1283.46, 29.42), l = 0.7, w = 0.6, lwr = 0.25, upr = 0.25, r = 120, job = 'vu'},
        },
        Stores = { -- prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
            {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
                loc = vector3(132.64, -1286.02, 28.84), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40, job = 'vu'},
            {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
                loc = vector3(131.99, -1284.91, 28.73), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40, job = 'vu'},
            {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
                loc = vector3(129.97, -1281.44, 28.74), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40, job = 'vu'},
            {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
                loc = vector3(129.14, -1279.99, 28.68), l = 0.7, w = 1.0, lwr = 0.50, upr = 0.5, r = 120, job = 'vu'},
        },
        Tills = { -- prop is only needed if you want to spawn an object | prop = 'prop_till_03' for example
            {loc = vec3(130.83, -1282.33, 29.42), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40,  commission = 0.2, job = 'vu'},
            {loc = vec3(129.32, -1284.75, 29.44), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40,  commission = 0.2, job = 'vu'},
            {loc = vec3(133.31, -1286.82, 29.4),  l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40,  commission = 0.2, job = 'vu'},
        },
        stash = { -- prop is only needed if you want to spawn an object | prop = 'prop_lev_crate_01' for example
            {prop = 'prop_drop_crate_01',loc = vec3(131.6136, -1287.2435, 28.2753), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 120,slots = 20, weight = 100000, job = 'vu'},
        },
        trays = { -- storages to place things for people | prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
            {prop = 'prop_food_tray_01', label = 'Grab Food', loc = vector3(129.6180, -1286.6339, 29.2904), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 214, slots = 20, weight = 100000, job = 'vu'},
        }
    },
    consumables = {
        daiquiri = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        gin_fizz = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        gin_and_tonic = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        mojito = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        moscow_mule = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        rum_and_coke = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        rum_punch = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        screwdriver = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        tequila_sunrise = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        vodka_soda = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        whiskey_sour = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
    }
}