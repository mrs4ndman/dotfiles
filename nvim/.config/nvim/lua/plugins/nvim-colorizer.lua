return {
	"NvChad/nvim-colorizer.lua",
	keys = { "<leader>cl", "<cmd>ColorizerToggle<CR>", desc = "Color picker toggle" },
	config = function()
		require("colorizer").setup({
			user_default_options = {
				RRGGBBAA = true,
			},
		})
	end,
}
