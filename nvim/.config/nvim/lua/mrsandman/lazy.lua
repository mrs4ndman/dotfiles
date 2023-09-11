-- Mr Sandman's .lua config for NVIM lazy.lua

vim.g.mapleader = " "
-- A little special key 😎
vim.g.maplocalleader = "ñ"

require("lazy").setup({
  spec = {
    { import = "plugins.custom" },
    { import = "plugins.movement" },
    { import = "plugins.treesitter" },
    { import = "plugins.lsp" },
    { import = "plugins.ui" },
    { import = "plugins.tools" },
    { import = "plugins.dap" },
    { import = "plugins.langs" },
    { import = "plugins.completion" },
    { import = "plugins.misc" },
  },
  defaults = { lazy = true },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
  performance = {
    cache = { enabled = true },
    rtp = {
      disabled_plugins = {
        "man",
        "gzip",
        "tarPlugin",
        "matchit",
        -- "matchparen",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
