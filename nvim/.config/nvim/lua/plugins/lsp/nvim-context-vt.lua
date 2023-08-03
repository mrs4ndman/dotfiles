Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "nvim_context_vt"

return {
  "haringsrob/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>ct", "<cmd>NvimContextVtToggle<CR>", desc = "Toggle VT context" }
  },
  opts = {
    enabled = false,
    disable_ft = { "markdown" },
    disable_virtual_lines = false,
  },
}