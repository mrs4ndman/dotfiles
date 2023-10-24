-- Keybindings
require("custom.which-key")

-- Colorschemes
-- last-color plugin
local theme = require("last-color").recall() or "tokyonight"
vim.cmd(("colorscheme %s"):format(theme))
