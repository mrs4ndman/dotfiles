Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "headlines.nvim"

return {
  "lukas-reineke/" .. plugin,
  dependencies = "nvim-treesitter/nvim-treesitter",
  ft = "markdown",
  opts = {},
}
