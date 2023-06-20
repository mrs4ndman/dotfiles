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
	-- HACK: Maybe move this to ../mrsandman/keymaps.lua
	prompt_title = "Which color?",
	layout_strategy = "vertical",
	layout_config = {
		height = 20,
		width = 0.3,
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
		"nord",
		"nordic",
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
