local wk = require("which-key")

-- LEADER plugin keybinds (Space for this config)

wk.register({
	-- which-key category entries
	["<leader>b"] = { name = "[B]uffers" },
	["<leader>c"] = { name = "Close + TS Context" },
	["<leader>d"] = { name = "DAP (+ CodeLLDB when active)" },
	["<leader>f"] = { name = "LSP Format TS Rename Function FML" },
	["<leader>g"] = { name = "Fu[G]itive" },
	["<leader>i"] = { name = "[I]ndent[L]ine, Word-repetition" },
	["<leader>k"] = { name = "Harpoon switching+" },
	["<leader>l"] = { name = "over[L]eng[T]h, Lazy" },
	["<leader>n"] = { name = "[N]eo[C]lip" },
	["<leader>q"] = { name = "Close" },
	["<leader>s"] = { name = "Cokeline+, Sessions, Alpha" },
	["<leader>t"] = { name = "Telescope TS Aerial Harpoon ToDo" },
	["<leader>ta"] = { name = "Aerial" },
	-- ["<leader>tc"] = { name = "[T]o-do [C]omments+"},
	-- ["<leader>tt"] = { name = "[T]reesi[T]ter [P]layground"},
	-- ["<leader>u"] = { name = "[U]ndo-Tree" },
	["<leader>v"] = { name = "HBAC, LSP, " },
	["<leader>x"] = { name = "Trouble+" },
	["<leader>z"] = { name = "[Z]en-Mode / Twilight" },

	-- Custom lua functions: their which-key entries
	["<leader>th"] = { "<cmd>Themer<CR>", "Colorschme manager", { silent = true } },

	-- All the plugin keybinds are either with the plugin definition or in the corresponding
	-- custom/file.lua
	-- Notification dismiss
	["<leader>Cn"] = {
		function()
			require("notify").dismiss({ silent = true, pending = true })
		end,
		"Dismiss all Notifications",
	},

	-- Indent-line toggle
	["<leader>il"] = { "<cmd>IndentBlanklineToggle<CR>", "Indent-line toggle" },

	-- Alpha dashboard
	["<leader>sp"] = { "<cmd>Alpha<CR>", "Toggle Start Screen", { silent = true } },

	-- AUTO-SESSION
	["<leader>sd"] = { "<cmd>SessionDelete<CR>", "Delete current session", { silent = true } },
	["<leader>sr"] = { "<cmd>SessionRestore<CR>", "Restore session for CWD", { silent = true } },
	["<leader>ss"] = { "<cmd>SessionSave<CR>", "Save current session", { silent = true } },

	-- RNVIMR / ranger toggle
	["<leader>R"] = { "<cmd>RnvimrToggle<CR>", "Ranger", { silent = true, noremap = true } },

	-- GENGHIS
	["<leader>yp"] = { require("genghis").copyFilepath, "Yank current filepath" },
	["<leader>yn"] = { require("genghis").copyFilename, "Yank current filename" },
	-- ["<leader>cx"] = { require("genghis").chmodx, "Make current file executable" },
	["<leader>rf"] = { require("genghis").renameFile, "Rename current file" },
	["<leader>mf"] = { require("genghis").moveAndRenameFile, "Move and rename current filepath" },
	["<leader>nf"] = { require("genghis").createNewFile, "Create new file" },
	["<leader>yf"] = { require("genghis").duplicateFile, "Duplicate current file" },
	["<leader>Df"] = {
		function()
			require("genghis").trashFile({ trashLocation = "$HOME/.Trash" })
		end,
		"Trash current file",
	},

	-- TO-DO
	["<leader>td"] = { "<cmd>TodoQuickFix<CR>", "To-Do Toggle", { silent = true } },
	["<leader>tcp"] = { require("todo-comments").jump_prev, "To-Do next inline" },
	["<leader>tcd"] = { require("todo-comments").jump_next, "To-Do previous inline" },

	-- TWILIGHT
	["<leader>zt"] = { "<cmd>Twilight<CR>", "Twilight toggle" },

	-- AERIAL
	["<leader>tat"] = { "<cmd>AerialToggle!<CR>", "Toggle Aerial", { silent = true } },
	["<leader>tac"] = { "<cmd>AerialClose<CR>", "Close Aerial" },
	["<leader>tax"] = { "<cmd>AerialCloseAll<CR>", "Close all Aerial instances" },

	-- RENAMER
	["<leader>fr"] = {
		function()
			return ":IncRename " .. vim.fn.expand("<cword>")
		end,
		expr = true,
		"Rename function under cursor",
	},

	-- OVERLENGHT
	["<leader>lt"] = { "<cmd>OverlengthToggle<CR>", "Overlength Toggle", { silent = true } },

	-- TELESCOPE
	["<leader>tf"] = { require("telescope.builtin").find_files, "Find files", { silent = true } },
	["<leader>tg"] = { require("telescope.builtin").git_files, "Git files", { silent = true } },
	["<leader>tb"] = { require("telescope.builtin").buffers, "List buffers", { silent = true } },
	["<leader>tr"] = { require("telescope.builtin").oldfiles, "Recent files", { silent = true } },
	["<leader>tl"] = { require("telescope.builtin").loclist, "Proyect loclist", { silent = true } },
	["<leader>vh"] = { require("telescope.builtin").help_tags, "Help tags", { silent = true } },
	["<leader>ts"] = {
		function()
			require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
		end,
		"Grep through files",
		{ silent = true },
	},

	-- COKELINE
	["<leader>cn"] = { "<Plug>(cokeline-focus-next)", "Change to next buffer", { silent = true } },
	["<leader>cp"] = { "<Plug>(cokeline-focus-prev)", "Change to previous buffer", { silent = true } },
	["<leader>cc"] = { "<Plug>(cokeline-pick-close)", "Pick buffer to close", { silent = true } },
	["<leader>csn"] = { "<Plug>(cokeline-switch-next)", "Swap with next buffer", { silent = true } },
	["<leader>csp"] = { "<Plug>(cokeline-switch-prev)", "Swap with next buffer", { silent = true } },

	-- TREESITTER
	["<leader>ct"] = { "<cmd>TSContextToggle<CR>", "TS Context Toggle", { silent = true } },
	["<leader>ttp"] = { "<cmd>TSPlaygroundToggle<CR>", "TS Playground Toggle", { silent = true } },

	-- TREESJ
	["Q"] = { "<cmd>TSJToggle<CR>", "Toggle TS node", { silent = true } },
	-- GLOW
	["<leader>md"] = { "<cmd>Glow<CR>", "Toggle MD preview", { silent = true } },
})
