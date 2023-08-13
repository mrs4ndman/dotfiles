Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "refactoring.nvim"

return {
  "ThePrimeagen/" .. plugin,
  keys = {
    { "<leader>ex", desc = "Extract Function" },
    { "<leader>ef", desc = "Extract Function To File" },
    { "<leader>ev", desc = "Extract Variable"},
    { "<leader>ri", desc = "Refactor Inline Variable" },
    { "<leader>eb", desc = "Extract Block" },
    { "<leader>ebf", desc = "Extract Block To File" },
    { "<leader>rr", desc = "UI Select refactoring" },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require('refactoring').setup({

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
    vim.keymap.set("x", "<leader>ex", function() require("refactoring").refactor('Extract Function') end)
    vim.keymap.set("x", "<leader>ef", function() require("refactoring").refactor('Extract Function To File') end)
    vim.keymap.set("x", "<leader>ev", function() require("refactoring").refactor('Extract Variable') end)
    vim.keymap.set({ "n", "x" }, "<leader>ri", function() require("refactoring").refactor('Inline Variable') end)
    vim.keymap.set("n", "<leader>eb", function() require("refactoring").refactor('Extract Block') end)
    vim.keymap.set("n", "<leader>ebf", function() require("refactoring").refactor('Extract Block To File') end)
    vim.keymap.set({ "n", "x" }, "<leader>rr", function() require("refactoring").select_refactor() end)

    vim.keymap.set(
      "n",
      "<leader>rp",
      ""
    )
  end
}
