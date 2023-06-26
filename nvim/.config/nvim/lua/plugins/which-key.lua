Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "which-key.nvim"

return {
    {
       "folke/" .. plugin,
        enabled = Is_Enabled(plugin),
        event = "VeryLazy",
        keys = false,
    },
}
