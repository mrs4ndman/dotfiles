Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "live-server.nvim"

return {
  "barrett-ruth/" .. plugin,
  keys = {
    { "<leader>ls", "<cmd>LiveServerStart<CR>", desc = "Restart Live Server" },
    { "<leader>lq", "<cmd>LiveServerStop<CR>",  desc = "Stop Live Server" },
  },
  config = function()
    require("live-server").setup({
      port = 8080,
      browser_command = "firefox",
      quiet = true,
    })
  end,
}