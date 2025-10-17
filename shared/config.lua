Config = {}
Jobs = {}                              -- no touch if you do I will need therapy even more.
Config.Debug = false                    -- Enables zone debug **do not use in production**
Config.AutorunSQL = true               -- Recommended to leave this true, otherwise you must maintain the database
Config.UseClientPeds = false           -- If you want to spawn peds on the client instead of the server (not recommended)
Config.Target = 'ox'                   -- qb or ox
Config.Inv = 'ox'                      -- qb or ox || you really should only be using ox in 2025
Config.Framework = 'qb'               -- qb or esx or qbx
Config.Banking = 'qb'                -- qb, qb-management, renewed, fd, tgg, okok
Config.ProgressBarType = 'oxbar'       -- oxcir, oxbar or qb
Config.Notify = 'ox'                   -- qb or ox or okok
Config.TextUIPosition = 'right-center' -- 'right-center' or 'left-center' or 'top-center' or 'bottom-center'
Config.UseShops = true                 -- If you want to use shops **only for new qb and ox inventory**
Config.MultiCraft = true               -- If you want to loop crafting
Config.MultiCraftDefault = 10          -- How many items you want to craft one after another By Default IF MultiCraft
Config.DefaultCraftTime = 5000         -- Default time for crafting an item is true
Config.MaxCateringWeight = 1000000     -- Max weight for catering
Config.VehicleReturnFee = 0.1          -- Charged if the catering vehicle is not returned (default: 0.1 = 10% of the total)
Config.ParkVehicleKey = 'E'            -- The key that triggers "parking" or "returning" the catering vehicle
Config.ClosedShopAlwaysActive = true   -- If you want to always have closed shops active
Config.ClosedShopLoop = 5              -- How many minutes you want to wait for the closed shop loop | Recommended higher than 5
Config.ClosedShopCount = 2             -- How many players you want to allow to be on duty before closed shops are active
Config.ClosedShopFee = 0.2             -- 20% of the total price
Config.GroupBlips = true              -- If blips should group by category on map set to true
Config.CategoryNames = {
    [15] = "Food",
    [16] = "Bar",
    [17] = "Coffee Shop",
    [18] = "Weed Shop",
}

if Config.Framework == 'qb' then
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'qbx' then
    QBOX = exports.qbx_core
end
