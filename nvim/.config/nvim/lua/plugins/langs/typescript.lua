local plugin = "typescript-tools.nvim"

return {
  -- Typescript
  {
    "pmizio/" .. plugin,
    ft = { "javascriptreact", "typescriptreact", "javascript", "typescript" },
    enabled = Is_Enabled(plugin),
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
}
