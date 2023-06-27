Customize = require("mrsandman.customize")
Is_Enabled = require("mrsandman.functions").is_enabled

local plugin = "nvim-cmp"

return {
        "hrsh7th/" .. plugin,
        event = "InsertEnter",
        enabled = Is_Enabled(plugin),
        opts = require("custom.cmp"),
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
}