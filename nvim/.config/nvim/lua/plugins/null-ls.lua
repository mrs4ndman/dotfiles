Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "null-ls.nvim"

return {
  "jose-elias-alvarez/" .. plugin,
  enabled = Is_Enabled(plugin),
  dependencies = {
    "nvim-lua/plenary.nvim",
    "williamboman/mason.nvim",
  },
  event = { "BufReadPre", "BufNewFile" },
}
