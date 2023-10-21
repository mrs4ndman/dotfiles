Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "auto-session"

return {
  "rmagatti/" .. plugin,
  event = "VimEnter",
  keys = {
    { "<leader>sd", "<cmd>SessionDelete<CR>",  desc = "Delete current session" },
    { "<leader>sr", "<cmd>SessionRestore<CR>", desc = "Restore session for CWD" },
    { "<leader>ss", "<cmd>SessionSave<CR>",    desc = "Save current session" },
  },
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
    session_lens = {
      load_on_setup = false,
    }
  }
}
