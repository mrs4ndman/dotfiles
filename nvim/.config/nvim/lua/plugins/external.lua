
return {
    -- 5.- External integration: Git, tmux, ranger & fzf, also remembers where I was in the buffer

    "christoomey/vim-tmux-navigator", -- tmux integration

    "tmux-plugins/vim-tmux",          -- tmux integration x2

    {
        "junegunn/fzf", -- Fuzzy searching integration
        event = { "BufReadPost", "BufNewFile" },
    },

    {
        "AckslD/nvim-neoclip.lua", -- Bob likes to yank :)
        cmd = "Telescope neoclip",
        opts = {
            history = 2000,
            preview = true,
            on_select = {
                move_to_front = false,
                close_telescope = false,
            },
            on_paste = {
                move_to_front = false,
                close_telescope = true,
            },
            keys = {
                telescope = {
                    i = {
                        select = '<cr>',
                        paste = '<c-p',
                        paste_behind = '<c-b>',
                    },
                    n = {
                        select = '<cr>',
                        paste = 'p',
                        paste_behind = 'P',
                    },
                },
                fzf = {
                    select = 'default',
                    paste = 'ctrl-p',
                    paste_behind = 'ctrl-b'
                },
            },
        },
    },

    "kevinhwang91/rnvimr", -- Terminal file manager integration

    {
        "kevinhwang91/nvim-bqf", -- Better Quickfix list
        lazy = true,
    },

    "farmergreg/vim-lastplace",     -- Remembers where i left off the buffer

    {
        "max397574/better-escape.nvim", -- Better Esc keybindings
        opts = {
            mapping = {"zj", "zk", "<j", "<k"},
            timeout = 150,
            clear_empty_lines = true,
            keys = "<Esc>",
        },
    },

    {
        "axkirillov/hbac.nvim", -- Vacuuming up them buffers
        lazy = true,
        opts = {
            autoclose = false,
            threshold = 10,
            close_command = function(bufnr)
                vim.api.nvim_buf_delete(bufnr, {})
            end,
            close_buffers_with_windows = false,
        },
    },

    {
        "rmagatti/auto-session", -- Intelligent Neovim session manager
        event = "VimEnter",
        opts = {
            log_level = "error",
            auto_session_suppress_dirs = { "~/", "~/install", "~/Downloads" },
            auto_session_create_enabled = false,
            auto_restore_enabled = false,
            auto_save_enabled = true,
        },
    },
}
