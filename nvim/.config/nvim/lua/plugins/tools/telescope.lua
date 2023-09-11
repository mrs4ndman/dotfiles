Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "telescope.nvim"
return {
  "nvim-telescope/" .. plugin,
  enabled = Is_Enabled(plugin),
  dependencies = {
    "nvim-lua/plenary.nvim",
    "barrett-ruth/telescope-http.nvim",
  },
  keys = {
    -- TELESCOPE
    { "<leader>tf",  "<cmd>Telescope find_files<CR>",     desc = "Find files" },
    { "<leader>tb",  "<cmd>Telescope buffers<CR>",        desc = "List buffers" },
    { "<leader>vh",  "<cmd>Telescope help_tags<CR>",      desc = "Help tags" },
    { "<leader>sg",  "<cmd>Telescope grep_string<CR>",    desc = "Fast string grep" },
    { "<leader>tr",  "<cmd>Telescope oldfiles<CR>",       desc = "Recent files" },
    { "<leader>tli", "<cmd>Telescope lsp_incoming_calls", desc = "LSP incoming calls" },
    { "<leader>tlo", "<cmd>Telescope lsp_outgoing_calls", desc = "LSP outgoing calls" },
    {
      "<leader>tg",
      function()
        require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
      end,
      desc = "Grep through files",
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
        buffers = { ignore_current_buffer = true },
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
          "--glob=!{.git,.svn,.hg,.DS_Store,thumbs.db,node_modules,bower_components}",
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
        wrap_results = true,
        hidden = true,
        mappings = {
          i = {
            ["<C-q>"] = require("telescope.actions").send_to_qflist + require("telescope.actions").open_qflist,
            ["<M-q>"] = require("telescope.actions").send_selected_to_qflist + require("telescope.actions").open_qflist,
            ["<C-n>"] = require("telescope.actions").preview_scrolling_down,
            ["<C-p>"] = require("telescope.actions").preview_scrolling_up,
            ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
            ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
            -- ["<M-p>"] = action_layout.toggle_preview,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
            ["<Esc>"] = require("telescope.actions").close,
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
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("http")
    vim.keymap.set("n", "<leader>tH", "<cmd>Telescope http list<CR>", { desc = "HTTP Status codes" })
  end,
}
