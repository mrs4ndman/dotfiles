Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "formatter.nvim"

return {
  "mhartington/" .. plugin,
  keys = {
    { "<leader>Ff", "<cmd>Format<CR>" }
  },
  config = function()
    require("formatter").setup({
      logging = false,
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        }
      }
    })
  end

}
