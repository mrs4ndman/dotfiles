
vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").setup {
        window = {
            width = 90,
            options = {}
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = true
    vim.wo.rnu = true
end, { desc = "Ultra Zen-mode" })


vim.keymap.set("n", "<leader>zZ", function()
    require("zen-mode").setup {
        window = {
            width = 90,
            options = {}
        },
    }
    require("zen-mode").toggle()
    vim.wo.wrap = false
    vim.wo.number = false
    vim.wo.rnu = false
    vim.opt.colorcolumn = "0"
end, { desc = "Ultra Zen-mode" })

-- Trouble config:
--
-- KEYBINDS:

-- Base one
-- The important one:
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true, desc = "Trouble Toggle"})

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true, desc = "Trouble Quickfix" })

vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true, desc = "Trouble Loclist" })

vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true, desc = "Trouble Workspace Diagnostics" })

vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true, desc = "Trouble Document Diagnostics" })

vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true, desc = "Trouble LSP References" })


-- TO-DO PLUGIN
-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>td"] = { "<cmd>TodoQuickFix<CR>", "To-Do Toggle", { silent = true }},
    ["<leader>tcp"] = { require("todo-comments").jump_prev, "To-Do next inline" },
    ["<leader>tcd"] = { require("todo-comments").jump_next, "To-Do previous inline" },
})


-- TWILIGHT

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>zt"] = { "<cmd>Twilight<CR>", "Twilight toggle" },
})
