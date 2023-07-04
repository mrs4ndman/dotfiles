Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "telescope.nvim"
return {
	-- 1.- Telescope config

	{
		"nvim-telescope/" .. plugin,
		enabled = Is_Enabled(plugin),
		cmd = "Telescope",
		version = false,
		dependencies = {
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
		},
		opts = function(_, opts)
			if Use_Defaults(plugin) then
				opts = opts
			else
				opts.pickers = {
					colorscheme = {
						enable_preview = true,
					},
				}
				opts.defaults = {
					preview = { timeout = 500 },
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
						prompt_position = "top",
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
			end
		end,
	},
}
