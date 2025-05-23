# MD-Jobs
    
<div align="center">
  <a href="https://discord.gg/sAMzrB4DDx">
    <img src="https://i.imgur.com/t65G9Z0.png" width="200" alt="Mustache Scripts Discord">
  </a>
  <br>
  <a href="https://discord.gg/sAMzrB4DDx"><strong>Join the Mustache Scripts Discord</strong></a>
</div>


## Acknowledgements
### big shoutout to [Mcklean](https://mckleans-scripts.tebex.io/) for MK-Items
### big shoutout to [bitc0de](https://github.com/bitc0de/fivem-items-gallery) for the items as well
### Thanks to the beta testers as they have helped a lot :) 

## Contributions
### as time moves on, I would love for this script to make more and more jobs accessible, free, and open source. If you make items and locations and want to contribute to the resource to help others get more jobs made for their server you must do the following
### make sure items and images are TOS friendly (we dont need coca-cola, ecola is fine.)
### fork/clone the current repository
### upload the folder in this format below
  - name of job
    - image folder with images
    - qb.md -- qb items format
    - ox.md -- ox items format
    - jobData.md -- job code snippet for qb, qbx, esx
    - jobname.lua -- please rename the lua file to be name of the job and which mlo
      - uwu_gabz or deerdiner_dippzy
### if that format is hard you can use the site linked below and upload the images and input the data for jobs on the site and hit export at the bottom
### then add in the jobname.lua to it
### Send A PR and As long as its TOS safe and the coords work, ill accept and merge it in.

## Features
- **Unlimited Crafting Jobs**: Create as many jobs as you want with fully customizable crafting stations, shops, and catering options.
- **Customizable Recipes**: Define ingredients, crafting animations, and results for each job.
- **Catering System**: Enable catering orders with commission payouts for players.
- **Closed Shops**: Add restricted shops with unique inventories and ped models.
- **Easy Setup**: Use the provided website tool to generate configuration files quickly.



## Dependencies
- **qb-core**, **qbx_core**, or **esx** (ESX support is experimental)
  - For ESX: `ox_inventory` and `ox_target` are required.
- **ox_lib**
- **rpemotes** or **scully_emotemenu**


## Installation

### Step 1: Install Items
- The `items` folder contains pre-configured item templates for various businesses (e.g., Vanilla Unicorn).
- Only install the items you plan to use. If you're not using Gabz Vanilla Unicorn, skip those files.

### Step 2: Upload Images to Inventory
- Copy and paste the images into your inventory resource.

### Step 3: Run the SQL File
- Execute the provided SQL file to set up the necessary database tables.
  - If you're unsure how to run SQL files, there are many helpful tutorials on YouTube.

### Step 4: Add Emotes
- The following emote is used for crafting animations. You can customize it if needed:
```lua
 ["uncuff"] = {"mp_arresting","a_uncuff","Uncuff", AnimationOptions = {     EmoteLoop = true,     EmoteMoving = true } },

["cocktail"] = {
        'anim@scripted@freemode@postertag@graffiti_spray@male@',
        "shake_can_male",
        "Shake Cocktail",
        "coupleanim",
        AnimationOptions = {
            Prop = 'prop_bar_cockshaker',
            PropBone = 28422,
            PropPlacement = {
                0, 0, -0.20, 0.0017365, 0, 0
            },
            EmoteMoving = false,
            EmoteLoop = true
        }
    },
```
If using scully:

```lua

{
    Label = 'Uncuff',
    Command = 'uncuff',
    Animation = 'a_uncuff',
    Dictionary = 'mp_arresting',
    Options = {
        Flags = {
            Loop = true,
            Move = true,
        },
    },
},

{
    Label = 'Shake Cocktail',
    Command = 'cocktail',
    Animation = 'shake_can_male',
    Dictionary = 'anim@scripted@freemode@postertag@graffiti_spray@male@',
    Options = {
        Flags = {
            Loop = true,
            Move = false,
        },
        Props = {
            {
                Bone = 28422,
                Name = 'prop_bar_cockshaker',
                Placement = {
                    vector3(0.0, 0.0, -0.20),
                    vector3(0.0017365, 0.0, 0.0),
                },
            },
        },
    },
},

```


### Step 5 ( ONLY FOR QBX )
- head to the fxmanifest.lua
   - uncomment out the line in client_scripts { } for player data

   
# How to edit things around
## Now There is an easy way and a harder way

### Easy Way
I (98% Ai) made this website. you upload the images for items and fill out the info.
### Highly Recommend you stick to image names like butter.png or buttered_toast.png as the site will read _ as a space and capitlize the next letter for your items
- it will read the image names and make ox and qb formatted items
- it will then make sure you have the images in the img folder
- it will then spit out a {jobnameyouinput}.lua to add to your locations

### https://mustachedom.github.io/md-jobs-maker/


### harder way
Lets start with a job snippet and ill explain it further 
```lua

Jobs['bestbudz'] = {
    CateringEnabled = false,
    closedShopsEnabled = true,
    Blip = {
        {sprite = 469, color = 2, scale = 0.8, label = 'Best Budz', loc = vector3(374.57, -825.79, 29.05)},
    },
    closedShops = {
        {ped = 'mp_m_freemode_01', loc = vector4(379.71, -833.63, 29.29, 178.74), label = 'Best Budz Shop'}
    },
    closedShopItems = {
        joint_whitewidow = {name = 'joint_whitewidow', price = 5},
        joint_ogkush = {name = 'joint_ogkush', price = 5},
        joint_purplehaze = {name = 'joint_purplehaze', price = 5},
        joint_skunk = {name = 'joint_skunk', price = 5},
        joint_ak47 = {name = 'joint_ak47', price = 5},
        blunt_whitewidow = {name = 'blunt_whitewidow', price = 5},
        blunt_ogkush = {name = 'blunt_ogkush', price = 5},
        blunt_purplehaze = {name = 'blunt_purplehaze', price = 5},
        blunt_skunk = {name = 'blunt_skunk', price = 5},
        blunt_ak47 = {name = 'blunt_ak47', price = 5},
        weed_oil = {name = 'weed_oil', price = 5},
    },
    craftingStations = {
        whitewidow = {
            {anim = 'uncuff',give = {empty_weed_bag = 1}, take = {weed_job_white_widow = 1}, progtext = 'Pouring'},
        },
        ogkush = {
            {anim = 'uncuff',give = {empty_weed_bag = 1}, take = {weed_job_og_kush=1}, progtext = 'Pouring' },
        },
        purplehaze = {
            {anim = 'uncuff',give = {empty_weed_bag = 1}, take = {weed_job_purple_haze=1}, progtext = 'Pouring' },
        },
        skunk = {
            {anim = 'uncuff',give = {empty_weed_bag = 1}, take = {weed_job_skunk=1}, progtext = 'Pouring' },
        },
        ak47 = {
            {anim = 'uncuff',give = {empty_weed_bag = 1}, take = {weed_job_ak47=1}, progtext = 'Pouring' },
        },
        joints = {
            {anim = 'uncuff',give = {rolling_paper = 1, weed_job_white_widow=1}, take = {joint_whitewidow=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {rolling_paper = 1, weed_job_og_kush=1}, take = {joint_og_kush=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {rolling_paper = 1, weed_job_purple_haze=1}, take = {joint_purplehaze=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {rolling_paper = 1, weed_job_skunk=1}, take = {joint_skunk=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {rolling_paper = 1, weed_job_ak47=1}, take = {joint_ak47=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {bluntwrap = 1, weed_job_white_widow=1}, take = {blunt_white_widow=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {bluntwrap = 1, weed_job_og_kush=1}, take = {blunt_og_kush=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {bluntwrap = 1, weed_job_purple_haze=1}, take = {blunt_purple_haze=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {bluntwrap = 1, weed_job_skunk=1}, take = {blunt_skunk=1}, progtext = 'Rolling' },
            {anim = 'uncuff',give = {bluntwrap = 1, weed_job_ak47=1}, take = {blunt_ak47=1}, progtext = 'Rolling' }, 
        },
        oil = {
            {anim = 'uncuff',give = {weed_job_white_widow = 1}, take = {weed_oil=1}, progtext = 'Pouring' },
            {anim = 'uncuff',give = {weed_job_og_kush = 1}, take = {weed_oil=1}, progtext = 'Pouring' },
            {anim = 'uncuff',give = {weed_job_purplehaze = 1}, take = {weed_oil=1}, progtext = 'Pouring' },
            {anim = 'uncuff',give = {weed_job_ak47 = 1}, take = {weed_oil=1}, progtext = 'Pouring' },
            {anim = 'uncuff',give = {weed_job_skunk = 1}, take = {weed_oil=1}, progtext = 'Pouring' },
        }
    },
    catering = {
        commission = 0.2,
        items = {
            {name = 'joint_whitewidow', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_ogkush', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_purplehaze', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_skunk',  minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'joint_ak47',   minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_whitewidow', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_ogkush', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_purplehaze', minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_skunk',  minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'blunt_ak47',   minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'weed_oil',     minPrice = 10, maxPrice = 20, maxAmount = 30},
        },
        Van = {
            taxi = {model = 'burrito', label = 'Burrito', plate = 'WeedMan', loc = vector4(364.85, -829.15, 29.29, 192.0), heading = 192.00},
        }
    },
    shops = {
        ingridients={
            {name = 'empty_weed_bag', price = 5, amount = 50},
            {name = 'rolling_paper', price = 5, amount = 50},
            {name = 'bluntwrap', price = 5, amount = 50},
            {name = 'weed_nutrition' , price = 5, amount = 50},
        },
    },
    locations = {
        Crafter = {
            {CraftData = {type = 'whitewidow', targetLabel = 'Pick White Widow', menuLabel = 'Pick White Widow!'},
                loc = vector3(379.42, -813.45, 29.03), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'whitewidow', targetLabel = 'Pick White Widow', menuLabel = 'Pick White Widow!'},
                loc = vector3(380.42, -813.53, 29.02), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'ogkush', targetLabel = 'Pick OG Kush', menuLabel = 'Pick OG Kush!'},
                loc = vector3(382.07, -813.59, 29.02), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'ogkush', targetLabel = 'Pick OG Kush', menuLabel = 'Pick OG Kush!'},
                loc = vector3(383.1, -813.5, 28.99), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'purplehaze', targetLabel = 'Pick Purple Haze', menuLabel = 'Pick Purple Haze!'},
                loc = vector3(378.32, -813.37, 29.02), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'purplehaze', targetLabel = 'Pick Purple Haze', menuLabel = 'Pick Purple Haze!'},
                loc = vector3(378.3, -811.64, 29.08), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'skunk', targetLabel = 'Pick Skunk', menuLabel = 'Pick Skunk!'},
                loc = vector3(379.26, -811.68, 29.04), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'skunk', targetLabel = 'Pick Skunk', menuLabel = 'Pick Skunk!'},
                loc = vector3(380.57, -811.65, 29.07), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'ak47', targetLabel = 'Pick AK47', menuLabel = 'Pick AK47!'},  
                loc = vector3(381.8, -811.65, 29.06), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'ak47', targetLabel = 'Pick AK47', menuLabel = 'Pick AK47!'},
                loc = vector3(382.76, -811.6, 29.01), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'joints', targetLabel = 'Roll Weed', menuLabel = 'Roll Weed!'},
                loc = vector3(375.7, -824.38, 29.09), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {CraftData = {type = 'oil', targetLabel = 'Make Oil', menuLabel = 'Make Oil!'},
                loc = vector3(382.38, -817.04, 29.41), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
        },
        Stores = {
            {StoreData = {type = 'ingridients', targetLabel = 'Open Shop', menuLabel = 'Open Shop!'},
                loc = vector3(374.57, -825.79, 29.05), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {StoreData = {type = 'ingridients', targetLabel = 'Open Shop', menuLabel = 'Open Shop!'},
                loc = vector3(379.53, -825.79, 29.07), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
        },
        Tills = {
            {loc = vector3(380.22, -827.26, 29.4), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
            {loc = vector3(375.55, -827.27, 29.4), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, job = 'bestbudz'},
        },
        trays = {
            {label = 'Open Tray', prop = 'prop_food_tray_01', loc = vector3(379.24, -827.39, 29.28), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 90.0, slots = 20, weight = 100000, job = 'bestbudz'},
            {label = 'Open Tray', prop = 'prop_food_tray_01', loc = vector3(375.52, -829.0, 29.28),  l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 90.0, slots = 20, weight = 100000, job = 'bestbudz'},
        },
        stash = {
            {label = 'Dry Storage', loc = vector3(377.07, -825.79, 29.06), l = 1.7, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'bestbudz'},
            {label = 'Dry Storage', loc = vector3(375.7, -824.38, 29.09), l = 0.5, w = 0.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'bestbudz'},
            {label = 'Dry Storage', loc = vector3(373.94, -827.81, 29.02), l = 0.5, w = 1.7, lwr = 0.25, upr = 0.75, r = 180, slots = 20, weight = 100000, job = 'bestbudz'},
        }
    },
    consumables = {
        blunt_ak47 = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        blunt_og_kush = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        blunt_purple_haze = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        blunt_skunk = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, thirst = -10}},
        blunt_white_widow = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_ak47 = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_og_kush = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_purple_haze = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
        joint_skunk = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, thirst = -10}},
        joint_white_widow = {anim = 'smoke', label = 'Smoking', add = {hunger = -3, stress = -10}},
    },
}
```

## making a job
 #### in order to make the job you need to add it to the Jobs table. its very simple

```lua
    Jobs['bestbudz'] = {

    }
```
 #### now it **needs** to be the job  <b>NAME</b> not job label

## enable catering or closed shop
#### this is very simple as well, you are simply going to put the bools in the table you just make
```lua
    Jobs['bestbudz'] = {
        CateringEnabled = true,
        closedShopsEnabled = true,
    }
```

## making a blip
#### lets make a blip for this job
```lua
    Jobs['bestbudz'] = {
        CateringEnabled = true,    
        closedShopsEnabled = true,
        Blip = {
            {sprite = 469, color = 2, scale = 0.8, label = 'Best Budz', loc = vector3(374.57, -825.79, 29.05)},
        },
      }
```

| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `sprite` | icon displayed | yes | - |
| `color` | color of blip | yes | - | 
| `scale` | size of blip  | Yes | - |
| `label` | name of blip  | Yes | - |
| `loc`   | location of blip | yes| -|

## Making A closed shop
#### sweet, now we need to add where the peds will be!
```lua
       Jobs['bestbudz'] = {
        closedShopsEnabled = true,
        closedShops = { -- allows multiple peds with their own inventory label MUST BE UNIQUE
            {ped = 'mp_m_freemode_01', loc = vector4(129.02, -1283.25, 29.27, 120.67),  label = 'Best Budz Shop'},
            {ped = 'mp_m_freemode_01', loc = vector4(523.02, 421.25, 65.27, 120.67),    label = 'Best Budz Beach Shop'},
        },
      }
```
   Parameter | Description | Required | Default |
  |-----------|-------------|----------|---------|
  | `ped` | Model of Ped| yes | - |
  | `loc` | location of ped | yes | -       | 
  | `label` | UNIQUE Name | Yes | - |
  |
```lua
    Jobs['police'] = {
        closedShopsEnabled = false,
        closedShops = {},
    }
```
or 
```lua
  Jobs['police'] = {
        closedShopsEnabled = false,
    }
```
## Adding What Can Be In a Closed Shop
### this part is simple, add the items you want to sell and the price for them to be defaulted to
```lua
 Jobs['bestbudz'] = {
   closedShopsEnabled = true,
   closedShops = {
       {ped = 'mp_m_freemode_01', loc = vector4(379.71, -833.63, 29.29, 178.74), label = 'Best Budz Shop'}
   },
   closedShopItems = {
       joint_whitewidow = {name = 'joint_whitewidow', price = 5},
       joint_ogkush = {name = 'joint_ogkush', price = 5},
       joint_purplehaze = {name = 'joint_purplehaze', price = 5},
       joint_skunk = {name = 'joint_skunk', price = 5},
       joint_ak47 = {name = 'joint_ak47', price = 5},
       blunt_whitewidow = {name = 'blunt_whitewidow', price = 5},
       blunt_ogkush = {name = 'blunt_ogkush', price = 5},
       blunt_purplehaze = {name = 'blunt_purplehaze', price = 5},
       blunt_skunk = {name = 'blunt_skunk', price = 5},
       blunt_ak47 = {name = 'blunt_ak47', price = 5},
       weed_oil = {name = 'weed_oil', price = 5},
   },
 }
```
###  now if you have the closed shop enabled you add the items in the format above
###  this is set to $5 but the owner of the business **can** change the prices in city :)
 | Parameter | Description | Required | Default |
 |-----------|-------------|----------|---------|
 | `key value (item)` | item added| yes | - |
 | `name` | repeat item key | yes | -       | 
 | `price` | deafult price | Yes | - |
 |
### doing good so far! now you can see how to start a job and enable closedShops and blips. Lets get further in!

## Adding Crafting Stations
###  Sweet now lets look at making some crafting stations and recipes
```lua
   Jobs['police'] = {
     CateringEnabled = true,    -- if false catering can be catering = {} or not even there
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
   }
```
###  ok i admit thats a lot of changes really quick. lets break it down 
###  so we are making three crafting stations.
### they can be any name like 
```lua
    cocktail = {},
    coffee = {},
    ice = {},
    tswiftIsForTheHomies = {},
```
### so the tables above are what type of crafting it is. lets add data
```lua
    cocktail = {
       {anim = 'cocktail', give = {ice = 1, soda_water = 1, vodka = 1}, take = {vodka_soda = 1}, progtext = 'Making', time = 5000, max = 10000},
    },
  coffee = {
       {anim = 'uncuff',give = {}, take = {coffee = 1}, progtext = 'Pouring' }
   },
   ice = {
       {anim = 'uncuff', give = {}, take = {ice = 1}, progtext = 'Scooping' }
   }
```

| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `anim` | Animation to play during crafting | no | 'uncuff' |
| `give` | Required items with quantities | yes/no | give = {} will not require item removal |
| `take` | Produced items with quantities | Yes | take needs an item to give |
| `progtext` | Text shown on the progress bar | no | "Crafting"  |
| `time` | Duration in milliseconds | No | `Config.DefaultCraftTime` |
| `max` | Maximum quantity craftable at once | No | `Config.MultiCraftDefault` |

### Now all you need to do is fill out as many crafting things as you want!

## Setting Up Catering!
### going off assuming you want to use catering for this job lets add it in
```lua
   Jobs['police'] = {
    CateringEnabled = true,    -- if false catering can be catering = {} or not even there
    catering = { -- accessible in Till
        commission = 0.2, -- 20%
        items = {
            {name = 'vodka',        minPrice = 10, maxPrice = 20, maxAmount = 30},
            {name = 'tequila',      minPrice = 10, maxPrice = 20, maxAmount = 30},
        },
        Van = {model = 'burrito', label = 'Burrito', plate = 'policeCATER', loc = vector4(144.72, -1300.25, 28.89, 121.44)},
    },
}
```
   ### Catering Parameters   
| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `commission` | Commission rate (0.0-1.0) paid to employee | Yes | - |
| `items` | Table of items available for catering see below| Yes | - |
| `Van` | Delivery vehicle configuration See Below | Yes | - |   
### Items Parameters   
| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `name` | Item identifier | Yes | - |
| `minPrice` | Minimum selling price | Yes | - |
| `maxPrice` | Maximum selling price | Yes | - |
| `maxAmount` | Maximum quantity available | Yes | - |   
### Van Parameters   
| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `model` | Vehicle model name | Yes | - |
| `label` | Display name for the vehicle | Yes | - |
| `plate` | License plate text | Yes | - |
| `loc` | Vector4 spawn location (x, y, z, heading) | Yes | - |

## Setting up Shops!
### is this closed shops? we did this already? nope. this is to get ingridients

### lets start with adding the types of shops and what items it goes in 
```lua
Jobs['police'] = {
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
}
```
### so lets break this down more
```lua
    shops = { -- must match the key value in locations
        ingridients = {
            {name = 'vodka',        price = 5, amount = 50},
        }
    },
```
### we need to make a table for the type of shop it is 
#### so the key is the type and the value is the items
```lua
  shops = {
     -- KEY      | Value
     ingridients = {}
  }
```
### and now we just add the items that go inside the ingridients shop
```lua
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
```
### shops = {} Parameters

| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `[category]` | Category name (must match location key) | Yes | - |
| `items` | Table of items in this shop category see below | Yes | - |

### Item Parameters

| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `name` | Item identifier | Yes | - |
| `price` | Purchase price | Yes | - |
| `amount` | Maximum available stock | Yes | - |


## Adding Locations!
### so this is the hardest part since there is multiple formats here. ill break them down one by one but here is the way it should look
```lua
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
--- in CraftData/StoreData YOU DO NOT NEED prop or heading as these are not needed for the interaction. If you want to spawn an Object, They ARE needed
locations = { -- l = length, w = width, lwr = (for target) lower height, upr = (for target)  upper height, r = rotation
    Crafter = { -- CraftData.type MUST MATCH A KEY VALUE IN craftStations ABOVE so type = 'cocktail' will look for cocktail in craftingStations
        {CraftData = {type = 'coffee', targetLabel = 'Make Coffee', menuLabel = 'Make Coffee!',prop = 'prop_coffee_mac_02'},
            loc = vector3(130.66, -1281.72, 29.5), l = 0.5, w = 0.4, lwr = 0.25, upr = 0.25, r = 40, job = 'police'},
        {CraftData = {type = 'ice', targetLabel = 'Grab Ice', menuLabel = 'Grab Ice!' }, 
            loc = vector3(127.95, -1281.9, 28.99), l = 1.25, w = 0.65, lwr = 0.5, upr = 0.5, r = 40, job = 'police'},
        {CraftData = {type = 'cocktail', targetLabel = 'Make Cocktail', menuLabel = 'Make Cocktail!' },
            loc = vector3(128.19, -1282.81, 29.44), l = 0.7, w = 0.6, lwr = 0.25, upr = 0.25, r = 120, job = 'police'},
        {CraftData = {type = 'cocktail', targetLabel = 'Make Cocktail', menuLabel = 'Make Cocktail!'},
            loc = vector3(128.57, -1283.46, 29.42), l = 0.7, w = 0.6, lwr = 0.25, upr = 0.25, r = 120, job = 'police'},
    },
    Stores = { -- prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
        {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
            loc = vector3(132.64, -1286.02, 28.84), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40, job = 'police'},
        {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
            loc = vector3(131.99, -1284.91, 28.73), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40, job = 'police'},
        {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
            loc = vector3(129.97, -1281.44, 28.74), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40, job = 'police'},
        {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
            loc = vector3(129.14, -1279.99, 28.68), l = 0.7, w = 1.0, lwr = 0.50, upr = 0.5, r = 120, job = 'police'},
    },
    Tills = { -- prop is only needed if you want to spawn an object | prop = 'prop_till_03' for example
        {loc = vec3(130.83, -1282.33, 29.42), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40,  commission = 0.2, job = 'police'},
        {loc = vec3(129.32, -1284.75, 29.44), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40,  commission = 0.2, job = 'police'},
        {loc = vec3(133.31, -1286.82, 29.4),  l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40,  commission = 0.2, job = 'police'},
    },
    stash = { -- prop is only needed if you want to spawn an object | prop = 'prop_lev_crate_01' for example
        {prop = 'prop_drop_crate_01',loc = vec3(131.6136, -1287.2435, 28.2753), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 120,slots = 20, weight = 100000, job = 'police'},
    },
    trays = { -- storages to place things for people | prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
        {prop = 'prop_food_tray_01', label = 'Grab Food', loc = vector3(129.6180, -1286.6339, 29.2904), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 214, slots = 20, weight = 100000, job = 'police'},
    }
}

```

### yeah this locations table is scary so lets break it down option by option!

## Crafter
###  so we have locations.Crafter now but how do we format it and what is all these numbers. im lost!
###  each crafter location needs a craftdata table like this

### CrafterData Parameters

| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `type` | Category name (must match craftStations key) | Yes | - |
| `targetLabel` | Target Label | No | "Craft" |
| `menuLabel`  | Menu Label  |  No|  "Craft!"|
| `prop`       | prop you want to spawn (if you want) | no | - |

### location Parameters

| Parameter | Description                       | Required | Default|
|-----------|---------------------------------  |----------|--------|
| `loc`       | Location coordinates (x, y, z)  | Yes      | -      |
| `l`        | Length of target zone            | No       | 1.0    |
| `w`        | Width of target zone             | No       | 1.0    |
| `lwr `    | Lower range of target zone        | No       | 1.0    |
| `upr  `     | Upper range of target zone      | No       | 1.0    |
| `r     `    | Radius  of target zone          | No       | 180.0  |
| `job    `   | Job type                        | Yes      | -      |


### so the smallest code block should look this this
```lua
locations = {
     Crafters = {
          {CraftData = {type ='grill'}, loc = vector3(118.00, 1452.32, 24.53), job = 'bestbuds'}
     }
}
```

### While the biggest should be
```lua
locations = {
     Crafters = {
          {CraftData = {type ='grill', targetLabel = 'Use Grill', menuLabel = "Use Grill!", prop = "grill_prop"},
             loc = vector3(118.00, 1452.32, 24.53), l = 1.0, w = 1.0, lwr = 1.0, upr = 1.0, r = 180, job = 'bestbuds'}
     }
}
```
### so this doesnt seem to hard! 

### now lets look again at Crafters 
```lua
  Crafter = { -- CraftData.type MUST MATCH A KEY VALUE IN craftStations ABOVE so type = 'cocktail' will look for cocktail in craftingStations
          {CraftData = {type = 'coffee', targetLabel = 'Make Coffee', menuLabel = 'Make Coffee!',prop = 'prop_coffee_mac_02'},
              loc = vector3(130.66, -1281.72, 29.5), l = 0.5, w = 0.4, lwr = 0.25, upr = 0.25, r = 40, job = 'police'},
          {CraftData = {type = 'ice', targetLabel = 'Grab Ice', menuLabel = 'Grab Ice!' }, 
              loc = vector3(127.95, -1281.9, 28.99), l = 1.25, w = 0.65, lwr = 0.5, upr = 0.5, r = 40, job = 'police'},
          {CraftData = {type = 'cocktail', targetLabel = 'Make Cocktail', menuLabel = 'Make Cocktail!' },
              loc = vector3(128.19, -1282.81, 29.44), l = 0.7, w = 0.6, lwr = 0.25, upr = 0.25, r = 120, job = 'police'},
          {CraftData = {type = 'cocktail', targetLabel = 'Make Cocktail', menuLabel = 'Make Cocktail!'},
              loc = vector3(128.57, -1283.46, 29.42), l = 0.7, w = 0.6, lwr = 0.25, upr = 0.25, r = 120, job = 'police'},
      },
```
- this means there are 4 locations to craft at
  - 2 cocktails
  - 1 ice
  - 1 coffee
- and if we look back at craftStations we should have 
```lua
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
```
  showing that we have all the types we made!

## Stores
### pretty much the same thing as Crafters!
```lua
  Stores = { -- prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
      {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
          loc = vector3(132.64, -1286.02, 28.84), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40, job = 'police'},
      {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
          loc = vector3(131.99, -1284.91, 28.73), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40, job = 'police'},
      {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
          loc = vector3(129.97, -1281.44, 28.74), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40, job = 'police'},
      {StoreData = {type = 'ingridients', targetLabel = 'Get Ingredients', menuLabel = 'Get Ingredients!'},
          loc = vector3(129.14, -1279.99, 28.68), l = 0.7, w = 1.0, lwr = 0.50, upr = 0.5, r = 120, job = 'police'},
  },
```
but this time we have StoreData instead of CraftData!

Other than that change Everything is the same as Crafter!

It just will look for 
```lua
    shops = { -- must match the key value in locations
        ingridients = {
        }
    }
```
just to re-iterate
### StoreData Parameters

| Parameter | Description | Required | Default |
|-----------|-------------|----------|---------|
| `type` | Category name (must match craftStations key) | Yes | - |
| `targetLabel` | Target Label | No | "Craft" |
| `menuLabel`  | Menu Label  |  No|  "Craft!"|
| `prop`       | prop you want to spawn | no | - |

### location Parameters

| Parameter | Description                     | Required | Default                     |
|-----------|---------------------------------|----------|-----------------------------|
| `loc`       | Location coordinates (x, y, z)  | Yes      | - |
| `l`        | Length of target zone           | No       | 1.0                        |
| `w`        | Width of target zone            | No       | 1.0                        |
| `lwr `    | Lower range of target zone      | No       | 1.0                        |
| `upr  `     | Upper range of target zone      | No       | 1.0                        |
| `r     `    | Radius  of target zone          | No       | 180.0                         |
| `job    `   | Job type                        | Yes      | -                   |


## Tills
### so now its a format change! lets break this down easier
```lua
    Tills = { -- prop is only needed if you want to spawn an object | prop = 'prop_till_03' for example
      {loc = vec3(130.83, -1282.33, 29.42), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40,  commission = 0.2, job = 'police'},
      {loc = vec3(129.32, -1284.75, 29.44), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40,  commission = 0.2, job = 'police'},
      {loc = vec3(133.31, -1286.82, 29.4),  l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 40,  commission = 0.2, job = 'police'},
    },
```

| Parameter    | Description                                      | Required | Default  |
|--------------|--------------------------------------------------|----------|----------|
| `loc`        | Location coordinates (x, y, z)                  | Yes      | -        |
| `l`          | Length of target zone                           | No       | 1.0      |
| `w`          | Width of target zone                            | No       | 1.0      |
| `lwr`        | Lower range of target zone                      | No       | 1.0      |
| `upr`        | Upper range of target zone                      | No       | 1.0      |
| `r`          | Radius of target zone                           | No       | 180.0    |
| `commission` | How much commission player gets (0.0-1.0) (0.2 is 20%) | Yes  | -      |
| `job`        | Job type                                         | Yes      | -        |


this one is fairly straight forward! 

## Stash and Trays!
### Stash and Trays Are the same thing besides one difference, trays anyone can open!
```lua
   stash = { -- prop is only needed if you want to spawn an object | prop = 'prop_lev_crate_01' for example
       {prop = 'prop_drop_crate_01',loc = vec3(131.6136, -1287.2435, 28.2753), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 120,slots = 20, weight = 100000, job = 'police'},
   },
   trays = { -- storages to place things for people | prop is only needed if you want to spawn an object | prop = 'prop_bar_fridge_01' for example
       {prop = 'prop_food_tray_01', label = 'Grab Food', loc = vector3(129.6180, -1286.6339, 29.2904), l = 0.5, w = 0.5, lwr = 0.10, upr = 0.25, r = 214, slots = 20, weight = 100000,},
   }
```
| Parameter | Description                                      | Required | Default       |
|-----------|--------------------------------------------------|----------|---------------|
| prop      | If you **want** to spawn a prop, just add which one here | No       | None          |
| label     | The target label                                  | no      |Open Stash / Grab Food          |
| l         | Length of target                                  | No      | 1.0           |
| w         | Width of target                                   | No      | 1.0           |
| lwr       | Lower height of target                            | No      | 1.0           |
| upr       | Upper height of target                            | No      | 1.0           |
| r         | Rotation of target                                | No       | 180.0             |
| slots     | How many slots the stash or tray will have        | Yes      | N/A           |
| weight    | How much weight the stash or tray can carry       | Yes      | N/A           |
|job (if stash)| What job can open this? | Yes (for stashes) | N/A|

# the hardest part is here
- make sure to add this file into server/locations folder. it will populate all that data you made on the next restart! 


