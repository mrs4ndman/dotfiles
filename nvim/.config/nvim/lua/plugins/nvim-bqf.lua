Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-bqf"

return {
	"kevinhwang91/" .. plugin,
	enabled = Is_Enabled(plugin),
}
