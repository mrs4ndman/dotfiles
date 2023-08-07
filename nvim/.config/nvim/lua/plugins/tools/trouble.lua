Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "trouble.nvim"

return {
  "folke/" .. plugin,
  cmd = { "TroubleToggle", "Trouble" },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "Trouble Toggle" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Trouble Quickfix" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Trouble loclist" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Trouble Workspace Diagnostics" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Trouble Document Diagnostics" },
    { "gr", "<cmd>TroubleToggle lsp_references<CR>", desc = "Trouble LSP References" },
  },
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = { use_diagnostic_signs = true }
    end
  end,
  config = function()
    require("trouble").setup()
  end,
}
