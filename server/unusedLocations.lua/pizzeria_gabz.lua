Jobs['pizzeria'] = {
    CateringEnabled = true,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 889, color = 2, scale = 0.5, label = 'pizzeria', loc = vector3(804.71, -748.85, 32.8)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vec4(793.87, -746.23, 27.19, 86.08), label = 'Pizzeria'}
    },
    closedShopItems = {
        coffee =        {name = 'coffee', price = 5},
        ecola =         {name = 'ecola', price = 5},
        sprunk =        {name = 'sprunk', price = 5},
        pepperoni_pizza = {name = 'pepperoni_pizza', price = 5},
        sausage_pizza = {name = 'sausage_pizza', price = 5},
        veggie_pizza =  {name = 'veggie_pizza', price = 5},
        mushroom_pizza = {name = 'mushroom_pizza', price = 5},
        margharita_pizza = {name = 'margharita_pizza', price = 5},
        meatlovers_pizza = {name = 'meatlovers_pizza', price = 5},
        caprese_proscuitto = {name = 'caprese_proscuitto', price = 5},
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
            {anim = 'uncuff', give = {italian_sausage = 1}, take = {italian_sausage_crumbles = 1}, progtext = 'Chopping' },
            {anim = 'uncuff', give = {mushrooms = 1}, take = {sliced_mushroom = 1}, progtext = 'Chopping' },
            {anim = 'uncuff', give = {pepperoni = 1}, take = {pepperoni_sliced = 1}, progtext = 'Chopping' },
            {anim = 'uncuff', give = {bellpepper = 1}, take = {sliced_bellpeppers = 1}, progtext = 'Chopping' },

        },
       flatten = {
            {anim = 'uncuff', give = {pizza_dough = 1}, take = {pizza_dough_flattened = 1}, progtext = 'Flattening' },
        },
        pizza = {
            {anim = 'uncuff', give = {pizza_dough_flattened = 1, pepperoni_sliced = 1, shredded_mozzarella = 1, marinara = 1}, take = {pepperoni_pizza = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {pizza_dough_flattened = 1, italian_sausage_crumbles = 1, shredded_mozzarella = 1, marinara = 1}, take = {sausage_pizza = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {pizza_dough_flattened = 1, sliced_bellpeppers = 1, shredded_mozzarella = 1, sliced_mushroom = 1, olives = 1, marinara = 1}, take = {veggie_pizza = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {pizza_dough_flattened = 1, sliced_mushroom = 1, shredded_mozzarella = 1, marinara = 1}, take = {mushroom_pizza = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {pizza_dough_flattened = 1, mozzarella = 1, marinara = 1}, take = {margharita_pizza = 1}, progtext = 'Making' },
            {anim = 'uncuff', give = {pizza_dough_flattened = 1, pepperoni_sliced = 1, raw_bacon = 1, italian_sausage_crumbles = 1, proscuitto = 1, shredded_mozzarella = 1, marinara = 1}, take = {meatlovers_pizza = 1}, progtext = 'Making' },
        },
        caprese = {
            {anim = 'uncuff', give = {sliced_tomato = 1, mozzarella = 1, proscuitto = 1}, take = {caprese_proscuitto = 1}, progtext = 'Making' },
        }
       
    },
    catering = {
        commission = 0.2,
        items = {
           {name = 'pepperoni_pizza', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'sausage_pizza', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'veggie_pizza', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'mushroom_pizza', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'margharita_pizza', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'meatlovers_pizza', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'caprese_proscuitto', minPrice = 10, maxPrice = 20, maxAmount = 30},
    
        },
        Van = {
            pizzeria = {model = 'burrito', label = 'Burrito', plate = 'PizzaCat', loc = vec4(784.47, -741.57, 27.43, 317.7)},
        }
    },
    shops = {
        dough = {
            {name = 'pizza_dough', price = 5, amount = 50},
        },
        ingridients = {
            {name = 'pizza_dough', price = 5, amount = 50},
            {name = 'bellpepper', price = 5, amount = 50},
            {name = 'mushrooms', price = 5, amount = 50},
            {name = 'onion', price = 5, amount = 50},
            {name = 'tomato', price = 5, amount = 50},
            {name = 'olives', price = 5, amount = 50},
        },
        freezer = {
            {name = 'pepperoni', price = 5, amount = 50},
            {name = 'italian_sausage', price = 5, amount = 50},
            {name = 'raw_bacon', price = 5, amount = 50},
            {name = 'proscuitto', price = 5, amount = 50},
        },
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'flatten', targetLabel = 'Flatten Dough', menuLabel = 'Flatten Dough!'},
                loc = vector3(811.42, -754.54, 26.74), l = 0.5, w = 0.5, lwr = 0.05, upr = 0.75, r = 180, job = 'pizzeria'},
            {CraftData = {type = 'flatten', targetLabel = 'Flatten Dough', menuLabel = 'Flatten Dough!'},
                loc = vector3(808.12, -756.97, 26.51), l = 0.5, w = 0.5, lwr = 0.05, upr = 0.75, r = 180, job = 'pizzeria'},
            {CraftData = {type = 'chop', targetLabel = 'Chop Items', menuLabel = 'Chop Items'},
                loc = vector3(810.47, -765.15, 26.73),  l = 0.5, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = 'pizzeria'},
            {CraftData = {type = 'chop', targetLabel = 'Chop Items', menuLabel = 'Chop Items'},
                loc = vector3(809.28, -761.16, 26.73), l = 0.5, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = 'pizzeria'},
            {CraftData = {type = 'caprese', targetLabel = 'Make Antipasto', menuLabel = 'Make Antipasto!',},
                loc = vector3(809.31, -762.29, 26.7), l = 0.5, w = 0.5, lwr = 0.25, upr = 0.25, r = 180, job = 'pizzeria'},
            {CraftData = {type = 'coffee', targetLabel = 'Pour Coffee', menuLabel = 'Pour Cofee!'},
                loc = vector3(811.47, -764.38, 26.83), l = 0.5, w = 0.6, lwr = 0.75, upr = 0.5, r = 180, job = 'pizzeria'},
            {CraftData = {type = 'coffee', targetLabel = 'Pour coffee', menuLabel = 'Pour coffee!'},
                loc = vector3(808.81, -765.36, 26.75), l = 0.5, w = 0.6, lwr = 0.75, upr = 0.5, r = 180, job = 'pizzeria'},
            {CraftData = {type = 'soda', targetLabel = 'Pour Soda', menuLabel = 'Pour Soda!'},
                loc = vector3(811.43, -765.22, 26.81),   l = 0.65, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'pizzeria'},
            {CraftData = {type = 'pizza', targetLabel = 'Make Pizza', menuLabel = 'Make Pizza!'},
                loc = vector3(814.08, -752.88, 27.01),   l = 0.65, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'pizzeria'},

        },
        Stores = {
            {StoreData = {type = 'dough', targetLabel = 'Grab Dough', menuLabel = 'Grab Dough'},
                loc =  vector3(811.51, -755.58, 26.74), l = 0.5, w = 0.5, lwr = 0.9, upr = 0.9, r = 180, job = 'pizzeria'},
            {StoreData = {type = 'freezer', targetLabel = 'freezer Shop', menuLabel = 'freezer Shop'},
                loc =  vector3(803.8, -756.97, 26.93), l = 1.8, w = 0.5, lwr = 0.9, upr = 0.9, r = 180, job = 'pizzeria'},
            {StoreData = {type = 'freezer', targetLabel = 'freezer Shop', menuLabel = 'freezer Shop'},
                loc =  vector3(801.71, -756.97, 27.01), l = 1.8, w = 0.5, lwr = 0.9, upr = 0.9, r = 180, job = 'pizzeria'},
            {StoreData = {type = 'ingridients', targetLabel = 'Ingredient Shop', menuLabel = 'Ingredient Shop'},
                loc =  vector3(805.95, -761.69, 27.05), l = 1.5, w = 0.5, lwr = 0.9, upr = 0.9, r = 90, job = 'pizzeria'},
        },
        Tills = {
            {loc = vector3(811.29, -751.95, 26.85), l = 0.5, w = 0.5,  lwr = 0.10, upr = 0.25, r = 180,  commission = 0.2, job = 'pizzeria'},
            {loc = vector3(811.28, -750.62, 26.86), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 180,  commission = 0.2, job = 'pizzeria'},
        },
        stash = {
            {label = 'Dry Storage', loc = vector3(812.26, -755.53, 26.74), l = 0.7, w = 0.5, lwr = 0.2, upr = 0.3, r = 180, slots = 20, weight = 100000, job = 'pizzeria'},
            {label = 'Dry Storage', loc = vector3(805.95, -764.88, 26.85), l = 0.5, w = 1.5, lwr = 0.9, upr = 0.9, r = 180, slots = 20, weight = 100000, job = 'pizzeria'},
        },
        trays = { -- storages to place things for people | prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
            {prop = 'prop_food_tray_01', label = 'Grab Food', loc = vector3(810.89, -751.06, 27.03), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 90.0, slots = 20, weight = 100000, job = 'pizzeria'},
            {prop = 'prop_food_tray_01', label = 'Grab Food', loc = vector3(810.91, -752.95, 27.03), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 90.0, slots = 20, weight = 100000, job = 'pizzeria'},
            {prop = 'prop_food_tray_01', label = 'Grab Food', loc = vector3(811.83, -749.82, 27.03), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 165, slots = 20, weight = 100000, job = 'pizzeria'},
        }
    },
    consumables = {
        caprese_proscuitto = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        margharita_pizza = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        meatlovers_pizza = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        pepperoni_pizza = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        mushroom_pizza = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        sausage_pizza = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
        veggie_pizza = {anim = 'eat', label = 'Eating', add = {hunger = 10}},
    },
}