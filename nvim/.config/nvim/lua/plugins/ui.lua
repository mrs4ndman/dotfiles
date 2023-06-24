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
        opts = {
            signs = {
                add = {
                    hl = "DiffAdd",
                    text = "+",
                    numhl = "GitSignsAddNr",
                },
                change = {
                    hl = "DiffChange",
                    text = "",
                    numhl = "GitSignsChangeNr",
                },
                delete = {
                    hl = "DiffDelete",
                    text = "_",
                    show_count = true,
                    numhl = "GitSignsDeleteNr",
                },
                topdelete = {
                    hl = "DiffDelete",
                    text = "‾",
                    show_count = true,
                    numhl = "GitSignsDeleteNr",
                },
                changedelete = {
                    hl = "DiffChange",
                    text = "~",
                    show_count = true,
                    numhl = "GitSignsChangeNr",
                },
            },
            count_chars = {
                [1] = "",
                [2] = "₂",
                [3] = "₃",
                [4] = "₄",
                [5] = "₅",
                [6] = "₆",
                [7] = "₇",
                [8] = "₈",
                [9] = "₉",
                ["+"] = "",
            },
            numhl = true,
            attach_to_untracked = true,
        },
    },

    -- Overlength, and CSS color show
    {
        "lcheylus/overlength.nvim",
        event = "VimEnter",
        -- keys = {"<leader>lt", "<cmd>OverlengthToggle<CR>" }
        opts = {

            enabled = true,

            ctermdb = 'darkred',
            bg = '#8B0000',

            textwidth_mode = 2,

            default_overlenght = 80,
            highlight_to_eol = true,
            grace_length = 3,

            disable_ft = { 'qf', 'help', 'man', 'packer', 'Telescope' },
        },
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
        opts = {
            ignore = { },
            sign = {
                enabled = true,
                priority = 10,
            },
            -- status_text = {
            --     enabled = true,
            --     text = "󰛨",
            --     text_unavailable = ""
            -- },
            autocmd = {
                enabled = true,
            }
        },
    },
    {
        "stevearc/dressing.nvim",
        opts = {},
    },
    { "rcarriga/nvim-notify" },
}
