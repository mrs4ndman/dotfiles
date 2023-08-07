Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "todo-comments.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufRead", "BufNewFile" },
  dependencies = "nvim-lua/plenary.nvim",
  keys = {
    { "<leader>td", "<cmd>TodoTrouble<CR>", desc = "To-Do Toggle", },
  },
  cmd = { "TodoTrouble", "TodoTelescope", "TodoLocList", "TodoQuickFix" },
  config = function()
    require("todo-comments").setup({
      signs = true,
      search = {
        args = {
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--hidden"
        }
      }
    })
    vim.keymap.set({ "n", "v" }, "<leader>tcp", require("todo-comments").jump_prev, { desc = "To-Do previous inline" })
    vim.keymap.set({ "n", "v" }, "<leader>tcn", require("todo-comments").jump_next, { desc = "To-Do next inline" })
  end,
}
