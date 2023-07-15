Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "windows.nvim"

return {
  "anuvyklack/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  config = function()
    vim.o.winwidth = 40
    vim.o.winminwidth = 20
    vim.o.equalalways = false
    require("windows").setup()
    vim.keymap.set("n", "<C-w>m", "<Cmd>WindowsMaximize<CR>")
    vim.keymap.set("n", "<C-w>_", "<Cmd>WindowsMaximizeVertically<CR>")
    vim.keymap.set("n", "<C-w>|", "<Cmd>WindowsMaximizeHorizontally<CR>")
    vim.keymap.set("n", "<C-w>e", "<Cmd>WindowsEqualize<CR>")
  end,
}
