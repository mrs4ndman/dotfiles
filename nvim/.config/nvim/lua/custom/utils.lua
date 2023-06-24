-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
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
    ["<leader>cx"] = { require("genghis").chmodx, "Make current file executable" },
    ["<leader>rf"] = { require("genghis").renameFile, "Rename current file" },
    ["<leader>mf"] = { require("genghis").moveAndRenameFile, "Move and rename current filepath" },
    ["<leader>nf"] = { require("genghis").createNewFile, "Create new file" },
    ["<leader>yf"] = { require("genghis").duplicateFile, "Duplicate current file" },
    ["<leader>Df"] = { function () require("genghis").trashFile{ trashLocation = "$HOME/.Trash" } end, "Trash current file" },
})
