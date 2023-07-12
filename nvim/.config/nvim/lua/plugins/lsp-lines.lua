return {
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  lazy = false,
  config = function()
    require("lsp_lines").setup()
  end
}
