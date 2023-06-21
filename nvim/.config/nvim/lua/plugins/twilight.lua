require("twilight").setup = {
    {
        alpha = 0.25,
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
        inactive = true,
    },
    context = 40,
    treesitter = true,
    expand = {
        "function",
        "method",
        "table",
        "if_statement",
    },
    exclude = { "alpha", "git" }
}
-- TWILIGHT

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>zt"] = { "<cmd>Twilight<CR>", "Twilight toggle" },
})
