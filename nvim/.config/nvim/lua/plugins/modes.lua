Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "modes.nvim"

return {
  "mvllow/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufNewFile", "BufReadPost" },
  opts = {
    colors = {
      visual = '#FF8800',
      insert = '#00CCCC',
    },
    line_opacity = 0.18,
    set_cursor = false,
    set_cursorline = true,
    set_number = true,
    ignore_filetypes = { "netrw", "alpha", "lazy", "quickfix", "help" }
  }
}
