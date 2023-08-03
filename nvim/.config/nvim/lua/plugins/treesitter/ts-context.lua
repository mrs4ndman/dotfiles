Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-treesitter-context"

return {
  "nvim-treesitter/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "BufReadPre",
  opts = { mode = "cursor" },
}
