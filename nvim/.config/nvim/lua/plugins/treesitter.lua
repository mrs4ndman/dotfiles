return {
    -- 4.- Treesitter modules

    {
        "nvim-treesitter/nvim-treesitter", -- parsing to the end of time
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })
        end,
        event = { "BufReadPost", "BufNewFile"},
        dependencies = {
            {
                "nvim-treesitter/nvim-treesitter-textobjects",
                init = function()
                    require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
                    load_textobjects = true
                end,
            },
        },
        cmd = { "TSUpdateSync" },
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
        cmd = "TSJToggle",
    },
}
