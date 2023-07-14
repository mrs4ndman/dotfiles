Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "todo-comments.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  dependencies = "nvim-lua/plenary.nvim",
  opts = {
    signs = true,
  },
  config = function(opts)
    require("todo-comments").setup(opts)
    vim.keymap.set({ "n", "v" }, "<leader>tcp", require("todo-comments").jump_prev, { desc = "To-Do previous inline" })
    vim.keymap.set({ "n", "v" }, "<leader>tcn", require("todo-comments").jump_next, { desc = "To-Do next inline" })
  end,
  keys = {
    { "<leader>td", "<cmd>TodoTrouble<CR>", desc = "To-Do Toggle", },
  },
  cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
}
