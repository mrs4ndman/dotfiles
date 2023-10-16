Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "neo-tree.nvim"

return {
  "nvim-neo-tree/" .. plugin,
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = { { "<leader>pt", "<cmd>Neotree<CR>", desc = "Neo-Tree" } },
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    -- enable_diagnostics = true,
    default_component_configs = {
      container = { enable_character_fade = true },
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "|",
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "󰜌",
      },
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted = "✖", -- this can only be used in the git_status source
          renamed = "󰁕", -- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "󰄱",
          staged = "",
          conflict = "",
        },
      },
    },
    commands = {},
    window = {
      position = "left",
      width = 30,
      mapping_options = { noremap = true, nowait = true },
      mappings = { ["<C-c>"] = "close_window", ["<Esc>"] = "close_window" },
    },
    nesting_rules = {},
    filesystem = {
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      follow_current_file = true,
      group_empty_dirs = true,
      hijack_netrw_behavior = "disabled",
    },
    buffers = {
      follow_current_file = true,
      group_empty_dirs = true,
      show_unloaded = true,
    },
  },
}
