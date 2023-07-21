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
    vim.cmd([[
 " Multiple autocommands can be specified like so -
 augroup nvim_ghost_user_autocommands
 autocmd User www.reddit.com,www.stackoverflow.com setfiletype markdown
 autocmd User www.reddit.com,www.github.com setfiletype markdown
 autocmd User *github.com setfiletype markdown
 augroup END
]])
    vim.g.nvim_ghost_super_quiet = 1
  end
}
