
local invcall
local progressbartype = Config.progressbartype
local notifytype = Config.Notify

function s(st, ...)
	local args = {...}
	return string.format(st, table.unpack(args))
end

if Config.Framework == 'qb' then
    if GetResourceState('qb-inventory') == 'started' then
		invcall = 'qb-inventory'
	elseif GetResourceState('ps-inventory') == 'started' then
		invcall = 'ps-inventory'
	elseif GetResourceState('lj-inventory') == 'started' then
		invcall = 'inventory'
	end
end

function progressbar(text, time, anim)
	TriggerEvent('animations:client:EmoteCommandStart', {anim})
	if GetResourceState('scully_emotemenu') == 'started' then
		exports.scully_emotemenu:playEmoteByCommand(anim)
	end
	if progressbartype == 'oxbar' then 
	  if lib.progressBar({ duration = time, label = text, useWhileDead = false, canCancel = true, disable = { car = true, move = true},}) then 
		if GetResourceState('scully_emotemenu') == 'started' then
			exports.scully_emotemenu:cancelEmote()
		else
			TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
		end
		return true
	end
	elseif progressbartype == 'oxcir' then
	  if lib.progressCircle({ duration = time, label = text, useWhileDead = false, canCancel = true, position = 'bottom', disable = { car = true,move = true},}) then 
		if GetResourceState('scully_emotemenu') == 'started' then
			exports.scully_emotemenu:cancelEmote()
		else
			TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
		end
		return true
	  end
	elseif progressbartype == 'qb' then
		local test = false
		local cancelled = false
	  QBCore.Functions.Progressbar("drink_something", text, time, false, true, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = true, disableInventory = true,
	  }, {}, {}, {}, function()-- Done
		test = true
		if GetResourceState('scully_emotemenu') == 'started' then
			exports.scully_emotemenu:cancelEmote()
		else
			TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
		end
	  end, function()
		cancelled = true
		if GetResourceState('scully_emotemenu') == 'started' then
			exports.scully_emotemenu:cancelEmote()
		else
			TriggerEvent('animations:client:EmoteCommandStart', {"c"}) 
		end
	end)
	  	repeat 
			Wait(100)
	  	until cancelled or test
	  	if test then return true end
	else
		print"^1 SCRIPT ERROR: Md-DRUGS set your progressbar with one of the options!"
	end
  end

function Notify(text, type)
	if notifytype =='ox' then
		lib.notify({title = text, type = type})
    elseif notifytype == 'qb' then
		QBCore.Functions.Notify(text, type)
	elseif notifytype == 'okok' then
		exports['okokNotify']:Alert('', text, 4000, type, false)
	else
      	print"dude, it literally tells you what you need to set it as in the config"
    end
end

function ItemCheck(item)
	if GetResourceState('ox_inventory') == 'started' then
		if exports.ox_inventory:GetItemCount(item) >= 1 then return true else Notify(s(L.Error.no_item, item), 'error') return false end
	else
		if QBCore.Shared.Items[item] == nil then print(s(L.devError.no_item, item, 'qb')) return end
		if QBCore.Functions.HasItem(item) then return true else Notify(s(L.Error.no_item, QBCore.Shared.Items[item].label), 'error') return false end
	end
end

function Freeze(ent, head)
	SetEntityHeading(ent, head)
	FreezeEntityPosition(ent, true)
	PlaceObjectOnGroundProperly(ent)
end

function AddBoxZone(name, loc, data)
local options = {}
	for k, v in pairs (data) do
		table.insert(options,{
			icon = v.icon or "fa-solid fa-eye", label = v.label, event = v.event or nil, action = v.action or nil,
			onSelect = v.action or nil,data = v.data,canInteract = v.canInteract or nil, distance = 2.0,
		})
	end
	if loc.w == nil then loc.w = 1.0 end
	if loc.l == nil then loc.l = 1.0 end
	if loc.lwr == nil then loc.lwr = 1.0 end
	if loc.upr == nil then loc.upr = 1.0 end
	if loc.r == nil then loc.r = 180.0 end
	if Config.Target == 'qb' then
		exports['qb-target']:AddBoxZone(name, loc.loc, loc.w, loc.l, {name = name, minZ = loc.loc.z-loc.lwr,maxZ = loc.loc.z + loc.upr, debugPoly = false, heading = loc.r + 0.0}, { options = options, distance = 2.5 })
	elseif Config.Target == 'ox' then
		exports.ox_target:addBoxZone({coords = loc.loc, size = vec3(loc.l,loc.w,loc.lwr + loc.upr), rotation = loc.r + 0.0, options = options, debug = false})
	elseif Config.Target == 'interact' then
		exports.interact:AddInteraction({coords = loc.loc, distance = 2.5, interactDst = 2.5, id = name, name = name, options = options})
	end
end

function AddTargModel(model, data, num)
	local options = {}
	for k, v in pairs (data) do
		table.insert(options, {
			icon = v.icon or "fa-solid fa-eye",  label = v.label, event = v.event or nil, action = v.action or nil,
			onSelect = v.action,data = v.data,canInteract = v.canInteract or nil, distance = 2.0,
		})
	end
	if Config.Target == 'qb' then
		exports['qb-target']:AddTargetEntity(model, {options = options, distance = 3.5})
	elseif Config.Target == 'ox' then
		exports.ox_target:addLocalEntity(model, options)
	elseif Config.Target == 'interact' then
		exports.interact:AddLocalEntityInteraction({
	            entity = model,
	            name = "entity_" .. tostring(model),
	            id = "entity_" .. tostring(model),
	            distance = 3.5,
	            interactDst = 2.0,
	            options = options
	        })
	end
end

function propsSpawn(entity, heading, ops)
	SetEntityHeading(entity, heading)
    FreezeEntityPosition(entity, true)
    SetEntityInvincible(entity, true)
	AddTargModel(entity, ops)
end

function GetImage(img)
    if GetResourceState('ox_inventory') == 'started' then
        local Items = exports['ox_inventory']:Items()
		if not Items[img] then print(s(L.devError.no_item, img, 'ox')) return 'Missing Image' end
        local itemClient = Items[img] and Items[img]['client']
        if itemClient and itemClient['image'] then
            return itemClient['image']
        else
            return "nui://ox_inventory/web/images/" .. img .. '.png'
        end
    end
    local invs = {
        ['ps-inventory'] = "nui://ps-inventory/html/images/",
        ['lj-inventory'] = "nui://lj-inventory/html/images/",
        ['qb-inventory'] = "nui://qb-inventory/html/images/",
        ['qs-inventory'] = "nui://qs-inventory/html/images/",
        ['origen_inventory'] = "nui://origen_inventory/html/img/",
        ['core_inventory'] = "nui://core_inventory/html/img/"
    }
    for k, v in pairs(invs) do
		if not QBCore.Shared.Items[img] then print(s(L.devError.no_item, img, 'QB')) return 'Missing Name' end
        if GetResourceState(k) == 'started' then
            return v .. QBCore.Shared.Items[img].image
        end
    end
end

function GetLabel(label)
	if GetResourceState('ox_inventory') == 'started' then
		local Items = exports['ox_inventory']:Items()
		if not Items[label] then print(s(L.devError.no_item, label, 'ox')) return 'Missing Name' end
		return Items[label]['label']
	else
		if QBCore.Shared.Items[label] == nil then print(s(L.devError.no_item, label, 'ox')) return 'Missing Name' end
		return QBCore.Shared.Items[label]['label']
	end
end


function getJobName()
	if Config.Framework == 'qb' then 
		return QBCore.Functions.GetPlayerData().job.name
	elseif Config.Framework == 'qbx' then
		return QBX.PlayerData.job.name
	elseif Config.Framework == 'esx' then
		return ESX.PlayerData.job.name
	end
end

function isBoss()
	if Config.Framework == 'qb' then 
		return QBCore.Functions.GetPlayerData().job.isboss
	elseif Config.Framework == 'qbx' then
		return QBX.PlayerData.job.isboss
	elseif Config.Framework == 'esx' then
		if ESX.PlayerData.job.grade_name == 'boss' then
			return true
		else
			return false
		end
	end
end

function hasJob(job)
	if getJobName() == job then return true else return false end
end

function openBossMenu(job)
	if Config.Framework == 'qb' then 
		TriggerEvent('qb-bossmenu:client:openMenu', job)
	elseif Config.Framework == 'qbx' then
		exports.qbx_management:OpenBossMenu('job')
	elseif Config.Framework == 'esx' then
		TriggerEvent('esx_society:openBossMenu', job, function(data, menu) end)
	end
end

function getItems()
	if Config.Framework == 'qb' then 
		return QBCore.Functions.GetPlayerData().items
	elseif Config.Framework == 'qbx' then
		return QBX.PlayerData.items
	elseif Config.Framework == 'esx' then
		return ESX.PlayerData.inventory
	end
end

function hasEnough(table)
	if Config.Inv == 'qb' then 
		local need, have = 0, 0
		for k, v in pairs(table) do
			need = need + 1
			for m, d in pairs (getItems()) do
				if d.name == k then
					if d.amount >= v then 
						have = have + 1
					end
				end
			end
		end
		if need == have then
			return false
		end
		return true
	elseif Config.Inv == 'ox' then
		local need, have = 0, 0
		for k, v in pairs(table) do
			need = need + 1
			local item = exports.ox_inventory:Search('slots', k)
			local count = 0
			for m, d in pairs(item) do
				count = count + d.count
			end
			if count >= v then
				have = have + 1
			end
		end
		if need == have then
			return false
		end
		return true
	end
end

function sort(tbl, key)
    table.sort(tbl, function(a, b)
        return a[key] < b[key]
    end)
end

function hasItem(item, amount)
	if GetResourceState('ox_inventory') == 'started' then
		if exports.ox_inventory:GetItemCount(item) >= amount then
			return '✔️'
		else
			return '❌'
		end
	else
		local count = 0
		for k, v in pairs (QBCore.Functions.GetPlayerData().items) do
			if v.name == item then
				count = count + v.amount
			end
		end
		if count >= amount then
			return '✔️'
		else
			return '❌'
		end
	end
end

function openMenu(id, title, data) 
	lib.registerContext({id = id, title = title, options = data})
	lib.showContext(id)
end

function makeCrafter(items, text, job, num)
    if getJobName() ~= job then 
        Notify(s(L.Error.no_job, job), 'error') 
        return
    end
    local options = {}
    local recipes = lib.callback.await('md-jobs:server:getRecipes', false, job, items)
	if not recipes then Notify('Something Went Wrong, Tell Your Dev To Check Crafters For ' .. job, 'error') return end
    for k, v in pairs(recipes) do
		if not v.time then v.time = 5000 end
        local label, item = {}, ''
        v.progtext = v.progtext or 'Crafting '
        for m, d in pairs(v.give) do  table.insert(label, hasItem(m, d) .. GetLabel(m) .. ' X ' .. d) end
        for m, d in pairs(v.take) do item = m end
        table.insert(options, {
            icon = GetImage(item),
            description = table.concat(label, ", \n"),
            title = GetLabel(item),
            disabled = hasEnough(v.give),
            onSelect = function()
                if Config.MultiCraft then
                    local maxCraft = lib.callback.await('md-jobs:server:getCraftingMax', false, job, items, item, k)
					if not maxCraft then Notify('Something Went Wrong, Tell Your Dev To Check Crafters For ' .. job, 'error') return end
                    local amount = lib.inputDialog(L.Menus.craft.am, {
                        {type = 'number', description = L.Menus.craft.description, text = 'Amount', default = 1, min = 1, max = maxCraft}
                    })
                    local stop = false
					if not amount or amount[1] == nil then return end
                    repeat
                        if not progressbar(s(L.Progressbars.Crafting, v.progtext, GetLabel(item)), v.time, v.anim) then 
                            stop = true
                            return
                        end
                        local can = lib.callback.await('md-jobs:server:canCraft', false, job, items, k, num)
                        amount[1] = amount[1] - 1
                    until amount[1] == 0 or not can or stop
                else
                    if not progressbar(s(L.Progressbars.Crafting, v.progtext, GetLabel(item)), v.time, v.anim) then  
                        return 
                    end
                    lib.callback.await('md-jobs:server:canCraft', false, job, items, k, num)
                end
            end
        })
    end
    sort(options, 'title')
    openMenu('Crafters', text, options)
end

function makeStore(store, job, text, num)
	local options = {}
	local items = lib.callback.await('md-jobs:server:getShops', false, job, store)
	if not items then Notify('Something Went Wrong, Tell Your Dev To Check Stores For ' .. job, 'error') return end
	if type(items) == 'string' then exports.ox_inventory:openInventory('shop', { type = items, id = num }) return end
	if getJobName() ~= job then Notify(s(L.Error.no_job, job), 'error') return end
	if Config.UseShops then return end
	for k, v in pairs(items) do
		options[#options + 1] = {
			icon = GetImage(v.name),
			title = GetLabel(v.name),
			description = L.cur .. v.price,
			onSelect = function()
				local quantity = lib.inputDialog(L.Menus.store.am, {
					{type = 'number', description = L.Menus.store.description, text = 'Amount', default = 1, min = 0, max = 50}
				})
				if not quantity and quantity[1] then return end
				local paid = lib.callback.await('md-jobs:server:purchaseShops', false, job, store, v.name, quantity[1], num)
			end
		}
	end
	sort(options, 'title')
	openMenu('Stores',text, options)
end


lib.callback.register('md-jobs:client:chargePerson', function(peeps)
	if peeps[1] == nil then Notify(L.Error.no_near, 'error') return end
	local bills = lib.inputDialog(L.Menus.billing.title, {
		{type = 'select', description = L.Menus.billing.who, options = peeps},
		{type = 'number', description = L.Menus.billing.description, text = L.Menus.billing.amount, default = 1, min = 0, max = 100000}
	})
	if not bills then return end
	return {amount = bills[2], cid = bills[1]}
end)

lib.callback.register('md-jobs:client:acceptCharge', function(amount)
	local accept = lib.inputDialog(L.Menus.acceptBill.title, {
		{type = 'select', description = L.Menus.acceptBill.cashor ,options = {{label = L.Menus.acceptBill.card, value = 'bank'},{label = L.Menus.acceptBill.cash, value = 'cash'}}},
		{type = 'select', description = s(L.Menus.acceptBill.description, amount),options = {{label = L.Menus.acceptBill.accept, value = true},{label = L.Menus.acceptBill.decline, value = false}}}
	})
	if not accept then return false end
	if not accept[2] then return false end
	return {accept = accept[2], type = accept[1]}
end)

function openTray(name, weight, slot, num, job)
	if Config.Inv == 'ox' then
		exports.ox_inventory:openInventory('stash', {id = name})
	elseif Config.Inv == 'oldqb' then 
		Wait(100)
		TriggerEvent(invcall..":client:SetCurrentStash", name)
		TriggerServerEvent(invcall..":server:OpenInventory", "stash", name, {maxweight = weight,slots = slot,})
	elseif Config.Inv == 'outdated' then
		local other = {maxweight = weight, slots = slot}
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "Stash_"..name, other)
		TriggerEvent("inventory:client:SetCurrentStash", "Stash_"..name)
	elseif Config.Inv == 'qb' then
		TriggerServerEvent('md-jobs:server:openTray', name, weight, slot, num, job)
	end
end

function openStash(name, weight, slot, num, job)
	if getJobName() ~= job then Notify(s(L.Error.no_job, job), 'error') return end
	if Config.Inv == 'ox' then
		exports.ox_inventory:openInventory('stash', {id = name})
	elseif Config.Inv == 'oldqb' then 
		Wait(100)
		TriggerEvent(invcall..":client:SetCurrentStash", name)
		TriggerServerEvent(invcall..":server:OpenInventory", "stash", name, {maxweight = weight,slots = slot,})
	elseif Config.Inv == 'outdated' then
		local other = {maxweight = weight, slots = slot}
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "Stash_"..name, other)
		TriggerEvent("inventory:client:SetCurrentStash", "Stash_"..name)
	elseif Config.Inv == 'qb' then
		TriggerServerEvent('md-jobs:server:openStash', name, weight, slot, num, job)
	end
end

local function calculateRemainingTime(due, time)
    local diff = due - time
    if diff < 0 then return 'finished' end
    local hour = math.floor((diff % (60 * 60 * 24)) / (60 * 60))
    local minute = math.floor((diff % (60 * 60)) / 60)
    local secs = math.floor(diff %  60)
    return s(L.cater.time, hour, minute, secs)
end

local function stopCatering(job)
	local stop = lib.callback.await('md-jobs:server:stopCatering', false, job)
	if stop then Notify(L.cater.timeout, 'error') return end
end

local function checkCatering(job)
	if getJobName() ~= job then Notify(s(L.Error.no_job, job), 'error') return end
	local data, time = lib.callback.await('md-jobs:server:checkCatering', false, job)
	if data == nil then Notify(L.cater.no_cater, 'error') return end
	local totals, datas, dt = json.decode(data.totals), json.decode(data.data), json.decode(data.details)
	local due = calculateRemainingTime(dt.dueby, time)
	if due == 'finished' then stopCatering(data.job) return end
	local drop = '  \n  '
    local itemList = {}
    for _, v in ipairs(datas) do
        table.insert(itemList, GetLabel(v.item) .. ": Amount: " .. v.amount .. " price: $" .. v.price)
    end
	table.sort(itemList)
	local ord = s(L.cater.check, drop, drop, dt.firstname, dt.lastname, drop, dt.location.label, drop, -- no touch plz
	calculateRemainingTime(dt.dueby, time), drop, totals.amount, drop, totals.price, drop, drop, table.concat(itemList, "  \n  ")) 
	local alert = lib.alertDialog({ header = s(L.cater.cater_header, job), content = ord, centered = true, cancel = true})
	return true
end


lib.callback.register('md-jobs:client:addItemsToClosed', function(data)
	local add = lib.inputDialog(L.Menus.addItem, data)
	return add
end)

lib.callback.register('md-jobs:client:removeItemsFromClosed', function(data)
	local remove = lib.inputDialog(L.Menus.removeItems, data)
	return remove
end)

function manageClosed(job,num)
	lib.registerContext({id = 'closedShops', title = job .. ' Shop', 
	options = {
		{title = L.Menus.addItem,description = L.Menus.aIdes,
			onSelect = function()
				lib.callback.await('md-jobs:server:addItemsToClosed', false, job, num)
			end
		},
		{title = L.Menus.removeItems,description = L.Menus.rIdes,
			onSelect = function()
				lib.callback.await('md-jobs:server:removeItemsFromClosed', false, job, num)
			end,
			disabled = not isBoss()
		},
	} })
	lib.showContext('closedShops')
end

lib.callback.register('md-jobs:client:adjustPrices', function(data)
	local adjust = lib.inputDialog(L.Menus.adjustPrices, data)
	return adjust
end)

function adjustPrices(job, num)
	lib.callback.await('md-jobs:server:adjustPrices', false, job, num)
end

function openClosedShop(job, num)
	local data = lib.callback.await('md-jobs:server:getClosedShops', false, job, num)
	local options = {}
	if #data == 0 then Notify(L.closed.no_item, 'error') return end
	for k, v in pairs (data) do
		options[#options + 1] = {
			icon = GetImage(v.name),
			title = s(L.closed.des, GetLabel(v.name), v.price),
			description = s(L.closed.stock, v.amount),
			onSelect = function()
				local quantity = lib.inputDialog(L.Menus.closed.amount, {
					{type = 'number', description = L.Menus.closed.description, text = 'Amount', default = 1, min = 0, max = 50},
					{type = 'select', description = 'How Would You Like To Pay?', options = {{label = 'Cash', value = 'cash'},{label = 'Bank', value = 'bank'}}}
				})
				if not quantity and quantity[1] then return end
				local paid = lib.callback.await('md-jobs:server:purchaseClosedShops', false, job, v.name, quantity[1], num, quantity[2])
			end
		}
	end
	lib.registerContext({id = 'closedShops', title = s(L.Menus.closed.shop, job), options = options})
	lib.showContext('closedShops')
end

local function startCatering(job)
	local start = lib.callback.await('md-jobs:server:startCatering', false, job)
	if start then 
		Notify(L.cater.manage.started, 'success')
	end
end

local function deliverCatering(job)
	local info, time = lib.callback.await('md-jobs:server:getCateringInfo', false, job)
	local details = json.decode(info.details)
	if details.dueby - time < 0 then
		Notify(L.cater.manage.too_late, 'error')
		local stop = lib.callback.await('md-jobs:server:stopCatering', false, job)
		return
	end
	lib.requestModel(details.location.model, 30000)
	local ped = CreatePed(4, details.location.model, details.location.loc.x, details.location.loc.y, details.location.loc.z-1, details.location.loc.w, false, false)
	Freeze(ped, details.location.loc.w)
	local blip = AddBlipForEntity(ped)
	SetBlipSprite(blip, 326)
	SetBlipDisplay(blip, 2)
	SetBlipScale(blip, 0.9)
	SetBlipColour(blip, 8)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Catering')
	EndTextCommandSetBlipName(blip)
	AddTargModel(ped, {
		{icon = 'fas fa-utensils', label = L.cater.manage.deliver, action = function()
			local deliver = lib.callback.await('md-jobs:server:deliverCatering', false, job)
			if deliver then 
				Notify(L.cater.manage.complete, 'success')
				DeleteEntity(ped)
				RemoveBlip(blip)
			end
		end
	}})
	local plate = lib.callback.await('md-jobs:server:cateringVan', false, job)
	giveKeys(plate)
	SetVehicleFuelLevel(plate, 100.0)
	Notify(L.cater.manage.van, 'success')
end

local function cancelCatering(job)
	local stop = lib.callback.await('md-jobs:server:stopCatering', false, job)
	if stop then Notify(L.cater.manage.cancelled, 'error') return end
end

local function addToCatering(job)
	local add = lib.callback.await('md-jobs:server:addtoCatering', false, job)
	if not add then return end
	Notify(L.cater.manage.added 'success')
end

local function checkHistory(job)
	local history = lib.callback.await('md-jobs:server:getCateringHistory', false, job)
	local options = {}
	for k, v in pairs (history) do
		local c, t, r, e  = json.decode(v.customer), json.decode(v.totals), json.decode(v.receipt), json.decode(v.employees)
		options[#options + 1] = {
			title = c.label,
			description = s(L.cater.manage.hd,c.name,t.price),
			onSelect = function()
				local d = '  \n  '
				local itemList = {}
				for _, d in pairs (r) do table.insert(itemList, GetLabel(d.item) .. ": Amount: " .. d.amount) end
				table.sort(itemList)
				local empList = {}
				if #e == 0 then 
					data = data .. e.name
				else
					for _, d in pairs (e) do table.insert(empList, d.name) end
				end
				table.sort(empList)
				local des = s(L.cater.manage.hd_desc,d, d, c.name, d, c.label, d, t.amount, d, t.price, d, d, table.concat(itemList, "  \n  "), d, d, table.concat(empList, "  \n  "))
				lib.alertDialog({header = c.label,content = des,centered = true,cancel = true})
			end
		}
	end
	lib.registerContext({id = 'cateringHistory', title = 'Catering History', options = options})
	lib.showContext('cateringHistory')
end

function manageCatering(job)
	if getJobName() ~= job then Notify(s(L.Error.no_job, job), 'error') return end
	lib.registerContext({
		id = 'catering',
		title = s(L.cater.manage.title, job),
		options = {
		  { title = L.cater.manage.start, description = L.cater.manage.start_desc,  onSelect = function() startCatering(job) end },
		  { title = L.cater.manage.check, description = L.cater.manage.check_desc,  onSelect = function() checkCatering(job) end},
		  {title = L.cater.manage.deliver,description = L.cater.manage.deliver_desc,onSelect = function() deliverCatering(job) end  },
		  {title = L.cater.manage.cancel, description = L.cater.manage.cancel_desc,	onSelect = function() cancelCatering(job) end	},
		  {title = L.cater.manage.add,    description = L.cater.manage.add_desc,	onSelect = function() addToCatering(job) end},
		  {title = L.cater.manage.history,description = L.cater.manage.history_desc,disabled = not isBoss(), onSelect = function() checkHistory(job) end}
		}
	  })
	  lib.showContext('catering')
end

function canOpenClosed(job)
	if Config.ClosedShopAlwaysActive then
		return true
	else
		if not GlobalState.MDJobsCount then return false end
		if GlobalState.MDJobsCount[job] > Config.ClosedShopCount then
			return false
		else
			return true
		end
	end
end

lib.callback.register('md-jobs:client:consume', function(item, data)
   if not data.label then data.label = 'Consuming ' end
   if not data.time then data.time = 5000 end
   if not data.anim then data.anim = 'uncuff' end 
   if not progressbar(data.label .. ' ' .. GetLabel(item), data.time, data.anim) then return false end
   return true
end)

function giveKeys(veh)
	if Config.Framework == 'qb' then 
		TriggerEvent("vehiclekeys:client:SetOwner",veh)
	elseif Config.Framework == 'qbx' then
		TriggerEvent("vehiclekeys:client:SetOwner", veh)
	elseif Config.Framework == 'esx' then
		print('someone PR This for esx vehicle keys idk esx much and im lazy')
	end
end
