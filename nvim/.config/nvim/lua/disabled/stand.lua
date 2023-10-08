Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "stand.nvim"

return {
  "mvllow/" .. plugin,
  keys = {
    { "<leader>sx", "<cmd>StandNow<CR>", desc = "Time to stand remaining" },
    { "<leader>st", "<cmd>StandWhen<CR>", desc = "Start stand timer" },
  },
  opts = {
    minute_interval = 60,
  }
}
