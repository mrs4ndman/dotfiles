Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "vim-lastplace"

return {
    "farmergreg/" .. plugin,
    event = "VimEnter",
    enabled = Is_Enabled(plugin),
}