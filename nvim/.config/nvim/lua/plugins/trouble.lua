Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "trouble.nvim"

return {
    "folke/" .. plugin,
    cmd = { "TroubleToggle", "Trouble" },
    opts = function(_, opts)
        if Use_Defaults(plugin) then
            opts = opts
        else
            opts = { use_diagnostic_signs = true }
        end
    end,
    config = function()
        require("trouble").setup()
    end
}
