Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "hardtime.nvim"

return {
  "m4xshen/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "VeryLazy",
  opts = {
    max_time = 1250,
    max_count = 5,
    disable_mouse = false,
    hint = true,
    notification = true,
    allow_different_key = true,
    disabled_keys = {
      ["<UP>"] = {"", "i"},
      ["<DOWN>"] = {"", "i"},
      ["<LEFT>"] = {"", "i"},
      ["<RIGHT>"] = {"", "i"},
    },
    disabled_filetypes = {
      "qf", "netrw", "help", "md", "neotree", "lazy", "mason", "oil", "TelescopePrompt"
    },
  },
}
