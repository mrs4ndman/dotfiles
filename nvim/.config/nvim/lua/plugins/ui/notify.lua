Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-notify"

return {
  "rcarriga/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "VimEnter",
  config = function()
    require("notify").setup({
    stages = "static",
    timeout = 1500,
    render = "compact",
    max_height = function()
      return math.floor(vim.o.lines * 0.30)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.35)
    end,
  })
    vim.notify = require("notify")
  end,
}
