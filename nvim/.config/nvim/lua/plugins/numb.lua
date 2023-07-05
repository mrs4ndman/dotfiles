Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "numb.nvim"

return {
  "nacro90/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "VimEnter",
  config = function()
    require("numb").setup()
  end
}
