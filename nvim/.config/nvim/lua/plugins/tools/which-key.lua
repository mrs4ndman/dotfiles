Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "which-key.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  opts = {
    key_labels = {
      ["<leader>"] = "Space",
      ["ñ"] = "Meta"
    },
    icons = {
      group = "",
    },
    window = {
      border = "single",
      margin = { 0, 4, 1, 1 },
      padding = { 0, 4, 2, 1 },
    },
    layout = {
      spacing = 2,
      align = "center",
    }
  }
}
