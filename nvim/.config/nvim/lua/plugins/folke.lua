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
        cmd = { "TroubleToggle", "Trouble" },
        opts = { use_diagnostic_signs = true },
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },

    {
        "folke/todo-comments.nvim",
        event = "BufReadPost",
        cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix"  },
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "folke/twilight.nvim",
        event = "VimEnter",
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
    {
        "folke/noice.nvim",
        event = "UIEnter",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            presets = {
                bottom_search = true,
                command_palette = true,
                long_message_to_split = true,
                inc_rename = true,
                lsp_doc_border = false,
            },
            routes = {
                view = "notify",
                filter = { event = "msg_showmode" },
            }
        }
    },

}
