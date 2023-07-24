Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "twilight.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  -- event = "BufReadPost",
  cmd = "Twilight",
  keys = {
    { "<leader>zt", "<cmd>Twilight<CR>", desc = "Twilight toggle" },
  },
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {
        {
          alpha = 0.25,
          color = { "Normal", "#ffffff" },
          term_bg = "#000000",
          inactive = true,
        },
        context = 40,
        treesitter = true,
        expand = {
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = { "alpha", "git" },
      }
    end
  end,
}
