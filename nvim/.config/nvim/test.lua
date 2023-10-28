-- local function test()
--   if require("lazy.status").has_updates() ~= true then
--     return ""
--   end
--   -- print(formatterName)
-- end
-- test()
--
-- -- local myTable = { "h", "e", "l", "l", "o" }
-- -- local combinedString = table.concat(myTable)
-- -- print(combinedString) -- Outputs hello
-- local formatterSource = require("conform").list_formatters_for_buffer(0)
-- local formatterName = string.format("%%#StatuslineWhite# %s", table.concat(formatterSource))
-- print(formatterName)
-- -- vim.o.statusline = 'Start ' .. vim.fn.expand('%') ..  " %#Statusline#%= Pepe"
-- -- vim.o.statusline = 'Start ' .. vim.fn.expand('%:~') ..  " %#Statusline#%= < TIME"

-- ---@return string
-- local current_path = function()
--   return tostring(vim.fn.expand("%:p"))
-- end
-- ---@return string
-- local current_time = function()
--   return string.sub(tostring(os.date()), 18)
-- end
-- local encoding = function()
--   if vim.opt.fileencoding:get() == nil then
--     return "[ No encoding ]"
--   end
--   return vim.opt.fileencoding:get()
-- end
-- Statusline_render = function()
--   return table.concat({
--     "⚡[",
--     current_path(),
--     "]",
--     " %#Statusline#%=",
--     "[",
--     current_time(),
--     encoding(),
--     "]",
--   })
-- end
--
-- vim.opt.statusline = "%{%v:lua.Statusline_render()%}"

-- while true do
--   vim.cmd.redraw()
-- end



vim.api.nvim_set_hl(0, "StatuslineLightning", { fg = "#F0FF00" })


-- PATH
local function current_path()
    return tostring(vim.fn.expand("%:p"))
end

-- TIME
local function current_time()
    -- x = tostring(os.date():sub(12))
    local x = string.sub(tostring(os.date()), 12, 16)
    return x
end

local function file_type()
    return "%y"
end

-- ENCODING -> UTF-8 etc.
local function encoding()
    local fileencoding = vim.opt.fileencoding:get()
    if fileencoding == nil then
    -- if fileencoding == "nil" then
        fileencoding = ""
    end
    -- return fileencoding ~= "" and string.format("%s", encoding) or ""
    return tostring(fileencoding)
end


-- CREATING THE STRING
function Statusline_render()
    return table.concat({
        "%#StatuslineLightning#󱐋",
        "%## [",
        current_path(),
        -- timer,
        "]",
        " %#Statusline#%=",
        file_type(),
        "[",
        encoding(),
        "]",
        "[",
        current_time(),
        "]",
    })
end

-- FEEDING IT TO VIM'S STATUSLINE
-- vim.opt.statusline = "%v:lua.Statusline_render()"
-- vim.opt.statusline = "%{%v:lua.Statusline_render()%}"
vim.opt.statusline = "%!v:lua.Statusline_render()"
