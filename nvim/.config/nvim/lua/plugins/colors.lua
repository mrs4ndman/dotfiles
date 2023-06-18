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

function ColorMyPencils(color)
	color = color or "rose-pine" or "tokyonight" or "catppuccin"
	vim.cmd.colorscheme(color)
	require('rose-pine').setup({
		disable_background = true
	})

	-- Config for transparency
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- vim.cmd('colorscheme rose-pine')

ColorMyPencils()
