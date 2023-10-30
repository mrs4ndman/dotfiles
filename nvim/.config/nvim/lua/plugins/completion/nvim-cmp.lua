Customize = require("mrsandman.customize")
Is_Enabled = require("mrsandman.functions").is_enabled

local plugin = "nvim-cmp"

return {
  "mrs4ndman/" .. plugin,
  event = "InsertEnter",
  -- event = { "InsertEnter", "CmdlineEnter" },
  enabled = Is_Enabled(plugin),
  dependencies = {
    -- Completion sources
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    -- "amarakon/nvim-cmp-buffer-lines",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "hrsh7th/cmp-nvim-lsp",
    "petertriho/cmp-git",
    -- {
    -- BUG: Report omnifunc autotrigger to the repo
    --   "micangl/cmp-vimtex",
    --   ft = "tex",
    -- },
    "kdheepak/cmp-latex-symbols",
    "hrsh7th/cmp-omni",
    "f3fora/cmp-spell",
    -- Icons
    "onsails/lspkind.nvim",
    {
      "Exafunction/codeium.nvim",
      dependencies = "nvim-lua/plenary.nvim",
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
      end,
    },
    {
      "kristijanhusak/vim-dadbod-completion",
      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "sql", "mysql", "plsql" },
          callback = function()
            ---@diagnostic disable-next-line: undefined-field
            require("cmp").setup.buffer({
              sources = {
                { name = "vim-dadbod-completion" },
                { name = "luasnip" },
                { name = "buffer" },
              },
            })
          end,
        })
      end,
    },
    "L3MON4D3/LuaSnip",
    "buschco/nvim-cmp-ts-tag-close",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  opts = require("custom.cmp"),
}
