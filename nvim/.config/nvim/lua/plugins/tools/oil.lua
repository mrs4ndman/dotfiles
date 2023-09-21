Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "oil.nvim"

return {
  "stevearc/" .. plugin,
  enabled = Is_Enabled(plugin),
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<CR>"}
  },
  cmd = "Oil",
  opts = {
    columns = {
      "icon",
      -- "size",
    },
    -- buf_options = {}
    win_options = {
      wrap = true,
      signcolumn = "yes",
      cursorcolumn = true,
      foldcolumn = "0",
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = "n",
    },
    default_file_explorer = false,
    restore_win_options = true,
    use_default_keymaps = true,
    view_options = { show_hidden = true },
    float = {
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = "rounded",
      win_options = {
        winblend = 10,
      },
    },
    silence_netrw_warning = true,
  }
}
