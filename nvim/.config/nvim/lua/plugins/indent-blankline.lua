Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "indent-blankline.nvim"
-- Indenting visual marks
return {
	"lukas-reineke/" .. plugin,
	enabled = Is_Enabled(plugin),
	event = { "BufReadPost", "BufNewFile" },
	opts = function(_, opts)
		if Use_Defaults(plugin) then
			opts = opts
		else
			opts = {
				space_char_blankline = " ",
				filetype_exclude = { "help", "markdown", "alpha", "Trouble", "lazy", "notify" },
				buftype_exclude = { "terminal", "alpha", "nofile" },
				show_trailing_blankline_indent = false,
				show_current_context = true,
				show_current_context_start = true,
				char = "┊",
			}
		end
	end,
}
