Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-navic"

return {
  "SmiteshP/" .. plugin,
  enabled = Is_Enabled(plugin),
  init = function()
    vim.g.navic_silence = true
  end,
  config = function()
    require("nvim-navic").setup({
      separator = "  ",
      highlight = true,
      lsp = { auto_attach = true },
      depth_limit = 4,
    })
  end,
}
