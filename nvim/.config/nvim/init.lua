-- Plugins?
require("mrsandman.bootstrap")
---@diagnostic disable-next-line: different-requires
require("mrsandman.lazy")

-- Some autocmds and settings
require("core.autocmds")
require("core.set")
require("core.keymaps")

-- Custom plugin configs that load after most things
require("custom")
