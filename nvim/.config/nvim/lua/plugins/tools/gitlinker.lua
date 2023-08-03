Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "gitlinker.nvim"
-- This plugin creates a permalink to the selected code for the repository it is
-- in, for sharing quick and permanent code snippets.

return {
  "ruifm/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>gy", mode = {"n", "v"}, desc = "Create codelink" }
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("gitlinker").setup()
  end
}
