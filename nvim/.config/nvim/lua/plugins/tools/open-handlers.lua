Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "open-handlers.nvim"

return {
  "mrshmllow/" .. plugin,
  enabled = Is_Enabled(plugin),
  cond = vim.ui.open ~= nil,
  config = function()
    local oh = require("open-handlers")
    oh.setup({
      handlers = {
        oh.commit,
        oh.issue,
        oh.native,
      },
    })
  end,
}
