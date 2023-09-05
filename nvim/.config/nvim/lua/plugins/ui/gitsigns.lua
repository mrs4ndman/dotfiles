Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "gitsigns.nvim"

return {
  "lewis6991/" .. plugin,
  event = { "BufRead", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.signs = {
        add = {
          hl = "DiffAdd",
          text = "+",
          numhl = "GitSignsAddNr",
        },
        change = {
          hl = "DiffChange",
          text = "󰇙",
          numhl = "GitSignsChangeNr",
        },
        delete = {
          hl = "DiffDelete",
          text = "_",
          show_count = true,
          numhl = "GitSignsDeleteNr",
        },
        topdelete = {
          hl = "DiffDelete",
          text = "‾",
          show_count = true,
          numhl = "GitSignsDeleteNr",
        },
        changedelete = {
          hl = "DiffChange",
          text = "~",
          show_count = true,
          numhl = "GitSignsChangeNr",
        },
      }
      opts.count_chars = {
        [1] = "",
        [2] = "₂",
        [3] = "₃",
        [4] = "₄",
        [5] = "₅",
        [6] = "₆",
        [7] = "₇",
        [8] = "₈",
        [9] = "₉",
        ["+"] = "󰎿",
      }
      opts.numhl = true
      opts.attach_to_untracked = true
      opts.trouble = false
    end
  end,

  config = function(_, opts)
    require("gitsigns").setup(opts)
    -- require("scrollbar.handlers.gitsigns").setup()
  end,
}
