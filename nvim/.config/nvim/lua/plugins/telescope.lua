return {
    -- 1.- Telescope config

    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        cmd = "Telescope",
        branch = '0.1.x', -- good ole telescope
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        },
        config = function()
            require("telescope").setup {
                pickers = {
                    colorscheme = {
                        enable_preview = true,
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                },
                defaults = {
                    preview = {
                        timeout = 500,
                    },
                    vimgrep_arguments = {
                        "rg",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                        "--hidden",
                    },
                    sort_mru = true,
                    sorting_strategy = "ascending",
                    color_devicons = true,
                    layout_config = {
                        prompt_position = 'top',
                        horizontal = {
                            width_padding = 0.04,
                            height_padding = 0.1,
                            preview_width = 0.6,
                        },
                        vertical = {
                            width_padding = 0.05,
                            height_padding = 1,
                            preview_height = 0.5,
                        },
                    },
                    border = true,
                    prompt_prefix = "   ",
                    hl_result_eol = false,
                    results_title = "",
                    winblend = 20,
                    wrap_results = true,
                    file_ignore_patterns = {},
                    hidden = true,
                    mappings = {
                        i = {
                            ["<C-n>"] = require("telescope.actions").cycle_history_next,
                            ["<C-p>"] = require("telescope.actions").cycle_history_prev,
                            ["<C-c>"] = require("telescope.actions").close,
                            ["<C-q>"] = require("telescope.actions").send_to_qflist,
                            ["<C-i>"] = require("telescope.actions").select_horizontal,
                            ["<C-x>"] = require("telescope.actions").select_vertical,
                            ["<C-u>"] = false,
                            ["<C-d>"] = false,
                        },
                        n = {
                            ["<C-n>"] = require("telescope.actions").cycle_history_next,
                            ["<C-p>"] = require("telescope.actions").cycle_history_prev,
                            ["<C-c>"] = require("telescope.actions").close,
                            ["<C-q>"] = require("telescope.actions").send_to_qflist,
                            ["<C-i>"] = require("telescope.actions").select_horizontal,
                            ["<C-x>"] = require("telescope.actions").select_vertical,
                        },
                    },
                }
            }
        end,
    },

    -- 2.- Load Telescope native extensions,

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        event = "VeryLazy",
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        event = "VeryLazy",
    },

    "nvim-telescope/telescope-ui-select.nvim",
}

