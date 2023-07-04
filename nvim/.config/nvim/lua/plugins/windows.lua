return {
	"anuvyklack/windows.nvim",
	dependencies = {
		"anuvyklack/middleclass",
		"anuvyklack/animation.nvim",
	},
	config = function()
		vim.o.winwidth = 10
		vim.o.winminwidth = 10
		vim.o.equalalways = false
		require("windows").setup()
		vim.keymap.set("n", "<C-w>m", "<Cmd>WindowsMaximize<CR>")
		vim.keymap.set("n", "<C-w>_", "<Cmd>WindowsMaximizeVertically<CR>")
		vim.keymap.set("n", "<C-w>|", "<Cmd>WindowsMaximizeHorizontally<CR>")
		vim.keymap.set("n", "<C-w>e", "<Cmd>WindowsEqualize<CR>")
	end,
}
