-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>ct"] = { "<cmd>TSContextToggle<CR>", "TS Context Toggle", { silent = true }},
    ["<leader>ttp"] = { "<cmd>TSPlaygroundToggle<CR>", "TS Playground Toggle", { silent = true }},
})
