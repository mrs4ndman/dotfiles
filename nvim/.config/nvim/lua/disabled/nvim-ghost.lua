Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-ghost.nvim"

return {
  "subnut/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = false,
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- vim-ghost autocmds
    vim.api.nvim_create_augroup("nvim_ghost_user_autocommands", { clear = false })
    vim.api.nvim_create_autocmd(
      "User", {
        pattern = { "www.reddit.com", "www.stackoverflow.com", "www.github.com", "*github.com" },
        command = "setfiletype markdown",
        group = "nvim_ghost_user_autocommands",
      })
  end
}
