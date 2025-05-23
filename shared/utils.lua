------------------------
---- Shared Globals ----
------------------------

--- Format a string with arguments
--- @param str string the string to format
--- @param ... any the arguments to format the string with
--- @return string - the formatted string
function Format(str, ...)
    local args = {...}
    return string.format(str, table.unpack(args))
end

--- Sort a table in-place by a key
--- @param tbl table the table to sort
--- @param key string the key to sort by
--- @return nil
function Sort(tbl, key)
    table.sort(tbl, function(a, b)
        return a[key] < b[key]
    end)
end