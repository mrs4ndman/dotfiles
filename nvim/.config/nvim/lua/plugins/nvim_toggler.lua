Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-toggler"

return {
  "nguyenvukhang/" .. plugin,
  keys = {
    { "<leader>dt", desc = "Toggle this status" },
  },
  config = function()
    vim.keymap.set({ "n", "v" }, "<leader>dt", require("nvim-toggler").toggle)
    require("nvim-toggler").setup({
      inverses = {
        ["vim"] = "Visual Studio Code",
        ["on"] = "off",
        ["true"] = "false",
        ["active"] = "inactive",
        ["beep"] = "boop",
      },
      remove_default_keybinds = true,
    })
  end,
}
