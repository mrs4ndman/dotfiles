require('rose-pine').setup({
	variant = 'main',
	dark_variant = 'main',
	bold_vert_split= true,
	disable_background = true,
	disable_float_background = false,
})

require('tokyonight').setup({
	style = "night",
	light_style = "day",
	transparent = false,
	styles = {
		-- Style to be applied to different syntax groups
		-- Value is any valid attr-list value for `:help nvim_set_hl`
		comments = { italic = true },
		keywords = { italic = true },
		functions = {},
		variables = {},
		-- Background styles. Can be "dark", "transparent" or "normal"
		sidebars = "dark", -- style for sidebars, see below
		floats = "dark", -- sts
	},
	hide_inactive_statusline = false,
	dim_inactive = true,
	lualine_bold = false,
})

require('catppuccin').setup({
	flavour = "mocha",
	background = {
		light = "latte",
		dark = "mocha",
	},
	transparent_background = false,
	show_end_of_buffer = false,
	dim_inactive = {
		enabled = false,
		shade = "dark",
		percentage = 0.2,
	},
	integrations = {
		aerial = true,
		alpha = true,
		cmp = true,
		-- dap = {
		-- 	enabled = true,
		-- 	enable_ui = true,
		-- },
		fidget = true,
		gitsigns = true,
		harpoon = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		mason = true,
		nvimtree = true,
		telescope = true,
		treesitter_context = true,
		treesitter = true,
		lsp_trouble = true,
		which_key = true,
	}
})

require('nightfox').setup({
	options = {
		transparent = false,
		dim_inactive = true,
		module_default = true,
	}
})

require('onedarkpro').setup({
	plugins = {
		all = true,
	},
	options = {
		highlight_inactive_windows = true,
		transparency = false,
	},
})

require('dracula').setup({
  show_end_of_buffer = false,
  transparent_bg = false,
  italic_comment = true,
})

require('onenord').setup({
	theme = "dark",
	borders = true,
	fade_nc = false,
	disable = {
		cursorline = true,
		eob_lines = true,
	},
})

vim.g.nord_contrast = true
vim.g.nord_borders = true
vim.g.nord_disable_background = false
vim.g.nord_uniform_diff_background = true
vim.g.nord_bold = true

vim.g.neon_style = "doom"
vim.g.neon_italic_comment = true
vim.g.neon_bold = true
vim.g.neon_transparent = false

vim.keymap.set("n", '<leader>th', ":lua colorizer()<CR>", { silent = true } )

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
