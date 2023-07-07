Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "leap.nvim"

return {
  "ggandor/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = false,
  opts = {
    max_phase_one_targets = 0,
    case_sensitive = true,
    max_highlighted_traversal_targets = 15,
  },
  config = function()
    require("leap").add_default_mappings()
    -- Bidirectional leaping
    vim.keymap.set({ "n", "v" }, "<leader>lp", function()
      local current_window = vim.fn.win_getid()
      require("leap").leap({ target_windows = { current_window } })
    end)
    -- All-window leaping
    vim.keymap.set("n", "<leader>la", function()
      local focusable_window_on_tabpage = vim.tbl_filter(function(win)
        return vim.api.nvim_win_get_config(win).focusable
      end, vim.api.nvim_tabpage_list_wins(0))
      require("leap").leap({ target_windows = focusable_window_on_tabpage })
    end)
  end,
}
