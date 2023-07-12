Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "specs.nvim"

return {
  "edluffy/" .. plugin,
  event = { "BufReadPre", "BufNewFile" },
  -- lazy = false,
  config = function()
    require("specs").setup {
      show_jumps = true,
      popup = {
        delay_ms = 0,
        inc_ms = 10,
        blend = 10,
        width = 10,
        winhl = "PMenu",
        fader = require("specs").linear_fader,
        resizer = require("specs").shrink_resizer,
      },
      min_jump = 15,
      ignore_filetypes = {},
      ignore_buftypes = {
        lazy = true,
        nofile = true,
        alpha = true,
        telescope = true,
      }
    }
  end
}
