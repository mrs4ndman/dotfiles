Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "fzf"

return {
    "junegunn/" .. plugin,
    lazy = true,
    enabled = Is_Enabled(plugin),
    config = { function() if pcall(require("telescope")) then
        pcall(require("telescope").load_extension "fzf")
    end
end
}
}
