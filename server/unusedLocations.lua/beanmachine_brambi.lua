-- -- https://brambi-shop.tebex.io/package/6196693

Jobs['beanmachine'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 214, color = 2, scale = 0.5, label = 'Bean Machine', loc = vector4(336.74, -778.19, 29.26, 74.91)},
    },
    closedShops = {
        {ped = 'A_F_Y_Bevhills_05', loc = vector4(336.74, -778.19, 28.26, 74.91), label = 'Bean Machine Shop Two'}
    },
    closedShopItems = {
        coffee              = {name = 'coffee',                 price = 5},
        espresso            = {name = 'espresso',               price = 5},
        americano           = {name = 'americano',              price = 5},
        cappuccino          = {name = 'cappuccino',             price = 5},
        caramel_macchiato   = {name = 'caramelmacchiato',       price = 5},
        mochalatte          = {name = 'mochalatte',             price = 5},
        hazelnut_latte      = {name = 'hazelnutlatte',          price = 5},
        vanilla_frappe      = {name = 'vanillafrappe',          price = 5},
        tiramisu_coffee     = {name = 'tiramisucoffee',         price = 5},
        almond_croissant    = {name = 'almond_croissant',       price = 5},
        butter_croissant    = {name = 'butter_croissant',       price = 5},

    },
    craftingStations = {
        coffee = {
            { anim = 'uncuff', give = {},                                                                           take = {coffee=1}, progtext = 'Pouring' },
            { anim = 'uncuff', give = { espresso = 1 },                                                             take = { americano = 1 }, progtext = 'Brewing' },
            { anim = 'uncuff', give = { espresso = 1, oat_milk = 1 },                                               take = { cappuccino = 1 }, progtext = 'Steaming Milk' },
            { anim = 'uncuff', give = { espresso = 1, vanilla_syrup = 1, oat_milk = 1, caramel_syrup = 1 },         take = { caramel_macchiato = 1 }, progtext = 'Pouring' },
            { anim = 'uncuff', give = { espresso = 1, chocolate_syrup = 1, oat_milk = 1 },                          take = { mocha_latte = 1 }, progtext = 'Mixing Chocolate' },
            { anim = 'uncuff', give = { espresso = 1, hazelnut_syrup = 1, oat_milk = 1 },                           take = { hazelnut_latte = 1 }, progtext = 'Stirring' },
            { anim = 'uncuff', give = { espresso = 1, vanilla_syrup = 1, ice = 1, whipped_cream = 1 },              take = { vanilla_frappe = 1 }, progtext = 'Blending' },
            { anim = 'uncuff', give = { espresso = 1, chocolate_syrup = 1, cocoa_powder = 1, whipped_cream = 1 },   take = { tiramasu_coffee = 1 }, progtext = 'Layering' },
        },
    },
    catering = {
        commission = 0.2,
        items = {
            {name = 'coffee',               minPrice = 5, maxPrice = 10, maxAmount = 30},
            {name = 'americano',            minPrice = 5, maxPrice = 10, maxAmount = 30},
            {name = 'cappuccino',           minPrice = 5, maxPrice = 10, maxAmount = 30},
            {name = 'caramel_macchiato',    minPrice = 5, maxPrice = 10, maxAmount = 30},
            {name = 'mochalatte',           minPrice = 5, maxPrice = 10, maxAmount = 30},
            {name = 'hazelnut_latte',       minPrice = 5, maxPrice = 10, maxAmount = 30},
            {name = 'vanillafrappe',        minPrice = 5, maxPrice = 10, maxAmount = 30},
            {name = 'tiramisu_coffee',      minPrice = 5, maxPrice = 10, maxAmount = 30},
        },
        Van = {
            beanmachine = {model = 'burrito', label = 'Burrito', plate = 'BEANCATER', loc = vector4(331.57, -770.61, 28.97, 342.03), heading = 342.78},
        }
    },
    shops = {
        ingridients={
            {name = 'espresso',         price = 5, amount = 50},
            {name = 'oat_milk',         price = 3, amount = 50},
            {name = 'vanilla_syrup',    price = 4, amount = 50},
            {name = 'caramel_syrup',    price = 4, amount = 50},
            {name = 'hazelnut_syrup',   price = 4, amount = 50},
            {name = 'chocolate_syrup',  price = 4, amount = 50},
            {name = 'whipped_cream',    price = 3, amount = 50},
            {name = 'cocoa_powder',     price = 3, amount = 50},
            {name = 'sugar',            price = 2, amount = 50},
            {name = 'cinnamon',         price = 2, amount = 50},
            {name = 'ice',              price = 2, amount = 50},
        },
        pastries = {
            {name = 'almond_croissant', price = 5, amount = 50},
            {name = 'butter_croissant', price = 5, amount = 50},
        }
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Coffee!'},
                loc = vector3(343.85, -779.50, 29.25), l = 0.5, w = 0.7, lwr = 0.10, upr = 0.35, r = 180, job = 'beanmachine'},
        },
        Stores = {
            {StoreData = {type = 'pastries', targetLabel = 'Pastry Shop', menuLabel = 'Pastry Shop'},
                loc =  vector3(344.76, -777.26, 29.26), l = 0.5, w =1.2, lwr = 0.25, upr = 0.50, r = 180, job = 'beanmachine'},
            {StoreData = {type = 'ingridients', targetLabel = 'Ingridient Shop', menuLabel = 'Ingridient Shop'},
                loc =  vector3(344.76, -777.26, 29.26), l = 0.5, w =1.2, lwr = 0.25, upr = 0.50, r = 180, job = 'beanmachine'},

        },
        Tills = {
            {loc = vector3(342.01, -778.64, 29.33), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.50, r = 180,  commission = 0.2, job = 'beanmachine'},
        },
        stash = {
            {label = 'Bean Machine Stash', loc = vector3(344.55, -777.89, 29.99), l = 1.0, w = 0.5, lwr = 0.25, upr = 0.50, r = 180, slots = 20, weight = 100000, job = 'beanmachine'},
        },
        trays = {
            {prop = 'prop_food_tray_01', label = 'Grab Drinks!', loc = vector3(342.67, -776.61, 29.21),  l = 0.5, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, slots = 20, weight = 100000, job = 'beanmachine'},
        }
    },
    consumables = {
        almond_croissant    = {anim = 'eat',    label = 'Eating',   add = {hunger = 10}},
        butter_croissant    = {anim = 'eat',    label = 'Eating',   add = {hunger = 10}},
        americano           = {anim = 'drink',  label = 'Drinking', add = {thirst = 10}},
        cappuccino          = {anim = 'drink',  label = 'Drinking', add = {thirst = 10}},
        caramel_macchiato   = {anim = 'drink',  label = 'Drinking', add = {thirst = 10}},
        coffee              = {anim = 'drink',  label = 'Drinking', add = {thirst = 10}},
        mocha_latte         = {anim = 'drink',  label = 'Drinking', add = {thirst = 10}},
        tiramasu_coffee     = {anim = 'drink',  label = 'Drinking', add = {thirst = 10}},
        vanilla_frappe      = {anim = 'drink',  label = 'Drinking', add = {thirst = 10}},
    },
}