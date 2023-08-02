Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "focus.nvim"

return {
  "nvim-focus/" .. plugin,
  version = false,
  enabled = Is_Enabled(plugin),
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    enable = true,
    commands = true,
    autoresize = {
      enable = true,
      height_quickfix = 20,
      minheight = 33,
    },
    ui = {
      signcolumn = true,
    }
  }
}
