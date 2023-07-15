Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "highlight-undo.nvim"

return {
  "tzachar/" .. plugin,
  enabled = Is_Enabled(plugin),
  config = function()
    require("highlight-undo").setup({
      duration = 500,
      keymaps = {
        { { "n", "v" }, "u",     "undo", {} },
        { { "n", "v" }, "<C-r>", "redo", {} },
      }
    })
  end
}
