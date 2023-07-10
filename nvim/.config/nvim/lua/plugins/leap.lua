Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "leap.nvim"

return {
  "ggandor/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = false,
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {
        max_phase_one_targets = 0,
        case_sensitive = true,
        max_highlighted_traversal_targets = 15,
      }
    end
  end,
}
