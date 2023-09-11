local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "shade.nvim"

return {
  "sunjon/shade.nvim",
  enabled = Is_Enabled(plugin),
  keys = {
    { "<C-Up>", desc = "[Shade] Turn shade up"},
    { "<C-Down>", desc = "[Shade] Turn shade down"},
    { "<localleader>b", desc = "[Shade] Toggle shade"},
  },
  config = function()
    require("shade").setup({
      overlay_opacity = 40,
      opacity_step = 1,
      keys = {
        brightness_up = "<C-Up>",
        brightness_down = "<C-Down>",
        toggle = "<localleader>b",
      },
    })
  end,
}
