local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "hlargs.nvim"

return {
  "m-demare/" .. plugin,
  keys = "<leader>va",
  -- lazy = false,
  config = function()
    require("hlargs").setup()
    vim.keymap.set({ "n", "v" }, "<leader>va", function()
      require("hlargs").toggle()
    end, { desc = "Toggle args higlight", silent = true })
  end,
}
