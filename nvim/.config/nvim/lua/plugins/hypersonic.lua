Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "hypersonic.nvim"

return {
  "tomiis4/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "VeryLazy",
  cmd = "Hypersonic",
  config = function()
    require("hypersonic").setup({
      add_padding = false,
      enable_cmdline = false,
    })
  end,
}
