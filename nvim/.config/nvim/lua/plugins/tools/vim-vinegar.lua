local plugin = "vim-vinegar"

return {
  "tpope/", -- Native Ex gets extensions
  enabled = Is_Enabled(plugin),
  event = "VimEnter",
}
