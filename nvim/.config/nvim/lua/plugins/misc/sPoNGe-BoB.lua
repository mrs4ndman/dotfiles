Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "sPoNGe-BoB.NvIm"

return {
  "tjdevries/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>sb", "<cmd>SpOnGeBoBtOgGlE<CR>", mode = {"n"}, desc = "Toggle SpOnGeBoB" },
    { "<leader>sb", "<cmd>SpOnGeBoBiFy<CR>", mode = {"v"}, desc = "Toggle SpOnGeBoB" },
  }
}
