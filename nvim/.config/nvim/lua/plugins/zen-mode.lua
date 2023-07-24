Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "zen-mode.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>zz", desc = "A bit Zen" },
    { "<leader>zZ", desc = "Even more Zen" },
  },
  config = function()
    -- ZEN-MODE
    vim.keymap.set("n", "<leader>zz", function()
      require("zen-mode").setup({
        window = {
          width = 90,
          options = {},
        },
      })
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.number = true
      vim.wo.rnu = true
    end, { desc = "Ultra Zen-mode" })

    vim.keymap.set("n", "<leader>zZ", function()
      require("zen-mode").setup({
        window = {
          width = 90,
          options = {},
        },
      })
      require("zen-mode").toggle()
      vim.wo.wrap = false
      vim.wo.number = false
      vim.wo.rnu = false
      vim.opt.colorcolumn = "0"
    end, { desc = "Ultra Zen-mode" })
  end,
}
