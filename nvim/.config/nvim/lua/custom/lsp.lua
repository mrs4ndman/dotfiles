-- LSP Explicit config
local lspconfig = require("lspconfig")
-- local navbuddy = require("nvim-navbuddy")

-- Defining capabilities for LSPs
local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)
-- INFO: For Vue LS
-- M.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

---@diagnostic disable-next-line: missing-fields
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
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, desc = "[LSP] Go to Definition", buffer = bufnr })
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { noremap = true, desc = "[LSP] Go to Declaration", buffer = bufnr })
  vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, { noremap = true, desc = "[LSP] Go to Type definition", buffer = bufnr })
  vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { noremap = true, desc = "[LSP] Go to Implementation", buffer = bufnr })
  vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, desc = "[LSP] Hover info", buffer = bufnr })
  -- stylua: ignore
  vim.keymap.set("n", "<leader>tD", "<cmd>Telescope lsp_dynamic_document_symbols<CR>",
    { desc = "[LSP] Dynamic document symbols", buffer = bufnr })
  vim.keymap.set("n", "<leader>tW", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", { desc = "[LSP] Dynamic workspace symbols", buffer = bufnr })
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { noremap = true, desc = "[LSP] Previous diagnostic", buffer = bufnr })
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { noremap = true, desc = "[LSP] Next diagnostic", buffer = bufnr })
  vim.keymap.set({ "n", "v" }, "<leader>vca", vim.lsp.buf.code_action, { noremap = true, desc = "[LSP] View code actions", buffer = bufnr })
  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, { noremap = true, desc = "[LSP} Show references", buffer = bufnr })
  vim.keymap.set({ "n", "v" }, "<leader>vrn", vim.lsp.buf.rename, { noremap = true, desc = "[LSP] Rename element under cursor", buffer = bufnr })
  vim.keymap.set("n", "<C-n>", vim.lsp.buf.signature_help, { noremap = true, desc = "[LSP] Signature help", buffer = bufnr })

  if vim.lsp.inlay_hint then
    vim.keymap.set("n", "<leader>ih", function()
      vim.lsp.inlay_hint(0, nil)
    end, { desc = "Toggle Inlay hints" })
  end

  -- INFO: For Typescript
  if client.name == "tsserver" then
    vim.keymap.set("n", "<leader>fR", "<cmd>TypescriptRenameFile<CR>", { desc = "[Typescript] Rename file" })
    vim.keymap.set("n", "<leader>oi", "<cmd>TypescriptOrganizeImports<CR>", { desc = "[Typescript] Organize imports" })
    vim.keymap.set("n", "<leader>ru", "<cmd>TypescriptRemoveUnused<CR>", { desc = "[Typescript] Remove unused" })
  end

  -- INFO: For Svelte
  -- vim.api.nvim_create_autocmd("BufWritePost", {
  --   pattern = { "*.js", "*.ts" },
  --   callback = function(ctx)
  --     if client.name == "svelte" then
  --       client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.file })
  --     end
  --   end,
  -- })

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

  -- TODO: Need to configure this for the ones that need it:
  if client.server_capabilities.inlayHintProvider then
    vim.lsp.inlay_hint(bufnr, false)
  end

  -- Plugin attachments
  -- navbuddy.attach(client, bufnr)
  print("LSP Attached")
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
      workspace = {
        library = {
          vim.env.VIMRUNTIME,
          vim.fn.stdpath("config") .. "/lua",
          vim.api.nvim_get_runtime_file("", true),
        },
      },
      hint = { enable = true },
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
lspconfig.html.setup({ on_attach = on_attach, capabilities = M.capabilities })
-- lspconfig.eslint.setup({})
lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
  -- javascript = {
  --   inlayHints = {
  --     includeInlayEnumMemberValueHints = true,
  --     includeInlayFunctionLikeReturnTypeHints = true,
  --     includeInlayFunctionParameterTypeHints = true,
  --     includeInlayParameterNameHints = 'all',
  --     includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  --     includeInlayPropertyDeclarationTypeHints = true,
  --     includeInlayVariableTypeHints = true,
  --   },
  -- },
  -- typescript = {
  --   inlayHints = {
  --     includeInlayEnumMemberValueHints = true,
  --     includeInlayFunctionLikeReturnTypeHints = true,
  --     includeInlayFunctionParameterTypeHints = true,
  --     includeInlayParameterNameHints = 'all',
  --     includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  --     includeInlayPropertyDeclarationTypeHints = true,
  --     includeInlayVariableTypeHints = true,
  --   },
  -- },
})
lspconfig.cssls.setup({ on_attach = on_attach, capabilities = M.capabilities })

lspconfig.astro.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
  init_options = {
    typescript = {
      tsdk = "node_modules/typescript/lib",
    },
  },
})

-- Pee-H-Pee
lspconfig.intelephense.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
  settings = {
    intelephense = {
      environment = {
        shortOpenTag = true,
      },
    },
  },
})

-- SHHHHELLLL
lspconfig.bashls.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
})

-- Note-taking helper
lspconfig.marksman.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
})

lspconfig.texlab.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
})

-- Good ole Vimscript
lspconfig.vimls.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
})

lspconfig.yamlls.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
})

lspconfig.jsonls.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
})
lspconfig.pylsp.setup({
  on_attach = on_attach,
  capabilities = M.capabilities,
})
lspconfig.ocamlls.setup({})
lspconfig.neocmake.setup({})
-- lspconfig.emmet_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.ansiblels.setup({})
lspconfig.ruby_ls.setup({})

-- lspconfig.jdtls.setup({
--   on_attach = on_attach,
--   capabilities = M.capabilities,
-- })

-- Change here the left sidebar LSP icon config for:
local signs = {
  Error = require("core.icons").diagnostics.ERROR,
  Warn = require("core.icons").diagnostics.WARN,
  Hint = require("core.icons").diagnostics.HINT,
  Info = require("core.icons").diagnostics.INFO,
}
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
