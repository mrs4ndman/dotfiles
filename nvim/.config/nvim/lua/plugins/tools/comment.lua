Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "Comment.nvim"

return {
  "numToStr/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufRead", "BufNewFile" },
  opts = {},
  config = function()
    require("Comment").setup({
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    })
  end,
}
