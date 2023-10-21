Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  "mrs4ndman/theme-selector.nvim",
  cmd = { "Themer" },
  dev = true,
  enabled = false,
  config = true,
  opts = {
    colorschemes = {
      "catppuccin",
      "tokyonight",
      "fluoromachine",
    }
  }
}
