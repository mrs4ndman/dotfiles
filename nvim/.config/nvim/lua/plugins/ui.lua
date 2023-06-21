return {
    -- 7.- UI customization
    --
    -- Status / buffer lines
    {
        "nvim-lualine/lualine.nvim", -- Best statusline for nvim in Lua
        event = "VeryLazy",
    },

    ({
        "willothy/nvim-cokeline", -- Addicted to this stuff
        event = "VeryLazy",
        dependencies = 'nvim-tree/nvim-web-devicons',
    }),

    -- Git signs on the gutter
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPost", "BufNewFile" },
    },

    -- Overlength, and CSS color show
    {
        "lcheylus/overlength.nvim",
        keys = { "n", "<leader>lt", "<cmd>OverlengthToggle<CR>" }
    },

    -- "ap/vim-css-color", -- Frontend stuff
    -- TODO: Find a substitute for this plugin

    -- Indenting visual marks
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
    },

    -- Highlighting instances of words with LSP, Treesitter and Regex matching
    {
        "RRethy/vim-illuminate",
        cmd = "IlluminateToggle",
    },

    -- Ideas for the brain
    {
        "kosayoda/nvim-lightbulb",
        event = "BufReadPre",
        dependencies = "antoinemadec/FixCursorHold.nvim",
    },

}
