-- COLORS: Vim-like configs + COLORIZER

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

vim.g.neon_style = "doom"
vim.g.neon_italic_comment = true
vim.g.neon_bold = true
vim.g.neon_transparent = false

vim.g.material_style = "deep_ocean"

local theme = require('last-color').recall() or 'rose-pine'
vim.cmd(('colorscheme %s'):format(theme))

-- function ColorMyPencils(color)
-- 	color = color or "rose-pine" or "tokyonight" or "catppuccin"
-- 	vim.cmd.colorscheme(color)
-- 	require('rose-pine').setup({
-- 		disable_background = true
-- 	})

-- 	-- Config for transparency
-- 	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- end

-- vim.cmd('colorscheme rose-pine')
-- ColorMyPencils()


-- COLORIZER
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local sorters = require "telescope.sorters"

function enter(prompt_bufnr)
	local selected = action_state.get_selected_entry()
	-- print(vim.inspect(selected))
	local cmd = 'colorscheme ' .. selected[1]
	vim.cmd(cmd)
	actions.close(prompt_bufnr)
end

function next_color(prompt_bufnr)
	actions.move_selection_next(prompt_bufnr)
	local selected = action_state.get_selected_entry()
	local cmd = 'colorscheme ' .. selected[1]
	vim.cmd(cmd)
end

function prev_color(prompt_bufnr)
	actions.move_selection_previous(prompt_bufnr)
	local selected = action_state.get_selected_entry()
	local cmd = 'colorscheme ' .. selected[1]
	vim.cmd(cmd)
end

local opts = {
	-- TODO: Optimise the sorting and make it more responsive
	prompt_title = "Which color?",
	layout_strategy = "vertical",
	layout_config = {
		height = 0.45,
		width = 0.25,
		prompt_position = "top",
	},
	sorting_strategy = "ascending",
	finder = finders.new_table {
		"rose-pine",
		"catppuccin",
		"onedark_dark",
		"tokyonight",
		"carbonfox",
		"oxocarbon",
		"material",
		"vscode",
		"gruber-darker",
		"nord",
		"nordic",
		"fluoromachine",
		"dracula",
		"onenord",
		"nightfox",
		"nordfox",
		"neon",
		"tokyonight-moon"
	},
	sorter = sorters.get_generic_fuzzy_sorter({}),
	attach_mappings = function(prompt_bufnr, map)
		map("i", "<CR>", enter)
		map("i", "<C-k>", prev_color)
		map("i", "<C-j>", next_color)
		return true
	end,
}

local colors = pickers.new(opts)

function colorizer()
	colors:find()
end

