Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "treesj"

return {
  "Wansmer/" .. plugin,
  cmd = "TSJToggle",
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {
        use_default_keymaps = false,
        check_syntax_error = false,
        max_join_length = 300,
        cursor_behaviour = "hold",
        notify = true,
        dot_repeat = true,
      }
    end
  end,
}
