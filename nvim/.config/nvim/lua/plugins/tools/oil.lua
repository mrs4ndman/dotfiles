Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "oil.nvim"

return {
  "stevearc/" .. plugin,
  enabled = Is_Enabled(plugin),
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Oil",
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {
        columns = {
          "icon",
          "size",
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
        view_options = {
          show_hidden = false,
          is_hidden_file = function(name, bufnr)
            return vim.startswith(name, ".")
          end,
        },
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
    end
  end,
}
