Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-lspconfig"

return {
  "neovim/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    -- "folke/neodev.nvim",
    "jubnzv/virtual-types.nvim",
    "folke/lsp-colors.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    {
      "SmiteshP/nvim-navbuddy",
      enabled = Is_Enabled("nvim-navbuddy"),
      keys = {
        { "<leader>nb", "<cmd>Navbuddy<CR>", desc = "Navbuddy toggle" }
      },
      dependencies = {
        "SmiteshP/nvim-navic",
        "MunifTanjim/nui.nvim",
      },
      opts = { lsp = { auto_attach = true } }
    },
    {
      url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
      config = function()
        require("lsp_lines").setup()
        -- LSP_LINES TOGGLE
        vim.keymap.set(
          { "n", "v" },
          "<leader>vl",
          require("lsp_lines").toggle,
          { desc = "Toggle LSP line diagnostics" }
        )
      end
    }
  },
  config = function()
    require("custom.lsp")
  end
}
