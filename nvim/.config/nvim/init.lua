-- Main config
require("mrsandman.bootstrap")
require("mrsandman.lazy")

require("mrsandman.autocmds")
require("mrsandman.keymaps")

-- Custom plugin configs that load after most things
require("custom")

-- Language-specific configs
require("langs")

-- Fixing my settings at the end
require("mrsandman.set")
