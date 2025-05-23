Jobs['beanmachine'] = {
    CateringEnabled = true,
    closedShopsEnabled = false,
    Blip = {
        {sprite = 214, color = 2, scale = 0.5, label = 'Bean Machine', loc = vec3(112.27, -1042.8, 29.28)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vec4(112.27, -1042.8, 29.28, 62.86), label = 'Bean Machine Shop'}
    },
    closedShopItems = {
        almond_croissant = {name = 'almond_croissant', price = 5},
        americano = {name = 'americano', price = 5},
        butter_croissant = {name = 'butter_croissant', price = 5},
        cappuccino = {name = 'cappuccino', price = 5},
        caramel_macchiato = {name = 'caramel_macchiato', price = 5},
        coffee = {name = 'coffee', price = 5},
        cold_brew = {name = 'cold_brew', price = 5},
        hazelnut_latte = {name = 'hazelnut_latte', price = 5},
        iced_cafe = {name = 'iced_cafe', price = 5},
        mocha_latte = {name = 'mocha_latte', price = 5},
        tiramasu_coffee = {name = 'tiramasu_coffee', price = 5},
        vanilla_frappe = {name = 'vanilla_frappe', price = 5},
    },
    craftingStations = {
        coffee = {
            {anim = 'uncuff',give = {}, take = {coffee=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = { espresso = 1}, take = {americano=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = { espresso = 1}, take = {cappuccino=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = { caramel_syrup = 1, ice = 1, oat_milk = 1, espresso = 1}, take = {caramel_macchiato=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = { espresso = 1}, take = {cold_brew=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = { hazelnut_syrup = 1, espresso = 1, oat_milk = 1, cinnamon = 1}, take = {hazelnut_latte=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = { ice = 1, oat_milk = 1, espresso = 1}, take = {iced_cafe=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = { chocolate_syrup = 1, espresso = 1, oat_milk = 1}, take = {mocha_latte=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = { chocolate_syrup = 1, whipped_cream = 1, sugar = 1, oat_milk = 1, espresso = 1, cocoa_powder = 1}, take = {tiramasu_coffee=1}, progtext = 'Pouring'},
            {anim = 'uncuff',give = { ice = 1, espresso = 1, vanilla_syrup = 1, oat_milk = 1}, take = {vanilla_frappe=1}, progtext = 'Pouring'}
        },
    },
    catering = {
        commission = 0.2,
        items = {
            {name = 'almond_croissant', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'americano', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'butter_croissant', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'cappuccino', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'caramel_macchiato', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'coffee', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'cold_brew', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'hazelnut_latte', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'iced_cafe', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'mocha_latte', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'tiramasu_coffee', minPrice = 10, maxPrice = 50, price = 10},
            {name = 'vanilla_frappe', minPrice = 10, maxPrice = 50, price = 10},
        },
        Van = {
            beanmachine = {model = 'burrito', label = 'Burrito', plate = 'BEANCATER', loc = vec4(105.86, -1035.34, 29.27, 338.32)},
        }
    },
    shops = {
        ingridients={
            {name = 'caramel_syrup', price = 5, amount = 50},
            {name = 'chocolate_syrup', price = 5, amount = 50},
            {name = 'cinnamon', price = 5, amount = 50},
            {name = 'cocoa_powder', price = 5, amount = 50},
            {name = 'espresso', price = 5, amount = 50},
            {name = 'hazelnut_syrup', price = 5, amount = 50},
            {name = 'ice', price = 5, amount = 50},
            {name = 'oat_milk', price = 5, amount = 50},
            {name = 'sugar', price = 5, amount = 50},
            {name = 'vanilla_syrup', price = 5, amount = 50},
            {name = 'whipped_cream', price = 5, amount = 50}
        },
        pastries = {
            {name = 'almond_croissant', price = 5, amount = 50},
            {name = 'butter_croissant', price = 5, amount = 50},
        }
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(124.53, -1036.87, 29.36), l = 0.5, w = 0.7, lwr = 0.10, upr = 0.35, r = 160, job = 'beanmachine'},
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(122.79, -1041.63, 29.36), l = 0.5, w = 0.7, lwr = 0.10, upr = 0.35, r = 160,job = 'beanmachine'},
        },
        Stores = {
            {StoreData = {type = 'pastries', targetLabel = 'Pastry Shop', menuLabel = 'Pastry Shop'},
                loc =  vector3(121.36, -1038.37, 29.33), l = 0.5, w =1.5, lwr = 0.25, upr = 0.25, r = 160, job = 'beanmachine'},
            {StoreData = {type = 'ingridients', targetLabel = 'Coffee Ingridients', menuLabel = 'Pastry Shop'},
                loc =  vector3(124.08, -1037.28, 28.88), l = 0.5, w = 2.0, lwr = 0.25, upr = 0.25, r = 160, job = 'beanmachine'},
            {StoreData = {type = 'ingridients', targetLabel = 'Coffee Ingridients', menuLabel = 'Pastry Shop'},
                loc =  vector3(123.4, -1039.12, 28.88), l = 0.5, w = 2.0, lwr = 0.25, upr = 0.25, r = 160, job = 'beanmachine'},
            {StoreData = {type = 'ingridients', targetLabel = 'Coffee Ingridients', menuLabel = 'Pastry Shop'},
                loc =  vector3(122.7, -1041.05, 28.9), l = 0.5, w = 2.0, lwr = 0.25, upr = 0.25, r = 160, job = 'beanmachine'},
        },
        Tills = {
            {loc = vector3(120.83, -1040.14, 29.46), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 160,  commission = 0.2, job = 'beanmachine'},
            {loc = vector3(122.12, -1036.56, 29.46), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 160,  commission = 0.2, job = 'beanmachine'},
        },
        stash = {
            {label = 'Bean Machine Stash', loc = vector3(121.64, -1039.48, 28.83), l = 0.25, w = 1.5, lwr = 0.25, upr = 0.25, r = 160, slots = 20, weight = 100000, job = 'beanmachine'},
            {label = 'Bean Machine Stash', loc = vector3(122.24, -1037.83, 28.86), l = 0.25, w = 1.5, lwr = 0.25, upr = 0.25, r = 160, slots = 20, weight = 100000, job = 'beanmachine'},
        },
        trays = {
            {label = 'Grab Drinks!', loc = vector3(120.57, -1040.72, 29.25),  l = 0.5, w = 0.5, lwr = 0.25, upr = 0.25, r = 160, slots = 20, weight = 100000, job = 'tequilala'},
            {label = 'Grab Drinks!', loc = vector3(121.84, -1037.05, 29.25),  l = 0.5, w = 0.5, lwr = 0.25, upr = 0.25, r = 160, slots = 20, weight = 100000, job = 'tequilala'},
        }
    },
    consumables = {
        almond_croissant = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        butter_croissant = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        americano = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        cappuccino = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        caramel_macchiato = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        coffee = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        mocha_latte = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        tiramasu_coffee = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        vanilla_frappe = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        iced_cafe = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        hazelnut_latte = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        cold_brew = {anim = 'drink', label = 'Drinking', add = {thirst = 10}},
        
    },
}