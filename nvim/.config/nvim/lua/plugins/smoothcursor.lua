Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "SmoothCursor.nvim"

return {
  "gen740/" .. plugin,
  keys = {
    {"<leader>sc", "<cmd>SmoothCursorToggle<cr>", desc = "Toggle Smooth Cursor" }
  },
  config = function()
    require("smoothcursor").setup({
      autostart = false,
      cursor = "󱐋",
      fancy = {
        enable = false, -- enable fancy mode
        head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
        body = {
          { cursor = "󰝥", texthl = "SmoothCursorRed" },
          { cursor = "󰝥", texthl = "SmoothCursorOrange" },
          { cursor = "●", texthl = "SmoothCursorYellow" },
          { cursor = "●", texthl = "SmoothCursorGreen" },
          { cursor = "•", texthl = "SmoothCursorAqua" },
          { cursor = ".",   texthl = "SmoothCursorBlue" },
          { cursor = ".",   texthl = "SmoothCursorPurple" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" }
      },
      flyin_effect = "bottom",
      timeout = 2000,
      speed = 25,
      threshold = 15,
      disable_float_win = true,
      disabled_filetypes = { "lazy", "help", "TelescopePrompt", "Ex", "NeoTree", "alpha"}
    })
  end
}
