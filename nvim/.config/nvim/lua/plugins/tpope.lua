return {
	-- tpope plugins
	{
		"tpope/vim-sleuth", -- Automatic tabstop and shiftwidth detection
		event = { "BufReadPost", "BufNewFile" },
	},

	{
		"tpope/vim-vinegar", -- Native Ex gets extensions
		event = "VimEnter",
	},
}
