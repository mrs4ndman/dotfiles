Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-lspconfig"

return {
  "neovim/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "folke/neodev.nvim",
    "jubnzv/virtual-types.nvim",
    "folke/lsp-colors.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    require("custom.lsp")
  end
}
