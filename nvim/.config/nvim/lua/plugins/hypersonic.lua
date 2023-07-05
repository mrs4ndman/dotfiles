Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "hypersonic.nvim"

return {
  "tomiis4/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "CmdlineEnter",
  config = function()
    require("hypersonic").setup({
      -- config
    })
  end,
}