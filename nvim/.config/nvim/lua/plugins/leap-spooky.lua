Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "leap-spooky.nvim"

return {
  "ggandor/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = false,
  config = function()
    require("leap-spooky").setup {
      -- Text object hooks
      affixes = {
        magnetic = { window = "M", cross_window = "m" },
        remote = { window = "R", cross_window = "r" },
      },
      -- Text objects are defined with i/a - obj, instead of riw, raw
      prefix = false,
      paste_on_remote_yank = true,
    }
  end,
}
