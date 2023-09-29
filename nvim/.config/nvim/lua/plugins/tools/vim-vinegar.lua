local plugin = "vim-vinegar"

return {
  "tpope/vim-vinegar", -- Native Ex gets extensions
  enabled = Is_Enabled(plugin),
  event = "VimEnter",
}
