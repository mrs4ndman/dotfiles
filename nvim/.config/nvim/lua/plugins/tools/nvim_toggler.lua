Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-toggler"

return {
  "nguyenvukhang/" .. plugin,
  keys = {
    { "<leader>dt", desc = "Toggle word" },
  },
  config = function()
    vim.keymap.set({ "n", "v" }, "<leader>dt", require("nvim-toggler").toggle)
    require("nvim-toggler").setup({
      inverses = {
        ["true"] = "false",
        ["TRUE"] = "FALSE",
        ["True"] = "False",
        ["yes"] = "no",
        ["on"] = "off",
        ["left"] = "right",
        ["up"] = "down",
        ["!="] = "==",
        ["->"] = "<-",
        ["?"] = "¿",
        ["<"] = ">",
        ["[]"] = "{}",
        ["enabled"] = "disabled",
        ["enable"] = "disable",
        ["active"] = "inactive",
        ["beep"] = "boop",
        ["emacs"] = "shit",
        ["nvim"] = "Visual Studio Code",
      },
      remove_default_keybinds = true,
      remove_default_inverses = true,
    })
  end,
}
