require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "c",
      "rust",
      "typescript",
      "lua",
      "python",
      "tsx",
      "svelte",
      "json",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "python",
      "yaml",
      "bash",
      "toml",
      "java"
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
