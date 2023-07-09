Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "multicursors.nvim"

return {
  "smoka7/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "VeryLazy",
  dependencies = { "smoka7/hydra.nvim" },
  keys = {
    { "<leader>mc", "<cmd>MCstart<CR>", desc = "Multi-line start" },
    { "<leader>mcc", "<cmd>MCclear<CR>", desc = "Multi-line clear sel." },
    { "<leader>mcp", "<cmd>MCpattern<CR>", desc = "Multi-line buffer pattern" },
    { "<leader>mcv", "<cmd>MCstart<CR>", desc = "Multi-line selection pattern" },
    { "<leader>mcu", "<cmd>MCstart<CR>", desc = "Multi-line under-cursor start" },
  },
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {
        create_commands = true,
        updatetime = 50,
      }
    end
  end,
}
