-- ThePrimeagen's lsp config, to be expanded. All credits go to him and his setup :)
-- Startup:

require('neodev').setup()
local lsp = require('lsp-zero')
lsp.preset({
    name = 'minimal',
    set_lsp_keymaps = false,
    manage_nvim_cmp = false,
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
})

-- Buffer LSP tools
lsp.ensure_installed({
    -- Language servers
    'lua_ls',
    'vimls',
    'marksman',
    'clangd',
    'neocmake',
    'html',
    'css-lsp',
    'eslint-lsp',
    'tsserver',
    'bashls',
    'ansible-language-server',
    'yamlls',
    'ruff_lsp',
    'rust_analyzer',
    'ruby_ls',
    'gopls',
    'jdtls',
    -- Formatters
    'black',
    'cbfmt',
    'eslint',
    'luaformatter',
    'prettierd',
    'ruff',
    'rustfmt',
    'shfmt',
    'stylua',
    -- Linters
    'ansible-lint',
    'flake8',
    'shellcheck',
    -- DAP
    'codelldb',
    'go-debug-adapter',
    'bash-debug-adapter',
})

lsp.setup_servers({
    -- Language servers
    'lua_ls',
    'vimls',
    'marksman',
    'clangd',
    'neocmake',
    'html',
    'cssls',
    'eslint',
    'tsserver',
    'bashls',
    'ansiblels',
    'yamlls',
    'ruff_lsp',
    'rust_analyzer',
    'ruby_ls',
    'gopls',
    'jdtls',
})

lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { desc = "[G]o to [D]efinition" })
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { desc = "Hover data" })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { desc = "Workspace Symbol" })
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, { desc = "Diagnostic Float on current word" })
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, { desc = "Next Diagnostic" })
    vim.keymap.set("n", "d]", function() vim.diagnostic.goto_prev() end, { desc = "Prev Diagnostic" })
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { desc = "View code action" })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { desc = "Show Variable References" })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { desc = "Rename variable with LSP" })
    vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end, { desc = "Format current buffer / file" })
    vim.keymap.set("i", "<C-q>", function() vim.lsp.buf.signature_help() end, { desc = "Quickhelp on word" })

    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end)


-- Change here the left sidebar LSP icon config for:
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

lsp.setup()

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = false,
})
