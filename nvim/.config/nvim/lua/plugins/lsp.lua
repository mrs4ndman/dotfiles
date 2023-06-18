-- ThePrimeagen's lsp config, to be expanded. All credits go to him and his setup :)
-- Startup:

require('neodev').setup()
local lsp = require('lsp-zero')
lsp.preset({
    name = 'minimal',
    set_lsp_keymaps = false,
    manage_nvim_cmp = false,
    suggest_lsp_servers = true,
})

-- Buffer LSP tools
lsp.ensure_installed({
    'tsserver',
    'eslint',
    'rust_analyzer',
    'neocmake',
    'clangd',
    'vimls',
    'lua_ls',
    'html',
    'marksman',
    'bashls',
    'yamlls',
    'pylsp',
    'ruby_ls',
    'gopls',
})

lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "d]", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_) vim.lsp.buf.format() end, {desc = 'Format current buffer with LSP'})

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


-- local mason_lspconfig = require 'mason-lspconfig'

-- local servers = {
--     pylsp = {
--         filetypes = {"python"},
--     }
-- }

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
