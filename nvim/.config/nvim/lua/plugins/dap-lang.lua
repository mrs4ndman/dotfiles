return {
	-- Language / debugging plugins

	-- Rust babyyyy
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		ft = "rust",
	},
	{
		"saecki/crates.nvim",
		ft = "rust",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	},

	-- Java?
	{ "mfussenegger/nvim-jdtls", lazy = true, ft = "java" },

	-- Golang poweeeer
	{ "fatih/vim-go", lazy = true, ft = { "go", "gomod", "gosum" } },

	-- Typescript
	{
		"jose-elias-alvarez/typescript.nvim",
		ft = "typescript",
	},

	-- {
	--     "pmizio/typescript-tools.nvim",
	--     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	--     opts = {},
	-- }

	-- Python?
	{
		"mfussenegger/nvim-dap-python",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		ft = "python",
		keys = {
			{
				"<leader>dPt",
				function()
					require("dap-python").test_method()
				end,
				desc = "Debug test method",
			},
			{
				"<leader>dPc",
				function()
					require("dap-python").test_class()
				end,
				desc = "Debug test class",
			},
		},
		config = function()
			local path = require("mason-registry").get_package("debugpy"):get_install_path()
			require("dap-python").setup(path .. "/venv/bin/python")
		end,
	},

	-- Debugging
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"folke/which-key.nvim",
				optional = true,
				opts = {
					defaults = { ["<leader>d"] = { name = "+debug" }, ["<leader>da"] = { name = "+adapters" } },
				},
			},
			{ "rcarriga/nvim-dap-ui" },
			{ "nvim-telescope/telescope-dap.nvim" },
			{ "theHamsta/nvim-dap-virtual-text" },
			-- DAP adapters
			{ "jbyuki/one-small-step-for-vimkind", module = "osv" },
			{ "leoluz/nvim-dap-go", module = "dap-go", ft = "go" },
		},
		config = function(plugin, opts)
			vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
			require("nvim-dap-virtual-text").setup({
				commented = true,
			})

			local dap, dapui = require("dap"), require("dapui")
			dapui.setup({})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				"DAP Toggle",
			},
			{
				"<leader>db",
				function()
					require("dap").toggle_breakpoint()
				end,
				"DAP Toggle Breakpoint",
				{ silent = true },
			},
			{
				"<leader>dc",
				function()
					require("dap").continue()
				end,
				"DAP Continue",
			},
			{
				"<leader>dC",
				function()
					require("dap").run_to_cursor()
				end,
				"DAP Run To Cursor",
			},
			{
				"<leader>dg",
				function()
					require("dap").goto_()
				end,
				"DAP Go to line (no execute)",
			},
			{
				"<leader>di",
				function()
					require("dap").step_into()
				end,
				"Step Into",
			},
			{
				"<leader>dj",
				function()
					require("dap").down()
				end,
				"DAP Down",
			},
			{
				"<leader>dk",
				function()
					require("dap").up()
				end,
				"DAP Up",
			},
			{
				"<leader>dl",
				function()
					require("dap").run_last()
				end,
				"DAP Run Last",
			},
			{
				"<leader>do",
				function()
					require("dap").step_out()
				end,
				"DAP Step-Out",
			},
			{
				"<leader>dO",
				function()
					require("dap").step_over()
				end,
				"DAP Step-Over",
			},
			{
				"<leader>dp",
				function()
					require("dap").pause()
				end,
				"DAP Pause",
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.toggle()
				end,
				"DAP Toggle REPL",
			},
			{
				"<leader>ds",
				function()
					require("dap").session()
				end,
				"DAP Session",
			},
			{
				"<leader>dt",
				function()
					require("dap").terminate()
				end,
				"DAP Terminate",
			},
			{
				"<leader>dw",
				function()
					require("dap.ui.widgets").hover()
				end,
				"DAP Widgets",
			},
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = "williamboman/mason.nvim",
		cmd = { "DapInstall", "DapUninstall" },
		opts = {
			automatic_installation = false,
			handlers = {},
			ensure_installed = {
				-- DAP
				"bash-debug-adapter",
				-- 'codelldb',
				"debugpy",
				"delve",
				"go-debug-adapter",
				"java-debug-adapter",
				"js-debug-adapter",
				"php-debug-adapter",
			},
		},
	},
}
