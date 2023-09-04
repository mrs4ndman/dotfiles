Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "numb.nvim"
-- This plugin allows me to input a number in the command line and "peek" at
-- the state of the code in the lines around it.

return {
  "nacro90/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "VimEnter",
  config = function()
    require("numb").setup({
      show_cursorline = true,
      centered_peeking = true,
    })
  end,
}
