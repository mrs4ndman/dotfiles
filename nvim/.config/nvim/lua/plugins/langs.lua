return {
  -- Rust babyyyy
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "saecki/crates.nvim",
    ft = "rust",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },

  -- Java?
  { "mfussenegger/nvim-jdtls", lazy = true, ft = "java" },

  -- Typescript
  { "jose-elias-alvarez/typescript.nvim", ft = "typescript" },
  -- {
  --     "pmizio/typescript-tools.nvim",
  --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --     opts = {},
  -- }
}
