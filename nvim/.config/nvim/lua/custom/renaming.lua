
-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>tat"] = { "<cmd>AerialToggle!<CR>", "Toggle Aerial", { silent = true } },
    ["<leader>tac"] = { "<cmd>AerialClose<CR>", "Close Aerial" },
    ["<leader>tax"] = { "<cmd>AerialCloseAll<CR>", "Close all Aerial instances" },
})

