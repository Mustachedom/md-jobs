Config = {}
Jobs = {} -- no touch if you do I will need therapy even more.
Config.Target = 'ox' -- qb or ox
Config.Inv = 'ox' -- qb or ox || you really should only be using ox in 2025
Config.Framework = 'qb' -- qb or esx or qbx
Config.Banking = 'qb' -- qb, qb-management, renewed, fd, tgg, okok
Config.ClosedShopFee = 0.2 -- 20% of the total price
Config.progressbartype = 'oxbar' -- oxcir, oxbar or qb
Config.Notify = 'ox' -- qb or ox or okok
Config.UseShops = true -- If you want to use shops **only for new qb and ox inventory**
Config.MultiCraft = true -- If you want to loop crafting
Config.MultiCraftDefault = 10 -- How many items you want to craft one after another By Default IF MultiCraft is true
Config.MaxCateringWeight = 1000000 -- Max weight for catering
Config.DefaultCraftTime = 5000 -- Default time for crafting an item
Config.ClosedShopAlwaysActive = true -- If you want to always have closed shops active
Config.ClosedShopLoop = 5 -- How many minutes you want to wait for the closed shop loop | Recommended higher than 5 
Config.ClosedShopCount = 2 -- How many players you want to allow to be on duty before closed shops are active

if Config.Framework == 'qb' then 
    QBCore = exports['qb-core']:GetCoreObject()
elseif Config.Framework == 'esx' then
    ESX = exports['es_extended']:getSharedObject()
elseif Config.Framework == 'qbx' then
    QBOX = exports.qbx_core
end
