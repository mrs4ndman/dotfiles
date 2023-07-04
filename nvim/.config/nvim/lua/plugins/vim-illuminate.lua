local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "vim-illuminate"
-- Highlighting instances of words with LSP, Treesitter and Regex matching

return {
    "RRethy/" .. plugin,
    enabled = Is_Enabled(plugin),
    cmd = "IlluminateToggle",
    lazy = true,
}

