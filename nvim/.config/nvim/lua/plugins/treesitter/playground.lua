Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "playground"

return {
  "nvim-treesitter/" .. plugin,
  keys = {
    { "<leader>ttp", "<cmd>TSPlaygroundToggle<CR>", desc = "TS Playground Toggle" },
  },
  enabled = Is_Enabled(plugin),
  cmd = "TSPlaygroundToggle",
}
