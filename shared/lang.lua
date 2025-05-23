L = {} -- dont fuck with the %s if you forget one or add one without reflecting the code that calls it, it will error and break
L.cur = '$'

L.devError = {
    no_item = 'There is No %s in your %s Items.lua',

}

L.Error = {
    no_item = 'You Need %s !',
    no_job = 'You Need To Be A %s To Do This',
    no_near = 'There Is No One Near You To Bill',
    need_item_count = 'You Need %s Of %s To Do This!',
    cant_carry = 'You Are Carrying To Much!',
    too_poor = 'You Are To Poor To Afford This! Go Get A Job Hippie!'
}

L.Menus = {
    craft = {
        am = 'Amount To Craft',
        description = 'How Many Do You Want?'
    },
    store = {
        am = 'Amount To Buy',
        description = 'How Many Do You Want?'
    },
    billing = {
        title = 'Bill A Player',
        who = 'Who Do You Want To Bill?',
        description = 'How Much Do You Want To Bill Them?',
        amount = 'Amount',
    },
    acceptBill = {
        title = 'Accept Charge',
        description = 'You Are Being Charged ' .. L.cur .. '%s Do You Accept',
        cashor = 'Cash Or Card?',
        cash = 'Cash',
        card = 'Card',
        accept = 'Accept',
        decline = 'Decline',
    },
    closed = {
       amount = 'Amount To Buy',
       description = 'How Many Do You Want To Buy?',
       shop = '%s Shop'

    },
    addItem = 'Add Items',
    aIdes = 'Add Items To Shop',
    removeItems = 'Remove Items',
    rIdes = 'Remove Items From Shop',
}

L.Progressbars = {
    Crafting = '%s %s',
}

L.cater = {
    time = '%d hours, %d minutes, %d seconds',
    timeout = 'Your Catering Is Overdue, They Refuse To Pay',
    no_cater = 'There Is No Catering Order!',
    check = 'Customer Details:%s %s Customer Name: %s %s %s Location: %s %s Due By: %s %s Total Amount Of Products: %s %s Total Price:' .. L.cur ..'%s  %s  Itemized List: %s %s',
    cater_header = '%s Catering Order',
    manage = {
        title = '%s Catering Management',
        start = 'Start Catering Order',
        start_desc = 'View Order For Catering',
        started = 'You Have Recieved A Catering Order!',
        check = 'Check Catering Order',
        check_desc = 'Check The Details For Catering Order',
        deliver = 'Deliver Catering Order',
        deliver_desc = 'Deliver The Catering Order To The Customer',
        too_late = 'You Are Too Late To Deliver The Catering Order',
        delivered = 'You Delivered The Order, Return The Company Vehicle',
        complete = 'You Have Completed The Catering Order',
        van = 'The Company Vehicle Is Outside! Go To The Marked Location',
        cancel = 'Cancel Catering Order',
        cancel_desc = 'Cancel The Catering Order',
        cancelled = 'You Have Cancelled The Catering Order',
        add = 'Add Yourself To The Catering Order',
        add_desc = 'Add Yourself To The Catering Order',
        added = 'You Have Added Yourself To The Catering Order',
        history = 'View Catering History',
        history_desc = 'View The History Of Catering Orders',
        history_none = 'No History',
        history_none_desc = 'You Have No Catering History. Complete A Catering Order To Get History',
        hd = 'Customer Name: %s Total: ' .. L.cur .. '%s',
        hd_desc = 'Customer Details: %s %s Customer Name: %s %s Location: %s %s Total Amount Of Products: %s %s Total Price: ' .. L.cur .. '%s  %s %s Itemized List: %s %s %s Employees On Order: %s',
    },
    commission = 'You Have Recieved A Commission Of ' .. L.cur .. '%s For Delivering The Catering Order',
    already = 'Your Job Already Has A Catering Order',
    already_on = 'You Are Already On This Catering Order',
    dontHave = 'You Dont Have All The Correct Items!'
}

L.closed = {
    no_item = 'There Is Nothing For Sale In The Shop',
    des = '%s | ' .. L.cur .. '%s',
    stock = 'Stock: %s',
    not_enough_stock = 'There Is Not Enough Stock In The Shop',
    bought = 'You Have Bought %s Of %s For ' .. L.cur .. '%s',
}

L.T = { -- targets
    beer = 'Grab Beer',
    coffee = 'Grab Coffee',
    fryer = 'Use Fryer',
    grill = 'Use Grill',
    cuttingboard = 'Use Cutting Board',
    hotplate = 'Use Hot Plate',
    ice = 'Grab Ice',
    sink = 'Use Sink',
    fridge = 'Open Fridge',
    ingridients = 'Open Store',
    till = 'Use Till',
    managecat = 'Manage Catering',
    tray = 'Open Tray',
    stash = 'Open Stash',
    shop = 'Open Shop',
    manage = 'Manage Shop',
    cocktail = 'Make Cocktail',
    boss = 'Boss Menu',
}

L.billing = {
    billed = 'You Have Billed ' .. L.cur .. '%s To %s',
    paid = 'You Were Billed ' .. L.cur .. '%s By %s',
    too_poor = '%s Is Too Poor, What A Loser',
}
Icons  = {
    beer = 'fas fa-beer',
    coffee = 'fas fa-coffee',
    fryer = 'fas fa-fish',
    grill = 'fas fa-utensils',
    cuttingboard = 'fas fa-utensils',
    hotplate = 'fas fa-utensils',
    ice = 'fas fa-ice-cream',
    sink = 'fas fa-faucet',
    fridge = 'fas fa-utensils',
    ingridients = 'fas fa-utensils',
    till = 'fas fa-cash-register',
    tray = 'fas fa-utensils',
    stash = 'fas fa-utensils',
    cocktail = 'fas fa-utensils',
    shop = 'fas fa-cash-register',
}
