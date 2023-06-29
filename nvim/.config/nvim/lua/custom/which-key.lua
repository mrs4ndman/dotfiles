-- Per-plugin which-key customization
local wk = require("which-key")
wk.register({
    -- Notification dismiss
    ["<leader>Cn"] = { function()
        require("notify").dismiss({ silent = true, pending = true })
    end, "Dismiss all Notifications" },

    -- Indent-line toggle
    ["<leader>il"] = { "<cmd>IndentBlanklineToggle<CR>", "Indent-line toggle" },

    -- Alpha dashboard
    ["<leader>sp"] = { "<cmd>Alpha<CR>", "Toggle Start Screen", { silent = true } },

    -- NEOCLIP
    ["<leader>nc"] = { "<cmd>Telescope neoclip<CR>", { desc = "Neoclip toggle", silent = true } },

    -- AUTO-SESSION
    ["<leader>sd"] = { "<cmd>SessionDelete<CR>", "Delete current session", { silent = true } },
    ["<leader>sr"] = { "<cmd>SessionRestore<CR>", "Restore session for CWD", { silent = true } },
    ["<leader>ss"] = { "<cmd>SessionSave<CR>", "Save current session", { silent = true } },

    -- RNVIMR / ranger toggle
    ["<leader>R"] = { "<cmd>RnvimrToggle<CR>", "Ranger", { silent = true, noremap = true }},

    -- GENGHIS
    ["<leader>yp"] = { require("genghis").copyFilepath, "Yank current filepath" },
    ["<leader>yn"] = { require("genghis").copyFilename, "Yank current filename" },
    -- ["<leader>cx"] = { require("genghis").chmodx, "Make current file executable" },
    ["<leader>rf"] = { require("genghis").renameFile, "Rename current file" },
    ["<leader>mf"] = { require("genghis").moveAndRenameFile, "Move and rename current filepath" },
    ["<leader>nf"] = { require("genghis").createNewFile, "Create new file" },
    ["<leader>yf"] = { require("genghis").duplicateFile, "Duplicate current file" },
    ["<leader>Df"] = { function () require("genghis").trashFile{ trashLocation = "$HOME/.Trash" } end, "Trash current file" },

    -- TO-DO
    ["<leader>td"] = { "<cmd>TodoQuickFix<CR>", "To-Do Toggle", { silent = true }},
    ["<leader>tcp"] = { require("todo-comments").jump_prev, "To-Do next inline" },
    ["<leader>tcd"] = { require("todo-comments").jump_next, "To-Do previous inline" },

    -- TWILIGHT
    ["<leader>zt"] = { "<cmd>Twilight<CR>", "Twilight toggle" },

    -- AERIAL
    ["<leader>tat"] = { "<cmd>AerialToggle!<CR>", "Toggle Aerial", { silent = true } },
    ["<leader>tac"] = { "<cmd>AerialClose<CR>", "Close Aerial" },
    ["<leader>tax"] = { "<cmd>AerialCloseAll<CR>", "Close all Aerial instances" },

    -- RENAMER
    ["<leader>fr"] = {function()
        return ":IncRename " .. vim.fn.expand("<cword>")
    end, expr = true, "Rename function under cursor" },

    -- OVERLENGHT
    ["<leader>lt"] = { "<cmd>OverlengthToggle<CR>", "Overlength Toggle", { silent = true }},

    -- TELESCOPE
    ["<leader>tf"] = { require("telescope.builtin").find_files, "Find files", { silent = true } },
    ["<leader>tg"] = { require("telescope.builtin").git_files, "Git files", { silent = true } },
    ["<leader>tb"] = { require("telescope.builtin").buffers, "List buffers", { silent = true } },
    ["<leader>tr"] = { require("telescope.builtin").oldfiles, "Recent files", { silent = true } },
    ["<leader>tl"] = { require("telescope.builtin").loclist, "Proyect loclist", { silent = true } },
    ["<leader>vh"] = { require("telescope.builtin").help_tags, "Help tags", { silent = true }},
    ["<leader>ts"] = { function() require("telescope.builtin").grep_string ({ search = vim.fn.input("Grep > ") }) ; end, "Grep through files", { silent = true } },

    -- COKELINE
    ["<leader>cn"] = { "<Plug>(cokeline-focus-next)", "Change to next buffer", { silent = true } },
    ["<leader>cp"] = { "<Plug>(cokeline-focus-prev)", "Change to previous buffer", { silent = true } },
    ["<leader>cc"] = { "<Plug>(cokeline-pick-close)", "Pick buffer to close", { silent = true } },
    ["<leader>csn"] = { "<Plug>(cokeline-switch-next)", "Swap with next buffer", { silent = true } },
    ["<leader>csp"] = { "<Plug>(cokeline-switch-prev)", "Swap with next buffer", { silent = true } },

    -- TREESITTER
    ["<leader>ct"] = { "<cmd>TSContextToggle<CR>", "TS Context Toggle", { silent = true }},
    ["<leader>ttp"] = { "<cmd>TSPlaygroundToggle<CR>", "TS Playground Toggle", { silent = true }},

    -- TREESJ
    ["Q"] = { "<cmd>TSJToggle<CR>", "Toggle TS node", { silent = true } },
    ["<leader>md"] = { "<cmd>Glow<CR>", "Toggle MD preview", { silent = true } },
})

