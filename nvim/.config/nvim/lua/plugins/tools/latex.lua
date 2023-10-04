local plugin = "vimtex"
return {
  "lervag/vimtex",
  keys = {
    { "<localleader>t", "<cmd>VimtexCompile<CR> | VimtexView<CR>" }
  },
  enabled = Is_Enabled(plugin),
  ft = { "bib", "tex" },
  config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_context_pdf_viewer = "okular"
    vim.g.vimtex_indent_enabled = 0
    vim.g.vimtex_syntax_enabled = 0
    vim.g.vimtex_imaps_enabled = 0
    vim.g.vimtex_log_ignore = ({
      'Underfull',
      'Overfull',
      'specifier changed to',
      'Token not allowed in a PDF string'
    })
    vim.keymap.set("n", "dsm", "<Plug>(vimtex-env-delete-math)")
  end,
}
