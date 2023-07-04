Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "mason-null-ls.nvim"

return {
	"jay-babu/" .. plugin,
	enabled = Is_Enabled(plugin),
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
	},
	config = function()
		require("custom.null-ls")
	end,
	opts = function(_, opts)
		if Use_Defaults(plugin) then
			opts = opts
		else
			opts = {
				ensure_installed = {
					-- Formatters
					"cbfmt",
					"eslint",
					"luaformatter",
					"prettierd",
					"rustfmt",
					"shfmt",
					"stylua",
					-- Linters
					"ansible-lint",
					"flake8",
					"shellcheck",
					-- Python
					"black",
					"mypy",
					"pyright",
					"ruff",
				},
				automatic_installation = true,
			}
		end
	end,
}
