Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-web-devicons"

return {
  "nvim-tree/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = false,
}
