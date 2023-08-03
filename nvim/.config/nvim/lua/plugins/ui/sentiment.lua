Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "sentiment.nvim"

return {
  "utilyre/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufRead" },
  keys = {
    { "<leader>my", "<cmd>DoMatchParen<CR>", desc = "Disable matching pairs" },
    { "<leader>mn", "<cmd>NoMatchParen<CR>", desc = "Enable matching pairs" },
  },
  init = function()
    vim.g.loaded_matchparen = 1
  end,
  opts = {
    delay = 200,
    pairs = {
      { "{", "}" },
      { "(", ")" },
      { "<", ">" },
    },
  },
}
