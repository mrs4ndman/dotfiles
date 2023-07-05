Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "hardtime.nvim"

return {
  "m4xshen/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "VimEnter",
  opts = {
    max_time = 750,
    max_count = 3,
    disable_mouse = true,
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
      "qf", "netrw", "neotree", "lazy", "mason", "oil", "TelescopePrompt"
    },
  },
}
