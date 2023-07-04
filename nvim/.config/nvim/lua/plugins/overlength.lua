Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "overlength.nvim"

return {
    "lcheylus/" .. plugin,
    -- event = "UIEnter",
    cmd = "OverlengthToggle",
    -- keys = {"<leader>lt", "<cmd>OverlengthToggle<CR>" }
    opts = function(_, opts)
        if Use_Defaults(plugin) then
            opts = opts
        else
            opts = {

                enabled = true,

                ctermdb = 'darkred',
                bg = '#8B0000',

                textwidth_mode = 2,

                default_overlenght = 80,
                highlight_to_eol = true,
                grace_length = 3,

                disable_ft = { 'qf', 'help', 'man', 'packer', 'Telescope' },
            }
        end
    end,
}
