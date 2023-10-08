-- Neovim Core Config
vim.loader.enable() -- Experimental loader for Lua
require("core")

-- Plugins?
require("mrsandman.bootstrap")
require("mrsandman.lazy")

-- Custom plugin configs that load after most things
require("custom")
