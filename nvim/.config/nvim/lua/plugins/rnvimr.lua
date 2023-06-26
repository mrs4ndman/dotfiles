Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "rnvimr"

-- TODO: Find another file explorer to integrate, this one causes trouble
return {
    "kevinhwang91/" .. plugin,
    cmd = "RnvimrToggle",
    enabled = Is_Enabled(plugin),
}
