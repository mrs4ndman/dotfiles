Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-cokeline"

return {
  "willothy/" .. plugin, -- Addicted to this stuff
  enabled = Is_Enabled(plugin),
  event = "VimEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
}
