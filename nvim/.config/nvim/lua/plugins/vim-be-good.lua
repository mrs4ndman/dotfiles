local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "vim-be-good"

return {
	"ThePrimeagen/" .. plugin,
	enabled = Is_Enabled(plugin),
	cmd = "VimBeGood",
}
