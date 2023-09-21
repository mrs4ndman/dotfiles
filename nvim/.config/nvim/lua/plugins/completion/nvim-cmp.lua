Customize = require("mrsandman.customize")
Is_Enabled = require("mrsandman.functions").is_enabled

local plugin = "nvim-cmp"

return {
  "hrsh7th/" .. plugin,
  event = "InsertEnter",
  enabled = Is_Enabled(plugin),
  dependencies = {
    -- Completion sources
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "amarakon/nvim-cmp-buffer-lines",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp",
    "ray-x/cmp-treesitter",
    -- Icons
    "onsails/lspkind.nvim",
    {
      "jcdickinson/codeium.nvim",
      dependencies = "nvim-lua/plenary.nvim",
      -- commit = "b1ff0d6c993e3d87a4362d2ccd6c660f7444599f",
      config = true,
    },
    {
      "tzachar/cmp-tabnine",
      build = "./install.sh",
      config = function()
        local tabnine = require("cmp_tabnine.config")
        tabnine:setup({
          max_lines = 1000,
          max_num_results = 4,
          sort = true,
          run_on_every_keystroke = true,
          snippet_placeholder = "**",
          show_prediction_strength = false,
        })
      end,
    },
    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
      -- optionally, override the default options:
      config = function()
        require("tailwindcss-colorizer-cmp").setup({
          color_square_width = 2,
        })
      end
    },
    "L3MON4D3/LuaSnip",
    "buschco/nvim-cmp-ts-tag-close",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  opts = require("custom.cmp"),
}
