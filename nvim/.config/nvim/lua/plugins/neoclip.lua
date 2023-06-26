Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-neoclip.lua"

return {
    "AckslD/" .. plugin,
    enabled = Is_Enabled(plugin),
    cmd = "Telescope neoclip",
    event = "VeryLazy",
    dependencies = "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
        if Use_Defaults(plugin) then
            opts = opts
        else opts = {
            history = 2000,
            preview = true,
            on_select = { move_to_front = false, close_telescope = false },
            on_paste = { move_to_front = false, close_telescope = true },
            keys = {
                telescope = {
                    i = {
                        select = '<cr>',
                        paste = '<c-p>',
                        paste_behind = '<c-b>',
                    },
                    n = {
                        select = '<cr>',
                        paste = 'p',
                        paste_behind = 'p',
                    },
                },
                fzf = {
                    select = 'default',
                    paste = 'ctrl-p',
                    paste_behind = 'ctrl-b',
                },
            },
        }
    end
end,
config = {
   function() if pcall(require("telescope")) then
        pcall(require("telescope").load_extension "neoclip")
    end
end
}
}
