-- Mr Sandman's .lua config for NVIM lazy.lua

vim.g.mapleader = " "

require("lazy").setup({
	spec = {
		{ import = "plugins" },
		-- { import = "plugins.notify" },
	},
	defaults = { lazy = true },
	checker = {
		enabled = true,
	},
	performance = {
		cache = {
			enabled = true,
		},
		rtp = {
			disabled_plugins = {
				"man",
				"gzip",
				"tarPlugin",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
