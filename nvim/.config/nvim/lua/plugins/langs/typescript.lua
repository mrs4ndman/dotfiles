return {
  -- Typescript
  {
    "pmizio/typescript-tools.nvim",
    ft = "typescript",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("langs.typescript")
    end
  }
}
