Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "go.nvim"

return {
  "ray-x/" .. plugin,
  config = function()
    require("go").setup()
  end,
  -- event = "VeryLazy",
  ft = {"go", 'gomod'},
  build = ':lua require("go.install").update_all_sync()'
}
