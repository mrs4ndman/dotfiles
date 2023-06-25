-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    -- TREESITTER
    ["<leader>ct"] = { "<cmd>TSContextToggle<CR>", "TS Context Toggle", { silent = true }},
    ["<leader>ttp"] = { "<cmd>TSPlaygroundToggle<CR>", "TS Playground Toggle", { silent = true }},

    -- TREESJ
    ["Q"] = { "<cmd>TSJToggle<CR>", "Toggle TS node", { silent = true } },
})

