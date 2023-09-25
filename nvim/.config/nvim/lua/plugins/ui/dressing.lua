local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "dressing.nvim"

return {
  "stevearc/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "BufReadPost",
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.input = {
        enabled = true,
        title_pos = "center",
        start_in_insert = true,
        border = "rounded",
        relative = "cursor",
        win_options = {
          winblend = 0,
          wrap = true,
        },
        mappings = {
          n = {
            ["<C-c>"] = "Close",
            ["<Esc>"] = "Close",
            ["<CR>"] = "Confirm",
          },
          i = {
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
            ["<C-p>"] = "HistoryPrev",
            ["<C-n>"] = "HistoryNext",
          },
        },
      }
      opts.select = {
        enabled = true,
        trim_prompt = true,
        win_options = {
          winblend = 0,
          wrap = true,
        },
        mappings = {
          ["<Esc>"] = "Close",
          ["<C-c>"] = "Close",
          ["<CR>"] = "Confirm",
        },
      }
    end
    -- local config = {
    --   require("dressing").setup({}),
    -- }
  end,
}
