Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults
-- local action_layout = require("telescope.actions.layout")

local plugin = "telescope.nvim"
return {
  "nvim-telescope/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "Telescope",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- TELESCOPE
    { "<leader>tf", require("telescope.builtin").find_files,  desc = "Find files" },
    { "<leader>tg", require("telescope.builtin").git_files,   desc = "Git files" },
    { "<leader>tb", require("telescope.builtin").buffers,     desc = "List buffers" },
    { "<leader>tr", require("telescope.builtin").oldfiles,    desc = "Recent files" },
    { "<leader>tl", require("telescope.builtin").loclist,     desc = "Proyect loclist" },
    { "<leader>vh", require("telescope.builtin").help_tags,   desc = "Help tags" },
    { "<leader>sg", require("telescope.builtin").grep_string, desc = "Fast string grep" },
    {
      "<leader>ts",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end,
      desc = "Grep through files"
    },
  },
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.pickers = {
        colorscheme = { enable_preview = true },
        find_files = {
          find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git", "--strip-cwd-prefix" },
          theme = "ivy",
        },
      }
      opts.defaults = {
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
          horizontal = { width_padding = 0.04, height_padding = 0.1 },
          vertical = { width_padding = 0.05, height_padding = 1 },
        },
        border = true,
        prompt_prefix = "   ",
        hl_result_eol = false,
        -- results_title = "",
        winblend = 10,
        wrap_results = true,
        hidden = true,
        mappings = {
          i = {
            ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
            ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
            ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
            -- ["<M-p>"] = action_layout.toggle_preview,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
          n = {
            -- ["<M-p>"] = action_layout.toggle_preview,
            ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
            ["<M-s>"] = require("telescope.actions").file_split,
            ["<M-v>"] = require("telescope.actions").file_vsplit,
          },
        },
      }
    end
  end,
}
