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
      ["<leader>"] = "Space"
    },
    icons = {
      group = "",
    },
    window = {
      border = "shadow",
      margin = { 1, 1, 1, 1 },
      padding = { 1, 1, 1, 1 },
    },
    layout = {
      spacing = 2,
      align = "center",
    }
  }
}
