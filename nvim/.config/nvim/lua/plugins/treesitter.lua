return {
    -- 4.- Treesitter modules

    {
        "nvim-treesitter/nvim-treesitter", -- parsing to the end of time
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        -- event = "BufReadPre",
        -- TODO: Join treesitter binds
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        lazy = true,
    },

    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPre",
        enabled = true,
        opts = { mode = 'cursor' },
    },

    {
        "Wansmer/treesj",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },
}
