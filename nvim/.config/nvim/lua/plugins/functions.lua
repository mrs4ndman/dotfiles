
return {
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        keys = {
            -- Rename identifiers with LSP
            vim.keymap.set("n", "<leader>fr", ":IncRename ", { desc = "Rename function under cursor" })
        },
        config = function()
            require("inc_rename").setup()
        end,
    },

    {
        "stevearc/aerial.nvim",
        cmd = "AerialToggle",
        opts = {
            backends = { "treesitter", "lsp", "markdown", "man" },

            layout = {
                max_width = { 40, 0.2 },
                width = nil,
                min_width = 10,

                default_direction = "prefer_right",
                preserve_equality = false,
                placement = "window",
            },
            attach_mode = "window",
            close_automatic_events = { "unsupported", "unfocus" },
            lazy_load = true,
            disable_max_lines = 20000,
            filter_kind = {
                "Class",
                "Constructor",
                "Enum",
                "Function",
                "Interface",
                "Module",
                "Method",
                "Struct",
            },
            highlight_closest = true,
            highlight_on_hover = true,
            autojump = true,
            ignore = {
                unlisted_buffers = true,
                buftypes = "special",
                wintypes = "special",
            },
            nerd_font = "auto",
            open_automatic = false,
            post_jump_cmd = "normal! zz",

            lsp = {
                diagnostics_trigger_update = true,
                update_when_errors = true,
                update_delay = 300,
            },
            treesitter = {
                update_delay = 200,
            },
            markdown = {
                update_delay = 400,
            },
            man = {
                update_delay = 500,
    },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },
}
