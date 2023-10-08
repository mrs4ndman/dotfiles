Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "refactoring.nvim"

return {
  "ThePrimeagen/" .. plugin,
  keys = {
    { "<leader>rr", desc = "[refactoring] Select refactoring" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup({

      prompt_func_return_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
      prompt_func_param_type = {
        go = true,
        cpp = true,
        c = true,
        java = true,
      },
    })
    vim.keymap.set({ "n", "x" }, "<leader>rr", function()
      require("refactoring").select_refactor()
    end)
  end,
}
