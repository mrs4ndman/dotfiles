-- Mr Sandman's .lua config for NVIM lazy.lua

vim.g.mapleader = " "

require("lazy").setup({
  spec = {
    { import = "plugins.ui" },
    { import = "plugins.tools" },
    { import = "plugins.lsp" },
    { import = "plugins.dap" },
    { import = "plugins.movement" },
    { import = "plugins.langs" },
    { import = "plugins.completion" },
    { import = "plugins.misc" },
    { import = "plugins.treesitter" },
    { import = "plugins.custom" },
  },
  defaults = { lazy = true },
  checker = {
    enabled = true,
  },
  performance = {
    cache = {
      enabled = true,
    },
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
