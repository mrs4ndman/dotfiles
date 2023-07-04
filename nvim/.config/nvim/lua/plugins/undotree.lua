Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "undotree"

return {
  "mbbill/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Undo-tree Toggle" },
  },
}
