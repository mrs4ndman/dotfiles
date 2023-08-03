Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "nvim-surround"

return {
  "kylechui/" .. plugin,
  event = { "BufReadPost", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  opts = {
    keymaps = {
      normal = "ys",
      delete = "ds",
      visual = "S",
      visual_line = "gS",
      change = "cs",
      change_line = "cS",
    }
  }
}
