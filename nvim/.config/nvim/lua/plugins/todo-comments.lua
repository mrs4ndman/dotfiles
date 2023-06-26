Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "todo-comments.nvim"

return {
    "folke/" .. plugin,
    enabled = Is_Enabled(plugin),
    event = "BufReadPost",
    cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
    dependencies = "nvim-lua/plenary.nvim",
}
