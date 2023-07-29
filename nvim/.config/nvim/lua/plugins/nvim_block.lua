Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "block.nvim"

return {
  "HampusHauffman/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    {
      "<leader>bt",
      mode = { "n", "v" },
      "<cmd>Block<CR>",
      desc = "Block view toggle",
    },
  },
  opts = { },
}
