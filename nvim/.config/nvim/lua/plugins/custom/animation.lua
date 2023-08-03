Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "animation.nvim"

return {
  "anuvyklack/" .. plugin,
  dependencies = {
    "anuvyklack/middleclass",
  },
  keys = {
    {
      "<leader>A",
      function()
        require("custom.animation").redraw_buffer()
      end,
      desc = "Start animation",
    },
  },
}
