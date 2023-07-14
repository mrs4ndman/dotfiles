Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-cursorword"

return {
  "xiyaowong/" .. plugin,
  lazy = false,
  cmd = {
    "CursorWordToggle",
    "CursorWordDisable",
    "CursorWordEnable",
  },
}
