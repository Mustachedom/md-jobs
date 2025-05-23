local invcall
local progressbartype = Config.ProgressBarType
local notifytype = Config.Notify

-- Initialize inventory
if Config.Framework == 'qb' then
	if GetResourceState('qb-inventory') == 'started' then
		invcall = 'qb-inventory'
	elseif GetResourceState('ps-inventory') == 'started' then
		invcall = 'ps-inventory'
	elseif GetResourceState('lj-inventory') == 'started' then
		invcall = 'inventory'
	end
end

-------------------------
---- Local Functions ----
-------------------------

--- Display a progress bar
--- @param text string the text to display in the progress bar
--- @param time number the duration of the progress bar
--- @param anim string the animation to play during the progress bar
--- @return boolean - true if the progress bar was completed successfully, false if cancelled
local function progressbar(text, time, anim)
	TriggerEvent('animations:client:EmoteCommandStart', { anim })
	if GetResourceState('scully_emotemenu') == 'started' then
		exports.scully_emotemenu:playEmoteByCommand(anim)
	end
	if progressbartype == 'oxbar' then
		if lib.progressBar({
				duration = time,
				label = text,
				useWhileDead = false,
				canCancel = true,
				disable = { car = true, move = true },
			}) then
			if GetResourceState('scully_emotemenu') == 'started' then
				exports.scully_emotemenu:cancelEmote()
			else
				TriggerEvent('animations:client:EmoteCommandStart', { "c" })
			end
			return true
		end
	elseif progressbartype == 'oxcir' then
		if lib.progressCircle({
				duration = time,
				label = text,
				useWhileDead = false,
				canCancel = true,
				position = 'bottom',
				disable = { car = true, move = true },
			}) then
			if GetResourceState('scully_emotemenu') == 'started' then
				exports.scully_emotemenu:cancelEmote()
			else
				TriggerEvent('animations:client:EmoteCommandStart', { "c" })
			end
			return true
		end
	elseif progressbartype == 'qb' then
		local completed = false
		local cancelled = false

		QBCore.Functions.Progressbar(
			"drink_something",
			text,
			time,
			false,
			true,
			{
				disableMovement    = true,
				disableCarMovement = true,
				disableMouse       = false,
				disableCombat      = true,
				disableInventory   = true,
			},
			{}, {}, {},
			function() -- onDone
				completed = true
				if GetResourceState('scully_emotemenu') == 'started' then
					exports.scully_emotemenu:cancelEmote()
				else
					TriggerEvent('animations:client:EmoteCommandStart', { "c" })
				end
			end,
			function() -- onCancel
				cancelled = true
				if GetResourceState('scully_emotemenu') == 'started' then
					exports.scully_emotemenu:cancelEmote()
				else
					TriggerEvent('animations:client:EmoteCommandStart', { "c" })
				end
			end
		)
		repeat
			Wait(100)
		until cancelled or completed
		if completed then
			return true
		end
	else
		print "^1 SCRIPT ERROR: Md-DRUGS set your progressbar with one of the options!"
		return false
	end
	return false
end

--- Give keys to a vehicle
--- @param veh string the vehicle to give keys to
--- @return nil
local function giveKeys(veh)
	if Config.Framework == 'qb' then
		TriggerEvent("vehiclekeys:client:SetOwner", veh)
	elseif Config.Framework == 'qbx' then
		TriggerEvent("vehiclekeys:client:SetOwner", veh)
	elseif Config.Framework == 'esx' then
		print('someone PR This for esx vehicle keys idk esx much and im lazy')
	end
end

--- Start a catering job
--- @param job string the job to start catering for
--- @return nil
local function startCatering(job)
	local started = lib.callback.await('md-jobs:server:startCatering', false, job)
	if started then
		Notify(L.cater.manage.started, 'success')
	end
end

--- Deliver catering to a location
--- @param job string the job to deliver catering for
--- @return nil
local function deliverCatering(job)
	local info, currentTime = lib.callback.await('md-jobs:server:getCateringInfo', false, job)
	info.employees          = json.decode(info.employees)
	info.totals             = json.decode(info.totals)
	info.details            = json.decode(info.details)
	info.data               = json.decode(info.data)
	local details           = info.details
	if details.dueby - currentTime < 0 then
		Notify(L.cater.manage.too_late, 'error')
		lib.callback.await('md-jobs:server:stopCatering', false, job)
		return
	end
	lib.requestModel(details.location.model, 30000)
	local npcPed = CreatePed(
		4,
		details.location.model,
		details.location.loc.x,
		details.location.loc.y,
		details.location.loc.z - 1,
		details.location.loc.w,
		false,
		false
	)
	Freeze(npcPed, details.location.loc.w)
	local blip = AddBlipForEntity(npcPed)
	SetBlipSprite(blip, 326)
	SetBlipDisplay(blip, 2)
	SetBlipScale(blip, 0.9)
	SetBlipColour(blip, 8)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('Catering')
	EndTextCommandSetBlipName(blip)
	AddTargModel(npcPed, {
		{
			icon   = 'fas fa-utensils',
			label  = L.cater.manage.deliver,
			action = function()
				local delivered = lib.callback.await('md-jobs:server:deliverCatering', false, job)
				if delivered then
					Notify(L.cater.manage.delivered, 'success')
					DeleteEntity(npcPed)
					RemoveBlip(blip)
				end
			end,
		}
	})
	local vanPlate = lib.callback.await('md-jobs:server:cateringVan', false, job)
	giveKeys(vanPlate)
	SetVehicleFuelLevel(vanPlate, 100.0)
	Notify(L.cater.manage.van, 'success')
	SetModelAsNoLongerNeeded(details.location.model)
end

--- Cancel catering for a job
--- @param job string the job to cancel catering for
--- @return nil
local function cancelCatering(job)
	local stopped = lib.callback.await('md-jobs:server:stopCatering', false, job)
	if stopped then
		Notify(L.cater.manage.cancelled, 'error')
	end
end

--- Add the client to a catering job
--- @param job string the job to add the client to
--- @return nil
local function addToCatering(job)
	local added = lib.callback.await('md-jobs:server:addtoCatering', false, job)
	if added then
		Notify(L.cater.manage.added, 'success')
	end
end

--- Check the catering history for a job
--- @param job string the job to check the catering history for
--- @return nil
local function checkHistory(job)
	local historyEntries = lib.callback.await('md-jobs:server:getCateringHistory', false, job)
	local options = {}
	if not historyEntries or next(historyEntries) == nil then
		options[#options + 1] = {
			title       = L.cater.manage.history_none,
			description = L.cater.manage.history_none_desc,
		}
	else
		for _, entry in pairs(historyEntries) do
			local customerData    = json.decode(entry.customer)
			local totalsData      = json.decode(entry.totals)
			local receiptData     = json.decode(entry.receipt)
			local employeesData   = json.decode(entry.employees)
			options[#options + 1] = {
				title       = customerData.label,
				description = Format(L.cater.manage.hd, customerData.name, totalsData.price),
				onSelect    = function()
					local indent = '  \n  '
					local itemList = {}
					for _, receiptItem in pairs(receiptData) do
						table.insert(
							itemList,
							GetLabel(receiptItem.item) .. ": Amount: " .. receiptItem.amount
						)
					end
					table.sort(itemList)
					local employeeList = {}
					if #employeesData == 1 then
						table.insert(employeeList, employeesData[1].name)
					else
						for _, employee in ipairs(employeesData) do
							table.insert(employeeList, employee.name)
						end
					end
					table.sort(employeeList)
					local descriptionText = Format(
						L.cater.manage.hd_desc,
						indent, indent,
						customerData.name,
						indent,
						customerData.label,
						indent,
						totalsData.amount,
						indent,
						totalsData.price,
						indent, indent,
						table.concat(itemList, indent),
						indent, indent,
						table.concat(employeeList, indent)
					)
					lib.alertDialog({
						header   = customerData.label,
						content  = descriptionText,
						centered = true,
						cancel   = true,
					})
				end,
			}
		end
	end

	lib.registerContext({
		id      = 'cateringHistory',
		title   = 'Catering History',
		options = options,
	})
	lib.showContext('cateringHistory')
end

--- Get the player's job name
--- @return string - the player's job name
local function getJobName()
	if Config.Framework == 'qb' then
		return QBCore.Functions.GetPlayerData().job.name
	elseif Config.Framework == 'qbx' then
		return QBX.PlayerData.job.name
	elseif Config.Framework == 'esx' then
		return ESX.PlayerData.job.name
	end
	return 'Config.Framework not set'
end

--- Get the player's inventory items
--- @return table - the player's inventory items
local function getItems()
	if Config.Framework == 'qb' then
		return QBCore.Functions.GetPlayerData().items
	elseif Config.Framework == 'qbx' then
		return QBX.PlayerData.items
	elseif Config.Framework == 'esx' then
		return ESX.PlayerData.inventory
	end
	return {}
end

--- Check if the player has enough items in their inventory
--- @param requiredItems table - the items to check for
--- @return boolean - true if the player has enough items, false otherwise
local function hasEnough(requiredItems)
	if Config.Inv == 'qb' then
		local totalRequirements = 0
		local satisfiedCount    = 0
		for itemName, requiredQuantity in pairs(requiredItems) do
			totalRequirements = totalRequirements + 1
			for _, inventoryItem in pairs(getItems()) do
				if inventoryItem.name == itemName
					and inventoryItem.amount >= requiredQuantity
				then
					satisfiedCount = satisfiedCount + 1
				end
			end
		end
		if totalRequirements == satisfiedCount then
			return false
		end
		return true
	elseif Config.Inv == 'ox' then
		local totalRequirements = 0
		local satisfiedCount    = 0
		for itemName, requiredQuantity in pairs(requiredItems) do
			totalRequirements = totalRequirements + 1
			local foundSlots  = exports.ox_inventory:Search('slots', itemName)
			local totalCount  = 0
			for _, slotDetail in pairs(foundSlots) do
				totalCount = totalCount + slotDetail.count
			end
			if totalCount >= requiredQuantity then
				satisfiedCount = satisfiedCount + 1
			end
		end
		if totalRequirements == satisfiedCount then
			return false
		end
		return true
	end
	return false
end

--- Check if the player has a specific item in their inventory
--- @param item string - the item to check for
--- @param amount number - the amount of the item to check for
--- @return string - '✔️' if the player has the item, '❌' otherwise
local function hasItem(item, amount)
	if GetResourceState('ox_inventory') == 'started' then
		if exports.ox_inventory:GetItemCount(item) >= amount then
			return '✔️'
		else
			return '❌'
		end
	else
		local count = 0
		for _, inventoryItem in pairs(QBCore.Functions.GetPlayerData().items) do
			if inventoryItem.name == item then
				count = count + inventoryItem.amount
			end
		end
		if count >= amount then
			return '✔️'
		else
			return '❌'
		end
	end
end

--- Open a given menu
--- @param id string the id of the menu to open
--- @param title string the title of the menu
--- @param data table the data for the menu
--- @return nil
local function openMenu(id, title, data)
	lib.registerContext({ id = id, title = title, options = data })
	lib.showContext(id)
end

--- Calculate the remaining time for a catering job
--- @param due number the due time for the catering job
--- @param time number the current time
--- @return string - the formatted remaining time
local function calculateRemainingTime(due, time)
	local diff = due - time
	if diff < 0 then
		return 'finished'
	end
	local hours   = math.floor((diff % (60 * 60 * 24)) / (60 * 60))
	local minutes = math.floor((diff % (60 * 60)) / 60)
	local seconds = math.floor(diff % 60)
	return Format(L.cater.time, hours, minutes, seconds)
end

--- Stop catering for a job
--- @param job string the job to stop catering for
--- @return nil
local function stopCatering(job)
	local isStopped = lib.callback.await('md-jobs:server:stopCatering', false, job)
	if isStopped then
		Notify(L.cater.timeout, 'error')
		return
	end
end

--- Check catering for a job
--- @param job string the job to check catering for
--- @return boolean - true if catering is available, false otherwise
local function checkCatering(job)
	if getJobName() ~= job then
		Notify(Format(L.Error.no_job, job), 'error')
		return false
	end
	local cateringInfo, currentTime = lib.callback.await('md-jobs:server:checkCatering', false, job)
	if cateringInfo == nil then
		Notify(L.cater.no_cater, 'error')
		return false
	end
	local totalsTable   = json.decode(cateringInfo.totals)
	local rawItemList   = json.decode(cateringInfo.data)
	local jobDetails    = json.decode(cateringInfo.details)
	local timeRemaining = calculateRemainingTime(jobDetails.dueby, currentTime)
	if timeRemaining == 'finished' then
		stopCatering(cateringInfo.job)
		return false
	end
	local indent    = '  \n  '
	local itemLines = {}
	for _, itemData in ipairs(rawItemList) do
		table.insert(
			itemLines,
			GetLabel(itemData.item)
			.. ": Amount: " .. itemData.amount
			.. " price: $" .. itemData.price
		)
	end
	table.sort(itemLines)
	local dialogContent = Format(
		L.cater.check,
		indent, indent,
		jobDetails.firstname, jobDetails.lastname,
		indent, jobDetails.location.label,
		indent, timeRemaining,
		indent, totalsTable.amount,
		indent, totalsTable.price,
		indent, indent,
		table.concat(itemLines, indent)
	)
	lib.alertDialog({
		header   = Format(L.cater.cater_header, job),
		content  = dialogContent,
		centered = true,
		cancel   = true,
	})
	return true
end

--------------------------
---- Global Functions ----
--------------------------

--- Notify the player
--- @param text string the text to display in the notification
--- @param type string the type of notification to display
--- @return nil
function Notify(text, type)
	if notifytype == 'ox' then
		lib.notify({ title = text, type = type })
	elseif notifytype == 'qb' then
		QBCore.Functions.Notify(text, type)
	elseif notifytype == 'okok' then
		exports['okokNotify']:Alert('', text, 4000, type, false)
	else
		print "dude, it literally tells you what you need to set it as in the config"
	end
end

--- Check if the player has an item
--- @param item string the item to check for
--- @return boolean - true if the player has the item, false otherwise
function ItemCheck(item)
	if GetResourceState('ox_inventory') == 'started' then
		if exports.ox_inventory:GetItemCount(item) >= 1 then
			return true
		else
			Notify(Format(L.Error.no_item, item), 'error')
			return false
		end
	else
		if QBCore.Shared.Items[item] == nil then
			print(Format(L.devError.no_item, item, 'qb'))
			return false
		end
		if QBCore.Functions.HasItem(item) then
			return true
		else
			Notify(Format(L.Error.no_item, QBCore.Shared.Items[item].label), 'error')
			return false
		end
	end
end

--- Freeze an entity in place
--- @param ent number the entity to freeze
--- @param head number the heading to set the entity to
--- @return nil
function Freeze(ent, head)
	SetEntityHeading(ent, head)
	FreezeEntityPosition(ent, true)
	PlaceObjectOnGroundProperly(ent)
end

--- Add a box zone to the map
--- @param name string the name of the zone
--- @param loc table the location of the zone
--- @param data table the data for the zone
--- @return nil
function AddBoxZone(name, loc, data)
	local options = {}
	for _, zoneData in pairs(data) do
		table.insert(options, {
			icon        = zoneData.icon or "fa-solid fa-eye",
			label       = zoneData.label,
			event       = zoneData.event,
			action      = zoneData.action,
			onSelect    = zoneData.action,
			data        = zoneData.data,
			canInteract = zoneData.canInteract,
			distance    = 2.0,
		})
	end
	loc.w   = loc.w or 1.0
	loc.l   = loc.l or 1.0
	loc.lwr = loc.lwr or 1.0
	loc.upr = loc.upr or 1.0
	loc.r   = loc.r or 180.0
	if Config.Target == 'qb' then
		exports['qb-target']:AddBoxZone(
			name,
			loc.loc,
			loc.w, loc.l,
			{
				name      = name,
				minZ      = loc.loc.z - loc.lwr,
				maxZ      = loc.loc.z + loc.upr,
				debugPoly = false,
				heading   = loc.r + 0.0
			},
			{ options = options, distance = 2.5 }
		)
	elseif Config.Target == 'ox' then
		exports.ox_target:addBoxZone({
			coords   = loc.loc,
			size     = vec3(loc.l, loc.w, loc.lwr + loc.upr),
			rotation = loc.r + 0.0,
			options  = options,
			debug    = false,
		})
	end
end

--- Add a target model to the map
--- @param model number the model to add
--- @param data table the data for the target
--- @return false | number - false if the target was not added, or the target id
function AddTargModel(model, data)
	local options = {}
	for _, modelOption in pairs(data) do
		table.insert(options, {
			icon        = modelOption.icon or "fa-solid fa-eye",
			name        = modelOption.label,
			label       = modelOption.label,
			event       = modelOption.event,
			action      = modelOption.action,
			onSelect    = modelOption.action,
			data        = modelOption.data,
			canInteract = modelOption.canInteract,
			distance    = 2.0,
		})
	end
	if Config.Target == 'qb' then
		return exports['qb-target']:AddTargetEntity(model, { options = options, distance = 3.5 })
	elseif Config.Target == 'ox' then
		return exports.ox_target:addLocalEntity(model, options)
	end
	return false
end

--- Add a target model to the map
--- @param name string the name of the target
--- @param coords vector3 the coordinates of the sphere
--- @param data table the data for the target
--- @return false | number - false if the target was not added, or the target id
function AddTargSphere(name, coords, data)
	local options = {}
	for _, modelOption in pairs(data) do
		table.insert(options, {
			icon        = modelOption.icon or "fa-solid fa-eye",
			label       = modelOption.label,
			event       = modelOption.event,
			action      = modelOption.action,
			onSelect    = modelOption.action,
			data        = modelOption.data,
			canInteract = modelOption.canInteract,
			distance    = 2.0,
		})
	end
	if Config.Target == 'qb' then
		return exports['qb-target']:AddCircleZone(name, coords, 2.0, { options = options, distance = 3.5 })
	elseif Config.Target == 'ox' then
		return exports.ox_target:addSphereZone({
			name = name,
			coords = coords,
			options = options
		})
	end
	return false
end

--- Remove a target sphere from the map
--- @param entity number the entity to remove
--- @param data table the data for the target
function RemoveTargModel(entity, data)
	local options = {}
	for _, modelOption in pairs(data) do
		table.insert(options, modelOption.label)
	end
	if Config.Target == 'qb' then
		return exports['qb-target']:RemoveTargetEntity(entity, options)
	elseif Config.Target == 'ox' then
		return exports.ox_target:removeLocalEntity(entity, options)
	end
	return false
end

--- Remove a target sphere from the map
--- @param name string the name of the target
function RemoveTargSphere(name)
	if Config.Target == 'qb' then
		return exports['qb-target']:RemoveZone(name)
	elseif Config.Target == 'ox' then
		return exports.ox_target:removeZone(name)
	end
	return false
end

--- Spawn a prop in the world
--- @param entity number the entity to spawn
--- @param heading number the heading to set the entity to
--- @param ops table the options for the entity
--- @return nil
function PropsSpawn(entity, heading, ops)
	SetEntityHeading(entity, heading)
	FreezeEntityPosition(entity, true)
	SetEntityInvincible(entity, true)
	AddTargModel(entity, ops)
end

--- Get the image for an item
--- @param img string the item to get the image for
--- @return string - the image url for the item
function GetImage(img)
	if GetResourceState('ox_inventory') == 'started' then
		local allItems = exports['ox_inventory']:Items()
		if not allItems[img] then
			print(Format(L.devError.no_item, img, 'ox'))
			return 'Missing Image'
		end
		local clientData = allItems[img].client
		if clientData and clientData.image then
			return clientData.image
		else
			return "nui://ox_inventory/web/images/" .. img .. '.png'
		end
	end
	local inventoryPrefixes = {
		['ps-inventory']     = "nui://ps-inventory/html/images/",
		['lj-inventory']     = "nui://lj-inventory/html/images/",
		['qb-inventory']     = "nui://qb-inventory/html/images/",
		['qs-inventory']     = "nui://qs-inventory/html/images/",
		['origen_inventory'] = "nui://origen_inventory/html/img/",
		['core_inventory']   = "nui://core_inventory/html/img/"
	}
	for invName, invPath in pairs(inventoryPrefixes) do
		if not QBCore.Shared.Items[img] then
			print(Format(L.devError.no_item, img, 'QB'))
			return 'Missing Name'
		end
		if GetResourceState(invName) == 'started' then
			return invPath .. QBCore.Shared.Items[img].image
		end
	end
	return ''
end

--- Get the label for an item
--- @param label string the item to get the label for
--- @return string - the label for the item
function GetLabel(label)
	if GetResourceState('ox_inventory') == 'started' then
		local allItems = exports['ox_inventory']:Items()
		if not allItems[label] then
			print(Format(L.devError.no_item, label, 'ox'))
			return 'Missing Name'
		end
		return allItems[label].label
	else
		if QBCore.Shared.Items[label] == nil then
			print(Format(L.devError.no_item, label, 'ox'))
			return 'Missing Name'
		end
		return QBCore.Shared.Items[label].label
	end
end

--- Check if the player has a specific job
--- @param job string the job to check for
--- @return boolean - true if the player has the job, false otherwise
function HasJob(job)
	return getJobName() == job
end

--- Open the boss menu for a job
--- @param job string the job to open the boss menu for
--- @return nil
function OpenBossMenu(job)
	if Config.Framework == 'qb' then
		TriggerEvent('qb-bossmenu:client:OpenMenu')
	elseif Config.Framework == 'qbx' then
		exports.qbx_management:OpenBossMenu('job')
	elseif Config.Framework == 'esx' then
		TriggerEvent('esx_society:openBossMenu', job, function(data, menu) end)
	end
end

--- Make a crafter for a job
--- @param items table the items to craft
--- @param text string the text to display in the menu
--- @param job string the job to craft for
--- @param num number the number of the crafter
--- @return nil
function MakeCrafter(items, text, job, num)
	if getJobName() ~= job then
		Notify(Format(L.Error.no_job, job), 'error')
		return
	end
	local options = {}
	local recipes = lib.callback.await('md-jobs:server:getRecipes', false, job, items)
	if not recipes then
		Notify('Something Went Wrong, Tell Your Dev To Check Crafters For ' .. job, 'error')
		return
	end
	for recipeKey, recipe in pairs(recipes) do
		recipe.time      = recipe.time or 5000
		recipe.progtext  = recipe.progtext or 'Crafting '
		local outputItem = next(recipe.take) or ''
		local costLabels = {}
		for giveItem, giveQty in pairs(recipe.give) do
			table.insert(
				costLabels,
				hasItem(giveItem, giveQty)
				.. GetLabel(giveItem)
				.. ' X ' .. giveQty
			)
		end
		table.insert(options, {
			icon        = GetImage(outputItem),
			description = table.concat(costLabels, ", \n"),
			title       = GetLabel(outputItem),
			disabled    = hasEnough(recipe.give),
			onSelect    = function()
				if Config.MultiCraft then
					local maxCraft = lib.callback.await(
						'md-jobs:server:getCraftingMax',
						false, job, items, outputItem, recipeKey
					)
					if not maxCraft then
						Notify('Something Went Wrong, Tell Your Dev To Check Crafters For ' .. job, 'error')
						return
					end
					local amountDialog = lib.inputDialog(L.Menus.craft.am, {
						---@diagnostic disable-next-line: missing-fields
						{
							type        = 'number',
							description = L.Menus.craft.description,
							text        = 'Amount',
							default     = 1,
							min         = 1,
							max         = maxCraft
						}
					})
					if not amountDialog or not amountDialog[1] then return end
					local remaining = amountDialog[1]
					local stopped   = false
					repeat
						if not progressbar(
								Format(L.Progressbars.Crafting, recipe.progtext, GetLabel(outputItem)),
								recipe.time,
								recipe.anim
							) then
							stopped = true
							return
						end

						local canContinue = lib.callback.await(
							'md-jobs:server:canCraft',
							false, job, items, recipeKey, num
						)
						remaining = remaining - 1
					until remaining == 0 or not canContinue or stopped
				else
					if not progressbar(
							Format(L.Progressbars.Crafting, recipe.progtext, GetLabel(outputItem)),
							recipe.time,
							recipe.anim
						) then
						return
					end
					lib.callback.await('md-jobs:server:canCraft', false, job, items, recipeKey, num)
				end
			end
		})
	end
	Sort(options, 'title')
	openMenu('Crafters', text, options)
end

--- Make a store for a job
--- @param store string the store to make
--- @param job string the job to make the store for
--- @param text string the text to display in the menu
--- @param num number the number of the store
--- @return nil
function MakeStore(store, job, text, num)
	local menuOptions = {}
	local shopItems = lib.callback.await('md-jobs:server:getShops', false, job, store)
	if not shopItems then
		Notify('Something Went Wrong, Tell Your Dev To Check Stores For ' .. job, 'error')
		return
	end
	if type(shopItems) == 'string' then
		exports.ox_inventory:openInventory('shop', { type = shopItems, id = num })
		return
	end
	if getJobName() ~= job then
		Notify(Format(L.Error.no_job, job), 'error')
		return
	end
	if Config.UseShops then
		return
	end

	for _, itemInfo in pairs(shopItems) do
		table.insert(menuOptions, {
			icon        = GetImage(itemInfo.name),
			title       = GetLabel(itemInfo.name),
			description = L.cur .. itemInfo.price,
			onSelect    = function()
				local quantityInput = lib.inputDialog(L.Menus.store.am, {
					---@diagnostic disable-next-line: missing-fields
					{
						type = 'number',
						description = L.Menus.store.description,
						text = 'Amount',
						default = 1,
						min = 0,
						max = 50
					}
				})
				if not quantityInput or not quantityInput[1] then
					return
				end
				local purchaseSuccess = lib.callback.await(
					'md-jobs:server:purchaseShops',
					false,
					job,
					store,
					itemInfo.name,
					quantityInput[1],
					num
				)
				if not purchaseSuccess then
					Notify(L.Error.too_poor, 'error')
				end
			end
		})
	end
	Sort(menuOptions, 'title')
	openMenu('Stores', text, menuOptions)
end

--- Open a tray for a job
--- @param name string the name of the tray
--- @param weight number the weight of the tray
--- @param slot number the number of slots in the tray
--- @param num number the number of the tray
--- @param job string the job to open the tray for
--- @return nil
function OpenTray(name, weight, slot, num, job)
	if Config.Inv == 'ox' then
		exports.ox_inventory:openInventory('stash', { id = name })
	elseif Config.Inv == 'oldqb' then
		Wait(100)
		TriggerEvent(invcall .. ":client:SetCurrentStash", name)
		TriggerServerEvent(invcall .. ":server:OpenInventory", "stash", name, { maxweight = weight, slots = slot })
	elseif Config.Inv == 'outdated' then
		local stashOptions = { maxweight = weight, slots = slot }
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "Stash_" .. name, stashOptions)
		TriggerEvent("inventory:client:SetCurrentStash", "Stash_" .. name)
	elseif Config.Inv == 'qb' then
		TriggerServerEvent('md-jobs:server:openTray', name, weight, slot, num, job)
	end
end

--- Open a stash for a job
--- @param name string the name of the stash
--- @param weight number the weight of the stash
--- @param slot number the number of slots in the stash
--- @param num number the number of the stash
--- @param job string the job to open the stash for
--- @return nil
function OpenStash(name, weight, slot, num, job)
	if getJobName() ~= job then
		Notify(Format(L.Error.no_job, job), 'error')
		return
	end
	if Config.Inv == 'ox' then
		exports.ox_inventory:openInventory('stash', { id = name })
	elseif Config.Inv == 'oldqb' then
		Wait(100)
		TriggerEvent(invcall .. ":client:SetCurrentStash", name)
		TriggerServerEvent(invcall .. ":server:OpenInventory", "stash", name, { maxweight = weight, slots = slot })
	elseif Config.Inv == 'outdated' then
		local stashOptions = { maxweight = weight, slots = slot }
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "Stash_" .. name, stashOptions)
		TriggerEvent("inventory:client:SetCurrentStash", "Stash_" .. name)
	elseif Config.Inv == 'qb' then
		TriggerServerEvent('md-jobs:server:openStash', name, weight, slot, num, job)
	end
end

--- Manage closed shops for a job
--- @param job string the job to manage closed shops for
--- @param num number the number of items?
--- @return nil
function ManageClosed(job, num)
	lib.registerContext({
		id      = 'closedShops',
		title   = job .. ' Shop',
		options = {
			{
				title       = L.Menus.addItem,
				description = L.Menus.aIdes,
				onSelect    = function()
					lib.callback.await('md-jobs:server:addItemsToClosed', false, job, num)
				end
			},
			{
				title       = L.Menus.removeItems,
				description = L.Menus.rIdes,
				onSelect    = function()
					lib.callback.await('md-jobs:server:removeItemsFromClosed', false, job, num)
				end,
				disabled    = not IsBoss()
			},
		}
	})
	lib.showContext('closedShops')
end

--- Adjust prices for a job
--- @param job string the job to adjust prices for
--- @param num number the new price to adjust to
--- @return nil
function AdjustPrices(job, num)
	lib.callback.await('md-jobs:server:adjustPrices', false, job, num)
end

--- Purchase from a closed shop
--- @param job string the job to open closed shops for
--- @param num number the number of items
--- @return nil
function OpenClosedShop(job, num)
	local closedList = lib.callback.await('md-jobs:server:getClosedShops', false, job, num)
	local menuOptions = {}
	if #closedList == 0 then
		Notify(L.closed.no_item, 'error')
		return
	end
	for _, shopItem in pairs(closedList) do
		table.insert(menuOptions, {
			icon        = GetImage(shopItem.name),
			title       = Format(L.closed.des, GetLabel(shopItem.name), shopItem.price),
			description = Format(L.closed.stock, shopItem.amount),
			onSelect    = function()
				local dialogResult = lib.inputDialog(L.Menus.closed.amount, {
					---@diagnostic disable-next-line: missing-fields
					{
						type = 'number',
						description = L.Menus.closed.description,
						text = 'Amount',
						default = 1,
						min = 0,
						max = 50
					},
					---@diagnostic disable-next-line: missing-fields
					{
						type = 'select',
						description = 'How Would You Like To Pay?',
						options = {
							{ label = 'Cash', value = 'cash' },
							{ label = 'Bank', value = 'bank' }
						}
					}
				})
				if not dialogResult or not dialogResult[1] or not dialogResult[2] then
					return
				end
				local purchaseSuccess = lib.callback.await(
					'md-jobs:server:purchaseClosedShops',
					false,
					job,
					shopItem.name,
					dialogResult[1],
					num,
					dialogResult[2]
				)
				if not purchaseSuccess then
					Notify(L.Error.too_poor, 'error')
				end
			end
		})
	end
	local jobLabel = job
	if Config.Framework == 'qbx' then
		jobLabel = QBOX:GetJob(job).label
	end
	lib.registerContext({
		id      = 'closedShops',
		title   = Format(L.Menus.closed.shop, jobLabel),
		options = menuOptions
	})
	lib.showContext('closedShops')
end

--- Manage catering for a job
--- @param job string the job to manage catering for
--- @return nil
function ManageCatering(job)
	if getJobName() ~= job then
		Notify(Format(L.Error.no_job, job), 'error')
		return
	end
	local jobLabel = job
	if Config.Framework == 'qbx' then
		jobLabel = QBOX:GetJob(job).label
	end
	lib.registerContext({
		id      = 'catering',
		title   = Format(L.cater.manage.title, jobLabel),
		options = {
			{
				title = L.cater.manage.start,
				description = L.cater.manage.start_desc,
				onSelect = function()
					startCatering(job)
				end
			},
			{
				title = L.cater.manage.check,
				description = L.cater.manage.check_desc,
				onSelect = function()
					checkCatering(job)
				end
			},
			{
				title = L.cater.manage.deliver,
				description = L.cater.manage.deliver_desc,
				onSelect = function()
					deliverCatering(job)
				end
			},
			{
				title = L.cater.manage.cancel,
				description = L.cater.manage.cancel_desc,
				onSelect = function()
					cancelCatering(job)
				end
			},
			{
				title = L.cater.manage.add,
				description = L.cater.manage.add_desc,
				onSelect = function()
					addToCatering(job)
				end
			},
			{
				title       = L.cater.manage.history,
				description = L.cater.manage.history_desc,
				disabled    = not IsBoss(),
				onSelect    = function() checkHistory(job) end
			},
		}
	})
	lib.showContext('catering')
end

--- Check if a job can be opened
--- @param job string the job to check
--- @return boolean - true if the job can be opened, false otherwise
function CanOpenClosed(job)
	if Config.ClosedShopAlwaysActive then
		return true
	elseif not GlobalState.MDJobsCount then
		return false
	else
		return GlobalState.MDJobsCount[job] <= Config.ClosedShopCount
	end
end

--- Toggle the player's duty status
--- @return nil
function ToggleDuty()
	if Config.Framework == 'qb' then
		TriggerServerEvent('QBCore:ToggleDuty')
	elseif Config.Framework == 'qbx' then
		TriggerServerEvent("QBCore:ToggleDuty")
	elseif Config.Framework == 'esx' then
		print('someone PR This for esx duty idk esx much and im lazy')
	end
end

--- Check if the player is a boss
--- @return boolean - true if the player is a boss, false otherwise
function IsBoss()
	if Config.Framework == 'qb' then
		return QBCore.Functions.GetPlayerData().job.isboss
	elseif Config.Framework == 'qbx' then
		return QBX.PlayerData.job.isboss
	elseif Config.Framework == 'esx' then
		return ESX.PlayerData.job.grade_name == 'boss'
	end
	return false
end

----------------------------
---- Callback Functions ----
----------------------------

lib.callback.register('md-jobs:client:addItemsToClosed', function(data)
	local add = lib.inputDialog(L.Menus.addItem, data)
	return add
end)

lib.callback.register('md-jobs:client:removeItemsFromClosed', function(data)
	local remove = lib.inputDialog(L.Menus.removeItems, data)
	return remove
end)

lib.callback.register('md-jobs:client:adjustPrices', function(data)
	local adjust = lib.inputDialog(L.Menus.adjustPrices, data)
	return adjust
end)

lib.callback.register('md-jobs:client:chargePerson', function(peeps)
	if peeps[1] == nil then
		Notify(L.Error.no_near, 'error')
		return
	end
	local bills = lib.inputDialog(L.Menus.billing.title, {
		---@diagnostic disable-next-line: missing-fields
		{
			type = 'select',
			description = L.Menus.billing.who,
			options = peeps
		},
		---@diagnostic disable-next-line: missing-fields
		{
			type = 'number',
			description = L.Menus.billing.description,
			text = L.Menus.billing.amount,
			default = 1,
			min = 0,
			max = 100000
		}
	})
	if not bills then return end
	return { amount = bills[2], cid = bills[1] }
end)

lib.callback.register('md-jobs:client:acceptCharge', function(amount)
	local accept = lib.inputDialog(L.Menus.acceptBill.title, {
		---@diagnostic disable-next-line: missing-fields
		{
			type = 'select',
			description = L.Menus.acceptBill.cashor,
			options = {
				{
					label = L.Menus.acceptBill.card,
					value = 'bank'
				},
				{
					label = L.Menus.acceptBill.cash,
					value = 'cash'
				}
			}
		},
		---@diagnostic disable-next-line: missing-fields
		{
			type = 'select',
			description = Format(L.Menus.acceptBill.description, amount),
			options = {
				{
					label = L.Menus.acceptBill.accept,
					---@diagnostic disable-next-line: assign-type-mismatch
					value = true
				},
				{
					label = L.Menus.acceptBill.decline,
					---@diagnostic disable-next-line: assign-type-mismatch
					value = false
				}
			}
		}
	})
	if not accept then return false end
	if not accept[2] then return false end
	return { accept = accept[2], type = accept[1] }
end)

lib.callback.register('md-jobs:client:consume', function(item, data)
	if not data.label then data.label = 'Consuming ' end
	if not data.time then data.time = 5000 end
	if not data.anim then data.anim = 'uncuff' end
	if not progressbar(data.label .. ' ' .. GetLabel(item), data.time, data.anim) then return false end
	return true
end)

lib.callback.register('md-jobs:client:setVehicleLivery', function(netId, livery)
	if netId and livery and NetworkDoesEntityExistWithNetworkId(netId) then
		local vehicle = NetToVeh(netId)
		if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
			SetVehicleLivery(vehicle, livery)
			return true
		end
	end
	return false
end)
