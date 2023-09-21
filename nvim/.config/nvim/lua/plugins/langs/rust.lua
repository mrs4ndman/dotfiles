-- Rust babyyyy
return {
  {
    "rust-lang/rust.vim",
    enabled = Is_Enabled("rust.vim"),
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "saecki/crates.nvim",
    enabled = Is_Enabled("crates.nvim"),
    ft = "rust",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup()
    end,
  },
}
