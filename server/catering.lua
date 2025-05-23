local cateringHours = 1 -- how long the catering order is valid for in hours
local cateringDetails = {
    firstname = { 'john', 'jane', 'jim', 'jill', 'jack', 'jessie', 'jacob', 'jennifer', 'jason', 'julie', 'mike', 'michelle', 'matt', 'mary', 'mark', 'maria', 'megan', 'mason', 'melissa', 'max', 'molly', 'miles', 'mitch' },
    lastname  = { 'smith', 'johnson', 'williams', 'jones', 'brown', 'davis', 'miller', 'wilson', 'moore', 'taylor', 'anderson', 'thomas', 'jackson', 'white', 'harris', 'martin', 'thompson', 'garcia', 'martinez', 'robinson', 'clark', 'rodriguez', 'lewis', 'lee', 'walker', 'hall', 'allen', 'young', 'hernandez', 'king', 'wright', 'lopez', 'hill', 'scott', 'green', 'adams', 'baker', 'gonzalez', 'nelson', 'carter', 'mitchell', 'perez', 'roberts', 'turner', 'phillips', 'campbell', 'parker', 'evans', 'edwards', 'collins', 'stewart', 'sanchez', 'morris', 'rogers', 'reed' },
    locations = {
        { loc = vector4(321.72, -559.07, 28.74, 28.78),    label = 'Pillbox Hospital',            model = 's_m_m_doctor_01' },
        { loc = vector4(-4.93, -1107.83, 29.0, 161.55),    label = 'Ammunation',                  model = 's_m_y_ammucity_01' },
        { loc = vector4(-1083.0, -248.0, 37.76, 0.0),      label = 'Weazel News',                 model = 'cs_priest' },
        { loc = vector4(433.9, -977.89, 30.71, 75.57),     label = 'Police Station',              model = 'cs_priest' },
        { loc = vector4(236.56, -409.57, 47.92, 337.28),   label = 'Courthouse',                  model = 's_m_m_janitor' },
        { loc = vector4(-1681.28, -290.94, 51.88, 231.5),  label = 'Sister Deloris Gospel Choir', model = 'cs_priest' },
        { loc = vector4(217.99, -1647.05, 29.79, 320.57),  label = 'Fire Department',             model = 's_m_y_fireman_01' },
        { loc = vector4(897.7, -174.69, 73.81, 236.47),    label = 'Taxi Depot',                  model = 's_m_m_janitor' },
        { loc = vector4(559.23, 2741.34, 42.2, 186.05),    label = 'Animal Shop',                 model = 's_m_m_janitor' },
        { loc = vector4(1216.86, 2727.55, 38.0, 177.02),   label = 'Larrys Auto Sales',           model = 'csb_cletus' },
        { loc = vector4(-1043.68, 4918.7, 208.32, 277.83), label = 'Children Of The Son',         model = 'a_m_y_acult_01' },
        { loc = vector4(1696.03, 4783.06, 42.0, 100.48),   label = 'Arcade',                      model = 's_m_y_clown_01' },
        { loc = vector4(-50.08, 6361.62, 31.51, 223.2),    label = 'Feed And Supplies',           model = 'a_m_m_salton_02' },
    }
}

-- this helps allow some jobs to have catering while others do not
local cater = {}
for jobName, jobConfig in pairs(Jobs) do
    if jobConfig.CateringEnabled then
        cater[jobName] = jobConfig.catering
    else
        cater[jobName] = false
    end
end
GlobalState.Cater = cater

-------------------------
---- Local Functions ----
-------------------------

--- Generate random catering details
--- @return table - the catering details
local function generateDetail()
    local firstName   = cateringDetails.firstname[math.random(#cateringDetails.firstname)]
    local lastName    = cateringDetails.lastname[math.random(#cateringDetails.lastname)]
    local locationSet = cateringDetails.locations[math.random(#cateringDetails.locations)]
    local dueTime     = (os.time() + 3600) * cateringHours
    return {
        firstname = firstName,
        lastname  = lastName,
        location  = locationSet,
        dueby     = dueTime
    }
end

--- Get the weight of an item
--- @param item string the item name
--- @return number - the weight of the item
local function getWeight(item)
    if Config.Inv == 'ox' then
        local inventoryItems = exports.ox_inventory:Items()
        if inventoryItems[item] then
            return inventoryItems[item].weight
        end
    elseif Config.Inv == 'qb' then
        if QBCore.Shared.Items[item] then
            return QBCore.Shared.Items[item].weight
        end
    end
    return 0
end

--- Handle money distribution for catering
--- @param src number the player source
--- @param price number the total price
--- @param employeeList table list of employees (cid/name)
local function handleMoney(src, price, employeeList)
    local commissionRate  = Jobs[GetJobName(src)].catering.commission or 0
    local commissionTotal = math.floor(price * commissionRate)
    local commissionPer   = math.floor(commissionTotal / #employeeList)
    local netRevenue      = math.floor(price - commissionTotal)

    for _, employee in pairs(employeeList) do
        local empSrc = GetSource(employee.cid)
        AddMoney(empSrc, commissionPer)
    end
    Log('Catering Order Commission paid: ' .. GetJobName(src) .. ' Name:' .. GetName(src), 'catering')
    AddJobMoney(GetJobName(src), netRevenue)
end

--- Generate a new catering order
--- @param src number the player source
--- @param job string the job name
--- @return boolean - success?
local function generateCatering(src, job)
    local existingOrders = MySQL.query.await(
        'SELECT * FROM mdjobs_catering WHERE job = ?', { job }
    )
    if existingOrders[1] then
        Notifys(src, L.cater.already, 'error')
        return false
    end
    local employees     = { { name = GetName(src), cid = GetCid(src) } }
    local itemsToCreate = math.random(1, 5)
    local orderItems    = {}
    local orderTotals   = { price = 0, amount = 0 }
    local details       = generateDetail()
    local currentWeight = 0
    repeat
        Wait(100)
        local itemConfig = Jobs[job].catering.items[math.random(#Jobs[job].catering.items)]
        local quantity   = math.random(1, itemConfig.maxAmount)
        currentWeight    = currentWeight + getWeight(itemConfig.name) * quantity

        if currentWeight > Config.MaxCateringWeight then
            itemsToCreate = 0
        end
        if itemsToCreate == 0 then break end
        local itemPrice = math.random(itemConfig.minPrice, itemConfig.maxPrice) * quantity
        local merged    = false
        for _, entry in ipairs(orderItems) do
            if entry.item == itemConfig.name then
                entry.amount = entry.amount + quantity
                entry.price  = entry.price + itemPrice
                merged       = true
                break
            end
        end
        if not merged then
            table.insert(orderItems, {
                item   = itemConfig.name,
                amount = quantity,
                price  = itemPrice
            })
        end
        orderTotals.amount = orderTotals.amount + quantity
        orderTotals.price  = orderTotals.price + itemPrice
        itemsToCreate      = itemsToCreate - 1
    until itemsToCreate == 0
    MySQL.query.await(
        'INSERT INTO mdjobs_catering (data, job, time, totals, details, employees) VALUES (?, ?, ?, ?, ?, ?)',
        {
            json.encode(orderItems),
            job,
            os.time(),
            json.encode(orderTotals),
            json.encode(details),
            json.encode(employees)
        }
    )
    Log('Catering Order Created: ' .. job .. ' Name:' .. GetName(src), 'catering')
    return true
end

----------------------------
---- Callback Functions ----
----------------------------

lib.callback.register('md-jobs:server:startCatering', function(source, job)
    local currentJob = GetJobName(source)
    if currentJob ~= job then
        return false
    end
    return generateCatering(source, job)
end)

lib.callback.register('md-jobs:server:checkCatering', function(source, job)
    local currentJob = GetJobName(source)
    if currentJob ~= job then
        return false
    end

    local result = MySQL.query.await(
        'SELECT * FROM mdjobs_catering WHERE job = ?', { job }
    )
    if not result then
        return
    end
    Log('Catering Order Checked: ' .. job .. ' Name:' .. GetName(source), 'catering')
    return result[1], os.time()
end)

lib.callback.register('md-jobs:server:getCateringInfo', function(source, job)
    if GetJobName(source) ~= job then
        return
    end
    local result = MySQL.query.await(
        'SELECT * FROM mdjobs_catering WHERE job = ?', { job }
    )
    if not result[1] then
        return
    end
    Log('Catering Order Checked: ' .. job .. ' Name:' .. GetName(source), 'catering')
    return result[1], os.time()
end)

lib.callback.register('md-jobs:server:addtoCatering', function(source, job)
    if GetJobName(source) ~= job then
        return
    end
    local dbResult = MySQL.query.await(
        'SELECT * FROM mdjobs_catering WHERE job = ?', { job }
    )
    if not dbResult[1] then
        Notifys(source, L.cater.no_cater, 'error')
        return false
    end
    local existingEmployees = json.decode(dbResult[1].employees)
    local newEmployeeList   = {}
    local alreadyOnOrder    = false
    for _, emp in ipairs(existingEmployees) do
        if emp.cid == GetCid(source) then
            alreadyOnOrder = true
            break
        end
    end
    if alreadyOnOrder then
        Notifys(source, L.cater.already_on, 'error')
        return false
    end
    for _, emp in ipairs(existingEmployees) do
        table.insert(newEmployeeList, { cid = emp.cid, name = emp.name })
    end
    table.insert(newEmployeeList, { cid = GetCid(source), name = GetName(source) })
    MySQL.query(
        'UPDATE mdjobs_catering SET employees = ? WHERE job = ?',
        { json.encode(newEmployeeList), job }
    )
    Log('Catering Order Added Employee: ' .. job .. ' Name:' .. GetName(source), 'catering')
    return true
end)

lib.callback.register('md-jobs:server:getCateringHistory', function(source, job)
    if GetJobName(source) ~= job then
        return
    end
    local history = MySQL.query.await(
        'SELECT * FROM mdjobs_completed_catering WHERE job = ?', { job }
    )
    if not history[1] then
        return
    end
    Log('Catering Order History Checked: ' .. job .. ' Name:' .. GetName(source), 'catering')
    return history
end)

lib.callback.register('md-jobs:server:cateringVan', function(source, job)
    if GetJobName(source) ~= job then
        return
    end
    local vanConfig = Jobs[job].catering.Van[job]
    local vanEntity = CreateVehicle(
        vanConfig.model,
        vanConfig.loc.x,
        vanConfig.loc.y,
        vanConfig.loc.z,
        vanConfig.loc.w,
        true,
        true
    )
    SetVehicleNumberPlateText(vanEntity, vanConfig.plate)
    SetEntityHeading(vanEntity, vanConfig.loc.w)
    if vanConfig.livery and type(vanConfig.livery) == "number" then
        local netId = NetworkGetNetworkIdFromEntity(vanEntity)
        local success = lib.callback.await('md-jobs:client:setVehicleLivery', -1, netId, vanConfig.livery)
        if not success then
            print('[ERR] Failed to set livery for catering van')
        end
    end
    Log('Catering Order Van Made: ' .. job .. ' Name:' .. GetName(source), 'catering')
    return Jobs[job].catering.Van
end)

lib.callback.register('md-jobs:server:stopCatering', function(source, job)
    if GetJobName(source) ~= job then
        return
    end
    MySQL.query('DELETE FROM mdjobs_catering WHERE job = ?', { job })
    Log('Catering Order Deleted: ' .. job .. ' Name:' .. GetName(source), 'catering')
    return true
end)

lib.callback.register('md-jobs:server:deliverCatering', function(source, job)
    if GetJobName(source) ~= job then
        return
    end
    local currentOrder = MySQL.query.await('SELECT * FROM mdjobs_catering WHERE job = ?', { job })
    if not currentOrder[1] then
        return
    end
    local totalsData             = json.decode(currentOrder[1].totals)
    local employeeList           = json.decode(currentOrder[1].employees)
    local orderItems             = json.decode(currentOrder[1].data)
    local details                = json.decode(currentOrder[1].details)
    local neededCount, haveCount = 0, 0
    for _, itemEntry in pairs(orderItems) do
        if HasItem(source, itemEntry.item, itemEntry.amount) then
            haveCount = haveCount + 1
        end
        neededCount = neededCount + 1
    end
    if neededCount ~= haveCount then
        Notifys(source, L.cater.dontHave, 'error')
        return false
    end
    for _, itemEntry in pairs(orderItems) do
        RemoveItem(source, itemEntry.item, itemEntry.amount)
    end
    handleMoney(source, totalsData.price, employeeList)
    MySQL.query('DELETE FROM mdjobs_catering WHERE job = ?', { job })
    local customerRecord = {
        name  = details.firstname .. ' ' .. details.lastname,
        label = details.location.label
    }
    MySQL.query.await(
        'INSERT INTO mdjobs_completed_catering (job, receipt, employees, totals, customer) VALUES (?, ?, ?, ?, ?)',
        {
            job,
            json.encode(orderItems),
            currentOrder[1].employees,
            json.encode(totalsData),
            json.encode(customerRecord)
        }
    )
    Notifys(source, 'You Have Delivered The Catering Order!', 'success')
    Log('Catering Order Delivered: ' .. job .. ' Name:' .. GetName(source), 'catering')
    return true
end)
