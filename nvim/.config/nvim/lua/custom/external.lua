-- NEOCLIP
-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>nc"] = { "<cmd>Telescope neoclip<CR>", { desc = "Neoclip toggle", silent = true } },
})

-- HBAC
-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>vp"] = { require("hbac").toggle_pin, "Toggle HBAC pin", { silent = true } },
    ["<leader>vo"] = { require("hbac").close_unpinned, "Close unpinned", { silent = true } },
})

-- AUTO-SESSION
-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>sd"] = { "<cmd>SessionDelete<CR>", "Delete current session", { silent = true } },
    ["<leader>sr"] = { "<cmd>SessionRestore<CR>", "Restore session for CWD", { silent = true } },
    ["<leader>ss"] = { "<cmd>SessionSave<CR>", "Save current session", { silent = true } },
})
