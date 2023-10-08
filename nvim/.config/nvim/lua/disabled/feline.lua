local plugin = "feline.nvim"
return {
  "freddiehaddad/" .. plugin,
  enabled = false,
  lazy = false,
  config = function ()
    require("feline").setup()
    vim.notify("Feline loaded")
  end,
}
