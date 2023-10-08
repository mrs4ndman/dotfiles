-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
-- local home = os.getenv("HOME")
local navbuddy = require("nvim-navbuddy")
local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)
M.on_attach = function(client, bufnr)
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
  vim.keymap.set("n", "<C-i>", vim.lsp.buf.signature_help, { noremap = true, desc = "[LSP] Signature help", buffer = bufnr })

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
  navbuddy.attach(client, bufnr)
end

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

local config = {
  capabilities = M.capabilities,
  on_attach = M.on_attach,
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = { "/home/mrsandman/.local/share/nvim/mason/bin/jdtls" },
  root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)

vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.expandtab = true
vim.bo.softtabstop = 4
