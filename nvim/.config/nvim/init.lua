-- Plugins?
require("mrsandman.bootstrap")
require("mrsandman.lazy")

-- Language-specific configs
require("langs")

-- Some autocmds and settings
require("core.autocmds")
require("core.set")
require("core.keymaps")

-- Custom plugin configs that load after most things
require("custom")
