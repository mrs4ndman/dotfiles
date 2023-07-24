Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "duck.nvim"

return {
  "tamton-aquib/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>da", desc = "Hatch amogus"},
    { "<leader>dc", desc = "Hatch cat"},
    { "<leader>dk", desc = "Cook pet"},
  },
  config = function()
    vim.keymap.set('n', '<leader>da', function() require("duck").hatch("ඞ", 7) end, {})
    vim.keymap.set('n', '<leader>dc', function() require("duck").hatch("🐈", 2) end, {})
    vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
  end
}
