require("todo-comments").setup {
    search = {
        command = "rg",
        args = {
            "--color=never",
            "--no-heading",
            "--hidden",
            "--line-number",
            "--column",
        }
    }
}

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>td"] = { "<cmd>TodoQuickFix<CR>", "To-Do Toggle", { silent = true }},
    ["<leader>tcp"] = { require("todo-comments").jump_prev, "To-Do next inline" },
    ["<leader>tcd"] = { require("todo-comments").jump_next, "To-Do previous inline" },
})
