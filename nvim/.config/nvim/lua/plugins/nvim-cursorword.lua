Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-cursorword"

return {
  "xiyaowong/" .. plugin,
  enabled = Is_Enabled("nvim-cursorword"),
  lazy = false,
  cmd = {
    "CursorWordToggle",
    "CursorWordDisable",
    "CursorWordEnable",
  },
}
