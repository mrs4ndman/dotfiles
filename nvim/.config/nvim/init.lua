-- Main config
require("mrsandman.bootstrap")
require("mrsandman.lazy")

require("mrsandman.autocmds")

-- Custom plugin configs that load after most things
require("custom")
require("mrsandman.keymaps")

-- Language-specific configs
require("langs")

-- Fixing my settings at the end
require("mrsandman.set")
