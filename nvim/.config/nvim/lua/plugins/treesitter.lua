require'nvim-treesitter.configs'.setup {
  ensure_installed = {
      "bash",
      "c",
      "lua",
      "java",
      "javascript",
      "json",
      "python",
      "query",
      "rust",
      "svelte",
      "tsx",
      "toml",
      "typescript",
      "vim",
      "vimdoc",
      "yaml"
  },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
