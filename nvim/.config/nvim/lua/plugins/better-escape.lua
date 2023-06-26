Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "better-escape.nvim"

return {
    "max397574/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = "VeryLazy",
    opts = function(_, opts)
        if Use_Defaults(plugin) then
            opts = opts
        else
            opts = {
                mapping = {"zj", "<j", "zk", "<k" },
                timeout = 150,
                clear_empty_lines = true,
                keys = "<Esc>",
            }
        end
    end,
}
