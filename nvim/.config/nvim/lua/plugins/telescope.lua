Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "telescope.nvim"
return {
  -- 1.- Telescope config

  {
    "nvim-telescope/" .. plugin,
    enabled = Is_Enabled(plugin),
    cmd = "Telescope",
    tag = "0.1.2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "nvim-telescope/telescope-fzf-native.nvim",
      -- "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = function(_, opts)
      if Use_Defaults(plugin) then
        opts = opts
      else
        opts.pickers = {
          colorscheme = {
            enable_preview = true,
          },
          find_files = {
            find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
            theme = "ivy",
          },
        }
        opts.defaults = {
          preview = { timeout = 500 },
          theme = "dropdown",
          vimgrep_arguments = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--hidden",
          },
          sort_mru = true,
          sorting_strategy = "ascending",
          color_devicons = true,
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
            horizontal = {
              width_padding = 0.04,
              height_padding = 0.1,
            },
            vertical = {
              width_padding = 0.05,
              height_padding = 1,
            },
          },
          border = true,
          prompt_prefix = "   ",
          hl_result_eol = false,
          results_title = "",
          winblend = 20,
          wrap_results = true,
          hidden = true,
          mappings = {
            i = {
              ["<C-n>"] = require("telescope.actions").cycle_history_next,
              ["<C-p>"] = require("telescope.actions").cycle_history_prev,
              ["<C-c>"] = require("telescope.actions").close,
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
            n = {
              ["<C-n>"] = require("telescope.actions").cycle_history_next,
              ["<C-p>"] = require("telescope.actions").cycle_history_prev,
              ["<C-c>"] = require("telescope.actions").close,
            },
          },
        }
      end
    end,
  },
}
