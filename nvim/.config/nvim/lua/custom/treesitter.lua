-- TREESJ
require("treesj").setup()

-- Per-plugin which-key customization
local wk = require("which-key")

-- TREESITTER
wk.register({
    ["<leader>ct"] = { "<cmd>TSContextToggle<CR>", "TS Context Toggle", { silent = true }},
    ["<leader>ttp"] = { "<cmd>TSPlaygroundToggle<CR>", "TS Playground Toggle", { silent = true }},
})

-- TREESJ
wk.register({
    ["<leader>bt"] = { require('treesj').toggle, "Toggle TS node", { silent = true } },
})
