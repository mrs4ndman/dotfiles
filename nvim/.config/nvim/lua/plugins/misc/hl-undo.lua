Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "highlight-undo.nvim"

return {
  "tzachar/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufRead", "BufNewFile" },
  config = function()
    require("highlight-undo").setup({
      duration = 250,
      undo = {
        hlgroup = "@text.diff.add",
        mode = { "n", "v" },
        lhs = "u",
        map = "undo",
        opts = {},
      },
      redo = {
        hlgroup = "@text.diff.delete",
        mode = { "n", "v" },
        lhs = "<C-r>",
        map = "redo",
        opts = {},
      },
    })
  end,
}
