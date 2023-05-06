local telescope = require 'telescope'
local builtin = require('telescope.builtin')
local telescope_builtin = require 'telescope.builtin'
local telescope_actions = require 'telescope.actions'

-- Keymaps

vim.keymap.set('n', '<leader>tt', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
vim.keymap.set('n', '<leader>tr', ':Telescope repo list<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>th', builtin.oldfiles )


-- Main setup

telescope.setup {
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
        repo = {
            list = {
                fd_opts = {
                    "--no-ignore-vcs",
                },
                search_dirs = {
                    "~/Gitchub",
                    "~/git-clone-zone",
                },
            },
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
        sorting_strategy = 'ascending',
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
        prompt_prefix = '   ',
        hl_result_eol = false,
        results_title = "",
        winblend = 10,
        wrap_results = true
    },
    mappings = {
        i = {
            ["<C-n>"] = require('telescope.actions').cycle_history_next,
            ["<C-p>"] = require('telescope.actions').cycle_history_prev,
            ["<C-c>"] = require('telescope.actions').close,
            ["<C-q>"] = require('telescope.actions').send_to_qflist,
            ["<C-i>"] = require('telescope.actions').select_horizontal,
            ["<C-x>"] = require('telescope.actions').select_vertical,
        },
        n = {
            ["<C-n>"] = require('telescope.actions').cycle_history_next,
            ["<C-p>"] = require('telescope.actions').cycle_history_prev,
            ["<C-c>"] = require('telescope.actions').close,
            ["<C-q>"] = require('telescope.actions').send_to_qflist,
            ["<C-i>"] = require('telescope.actions').select_horizontal,
            ["<C-x>"] = require('telescope.actions').select_vertical,
        },
    }
}



-- Extension invoking:

require('telescope').load_extension "fzf"
require('telescope').load_extension "repo"
require('telescope').load_extension "notify"

