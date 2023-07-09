Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-treesitter"

return {
  -- 4.- Treesitter modules

  {
    "nvim-treesitter/" .. plugin, -- parsing to the end of time
    enabled = Is_Enabled(plugin),
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
    },
  },
}
