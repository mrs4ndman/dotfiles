Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "dmap.nvim"

return {
  "doums/" .. plugin,
  enabled = Is_Enabled(plugin),
  config = function()
    require("dmap").setup()
  end
}
