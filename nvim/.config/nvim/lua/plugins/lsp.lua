-- ThePrimeagen's lsp config, to be expanded. All credits go to him and his setup :)
-- Startup:
return {

    -- {
    --     "VonHeikemen/lsp-zero.nvim",
    --     branch = 'v2.x',
    --     lazy = true,
    --     dependencies = {
    --         {
    --             "neovim/nvim-lspconfig",
    --             -- opts = {
    --             --     inlay_hints = { enabled = true },
    --             -- },
    --         },
    --         {
    --             "williamboman/mason.nvim",
    --             build = function() pcall(vim.cmd, 'MasonUpdate') end,
    --             config = true,
    --             event = "VimEnter",
    --         },
    --         "williamboman/mason-lspconfig.nvim",

    --         "hrsh7th/nvim-cmp",
    --         "L3MON4D3/LuaSnip",
    --         "saadparwaiz1/cmp_luasnip",

    --         "hrsh7th/nvim-cmp",
    --         "hrsh7th/cmp-nvim-lsp",
    --         "hrsh7th/cmp-nvim-lua",
    --         "hrsh7th/cmp-path",
    --         "hrsh7th/cmp-buffer",
    --         -- "hrsh7th/cmp-cmdline",

    --         "rafamadriz/friendly-snippets",
    --         "simrat39/inlay-hints.nvim",
    --     },
    -- },
    {
        "neovim/nvim-lspconfig",
        -- opts = {
        --     inlay_hints = { enabled = true },
        -- },
    },
    "nvim-lua/plenary.nvim",
    "simrat39/inlay-hints.nvim",
    {
        "williamboman/mason.nvim",
        build = function() pcall(vim.cmd, 'MasonUpdate') end,
        event = "VimEnter",
    },
    "williamboman/mason-lspconfig.nvim",
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        opts = {},
        event = { "BufReadPost", "BufNewFile" },
    },

    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        lazy = true,
    },

    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "jose-elias-alvarez/null-ls.nvim",
        },
        config = function()
            require("custom.null-ls") -- require your null-ls config here (example below)
        end,
    },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-buffer",

    "hrsh7th/cmp-vsnip",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",


    {
        "folke/neodev.nvim",
        event = "VimEnter",
    },
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- }
}

