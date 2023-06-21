-- ThePrimeagen's lsp config, to be expanded. All credits go to him and his setup :)
-- Startup:
return {

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v2.x',
        lazy = true,
        dependencies = {
            "neovim/nvim-lspconfig",
            {
                "williamboman/mason.nvim",
                build = function() pcall(vim.cmd, 'MasonUpdate') end,
                config = true,
                event = "VimEnter",
            },

            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",

            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            -- "hrsh7th/cmp-cmdline",

            "rafamadriz/friendly-snippets",
            "simrat39/inlay-hints.nvim",
        },
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        opts = {},
        event = { "BufReadPost", "BufNewFile" },
    },

    {
        "folke/neodev.nvim",
        event = "VimEnter",
    },

}

