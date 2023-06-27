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
        "williamboman/mason.nvim",
    },
    -- {
    --     "j-hui/fidget.nvim",
    --     tag = "legacy",
    --     opts = {},
    --     event = { "BufReadPost", "BufNewFile" },
    -- },
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- }
}
