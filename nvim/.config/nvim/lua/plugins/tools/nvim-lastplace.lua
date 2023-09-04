Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-lastplace"

return {
  "ethanholz/" .. plugin,
  event = "VimEnter",
  enabled = Is_Enabled(plugin),
  config = function()
    require 'nvim-lastplace'.setup {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true,
    }
  end
}
