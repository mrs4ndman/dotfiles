-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>il"] = { "<cmd>IndentBlanklineToggle<CR>", "Indent-line toggle" },
})
