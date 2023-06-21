return {
    -- folke plugins
    --
    -- Zen mode with Space + zz / zZ

    {
        "folke/zen-mode.nvim", -- Pure concentration
        event = "VeryLazy",
    },

    -- Trouble: Diagnostics and status tool:
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {},
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        opts = {
            search = {
                command = "rg",
                args = {
                    "--color=never",
                    "--no-heading",
                    "--hidden",
                    "--line-number",
                    "--column",
                },
            },
        },
    },

    {
        "folke/twilight.nvim",
        event = "VeryLazy",
        opts = {
            {
                alpha = 0.25,
                color = { "Normal", "#ffffff" },
                term_bg = "#000000",
                inactive = true,
            },
            context = 40,
            treesitter = true,
            expand = {
                "function",
                "method",
                "table",
                "if_statement",
            },
            exclude = { "alpha", "git" }
        },
    },

}
