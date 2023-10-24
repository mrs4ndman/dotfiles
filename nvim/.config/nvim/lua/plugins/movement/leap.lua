Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "leap.nvim"

return {
  "ggandor/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufReadPost", "BufNewFile" },
  -- lazy = false,
  dependencies = {
    -- "ggandor/leap-ast.nvim",
    -- {
    --   "ggandor/leap-spooky.nvim",
    --   opts = {
    --     -- Text object hooks
    --     affixes = {
    --       magnetic = { window = "M", cross_window = "m" },
    --       remote = { window = "R", cross_window = "r" },
    --     },
    --     -- Text objects are defined with i/a - obj, instead of riw, raw
    --     prefix = false,
    --     paste_on_ramote_yank = false,
    --   },
    -- },
    -- {
    --   "rasulomaroff/telepath.nvim",
    --   dependencies = "ggandor/leap.nvim",
    --   keys = {
    --     -- you can use your own keys
    --     { "r", function() require("telepath").remote({ restore = true }) end, mode = "o" },
    --     { "R", function() require("telepath").remote({ restore = true, recursive = true }) end, mode = "o" },
    --     { "m", function() require("telepath").remote() end, mode = "o" },
    --     { "M", function() require("telepath").remote({ recursive = true }) end, mode = "o" },
    --   },
    -- },
  },
  config = function()
    require("leap").add_default_mappings()
    require("leap").setup = {
      -- max_phase_one_targets = 50,
      highlight_unlabeled_phase_one_targets = false,
    }
  end,
  keys = {
    {
      "<leader>lp",
      mode = { "n", "x", "o" },
      function()
        local current_window = vim.fn.win_getid()
        require("leap").leap({ target_windows = { current_window } })
        vim.cmd([[:normal zz]])
      end,
      desc = "Bidirectional leap",
    },
    {
      "<leader>la",
      mode = { "n", "x", "o" },
      function()
        local focusable_window_on_tabpage = vim.tbl_filter(function(win)
          return vim.api.nvim_win_get_config(win).focusable
        end, vim.api.nvim_tabpage_list_wins(0))
        require("leap").leap({ target_windows = focusable_window_on_tabpage })
        vim.cmd([[:normal zz]])
      end,
      desc = "Leap on all windows / buffers",
    },
    -- {
    --   "<leader>lt",
    --   mode = { "n", "x", "o" },
    --   function()
    --     local current_window = vim.fn.win_getid()
    --     require("leap-ast").leap({ target_windows = { current_window } })
    --   end,
    --   desc = "Leap Treesitter",
    -- },
  },
}
