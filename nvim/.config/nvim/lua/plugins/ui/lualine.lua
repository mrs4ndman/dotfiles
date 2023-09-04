Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "lualine.nvim"

-- Best statusline for nvim in Lua
return {
  "nvim-lualine/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "UIEnter",
  config = function()
    require("custom.lualine")
  end
}
