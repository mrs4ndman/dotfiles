require("lspconfig").rust_analyzer.setup{}

local rt = require("rust-tools")

rt.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set("n", "<leader>Rh", rt.hover_actions.hover_actions, { buffer = bufnr })
            vim.keymap.set("n", "<leader>Ra", rt.code_action_group.code_action_group, { buffer = bufnr })
        end
    },
})
