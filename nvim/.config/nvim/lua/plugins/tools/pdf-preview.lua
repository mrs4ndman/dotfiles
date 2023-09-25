local plugin = "md-pdf.nvim"

return {
  "arminveres/" .. plugin,
  enabled = Is_Enabled(plugin),
  branch = "main",
  lazy = true,
  keys = {
    { "<leader>pd", ":lua require('md-pdf').convert_md_to_pdf()<CR>", desc = "PDF Preview" }
  },
  config = true,
}
