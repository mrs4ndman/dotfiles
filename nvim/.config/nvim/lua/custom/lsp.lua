-- LSP Explicit config
local lspconfig = require("lspconfig")
local navbuddy = require("nvim-navbuddy")

-- Defining capabilities for LSPs
local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  },
}

-- Luasnip setup
require("luasnip.loaders.from_vscode").lazy_load()

-- First, Native LSP attach
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "<leader>tD", require("telescope.builtin").lsp_document_symbols, bufopts)
  vim.keymap.set("n", "<leader>tW", require("telescope.builtin").lsp_dynamic_workspace_symbols, bufopts)
  -- Not needed anymore bc of autocmd below
  -- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { desc = "Diagnostic Float on current word" })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
  vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, bufopts)
  vim.keymap.set({ "n", "v" }, "<leader>vrn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("i", "<C-q>", vim.lsp.buf.signature_help, bufopts)
  -- Formatting keybind (see formatter-guide.md)
  -- vim.keymap.set("n", "<leader>F", function()
  --   vim.lsp.buf.format({ async = true })
  -- end, { desc = "Format current buffer / file" })

  -- Floating diagnostic window on cursor
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
        border = "rounded",
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })

  -- Plugin attachments
  navbuddy.attach(client, bufnr)
  require("virtualtypes").on_attach()
end

-- LSP Server setups

-- Lua
require("lspconfig").lua_ls.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Rusty boi
require("lspconfig").rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
  settings = {
    ["rust-analyzer"] = {
      diagnostics = {
        enable = true,
      },
    },
  },
})

-- Clangd for C / C++
lspconfig.clangd.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
})

-- Web Dev swag
lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
})

lspconfig.intelephense.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
  settings = {
    intelephense = {
      environment = {
        shortOpenTag = true
      },
    },
  },
})

lspconfig.astro.setup({})
lspconfig.pylsp.setup({})
lspconfig.vimls.setup({})
lspconfig.marksman.setup({})
lspconfig.ocamlls.setup({})
lspconfig.neocmake.setup({})
-- lspconfig.emmet_ls.setup({})
lspconfig.cssls.setup({})
lspconfig.gopls.setup({})
lspconfig.eslint.setup({})
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
})
lspconfig.bashls.setup({})
lspconfig.ansiblels.setup({})
lspconfig.yamlls.setup({})
lspconfig.ruby_ls.setup({})
-- lspconfig.jdtls.setup {}

-- LSP Attach keybinds
-- vim.api.nvim_create_autocmd("LspAttach", {
--   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
--   callback = function(ev)
--     vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
--   end,
-- })

-- Change here the left sidebar LSP icon config for:
local signs = { Error = "󰅚 ", Warn = " ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Goes with lsp_lines
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
