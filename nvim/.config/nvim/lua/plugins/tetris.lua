Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-tetris"

return {
  "alec-gibson/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "Tetris",
  keys = {
    {"<leader>T", "<cmd>Tetris<CR>", desc = "Tetris" }
  },
}
