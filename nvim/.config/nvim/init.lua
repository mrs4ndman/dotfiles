-- Main config
require("mrsandman.bootstrap")
require("mrsandman.lazy")

require("mrsandman.autocmds")
require("mrsandman.keymaps")
require("mrsandman.set")

-- Custom plugin configs that load after most things
require("custom")

-- Language-specific configs
require("langs")
