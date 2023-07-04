Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "todo-comments.nvim"

-- TODO: TEST
return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  dependencies = "nvim-lua/plenary.nvim",
  cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
  opts = {
    signs = true,
  },
  config = function(opts)
    require("todo-comments").setup(opts)
  end,
}
