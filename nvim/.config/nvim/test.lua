local function test()
  if require("lazy.status").has_updates() ~= true then
    return ""
  end
  -- print(formatterName)
end
test()

-- local myTable = { "h", "e", "l", "l", "o" }
-- local combinedString = table.concat(myTable)
-- print(combinedString) -- Outputs hello
local formatterSource = require("conform").list_formatters_for_buffer(0)
local formatterName = string.format("%%#StatuslineWhite# %s", table.concat(formatterSource))
print(formatterName)
