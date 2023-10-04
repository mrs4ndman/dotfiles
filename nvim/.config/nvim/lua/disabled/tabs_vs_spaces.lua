Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "tabs-vs-spaces.nvim"

return {
  "tenxsoydev/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>ci", "<cmd>TabsVsSpacesToggle<CR>", desc = "Check indentation toggle" }
  },
  config = true
}
