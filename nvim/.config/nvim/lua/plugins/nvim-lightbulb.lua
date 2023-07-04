Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-lightbulb"
-- Ideas for the brain
return {
	"kosayoda/" .. plugin,
	enabled = Is_Enabled(plugin),
	event = "BufReadPre",
	dependencies = "antoinemadec/FixCursorHold.nvim",
	opts = function(_, opts)
		if Use_Defaults(plugin) then
			opts = opts
		else
			opts = {
				ignore = {},
				sign = {
					enabled = true,
					priority = 10,
				},
				-- status_text = {
				--     enabled = true,
				--     text = "󰛨",
				--     text_unavailable = ""
				-- },
				autocmd = { enabled = true },
			}
		end
	end,
}
