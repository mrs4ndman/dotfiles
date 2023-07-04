Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "inc-rename.nvim"
return {
  "smjonas/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "IncRename",
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {
        input_buffer_type = "dressing",
      }
    end
  end,
}
