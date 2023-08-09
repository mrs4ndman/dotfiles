Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "mini.ai"

return {
  "echasnovski/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("mini.ai").setup({
      custom_textobjects = {
        f = false,
      },
      mappings = {
        around = "a",
        inside = "i",
        around_next = "an",
        inside_next = "in",
        around_last = "al",
        inside_last = "il",
        goto_left = "g[",
        goto_right = "g]",
      },
      silent = true,
      n_lines = 100,
    })
  end,
}
