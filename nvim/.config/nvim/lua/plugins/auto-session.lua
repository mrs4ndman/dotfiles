Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "auto-session"

return {
  "rmagatti/" .. plugin,
  event = "VimEnter",
  cmd = {
    "SessionRestore",
    "SessionSave",
    "SessionDelete",
  },
  enabled = Is_Enabled(plugin),
  opts = {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/install", "~/Downloads" },
    auto_session_create_enabled = false,
    auto_restore_enabled = false,
    auto_save_enabled = true,
  }
}
