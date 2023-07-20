Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-ghost.nvim"

return {
  "subnut/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.cmd([[
 autocmd nvim_ghost_user_autocommands User www.stackoverflow.com setfiletype markdown 
 " Autocommand for a multiple websites
 autocmd nvim_ghost_user_autocommands User www.reddit.com,www.github.com setfiletype markdown

 " Autocommand for a domain (i.e. github.com)
 autocmd nvim_ghost_user_autocommands User *github.com setfiletype markdown

 " Multiple autocommands can be specified like so -
 augroup nvim_ghost_user_autocommands
 autocmd User www.reddit.com,www.stackoverflow.com setfiletype markdown
 autocmd User www.reddit.com,www.github.com setfiletype markdown
 autocmd User *github.com setfiletype markdown
 augroup END
]])
  end
}
