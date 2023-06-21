-- Separate per-plugin config file directory
require("plugins")

-- Main config file
require("mrsandman")

-- Custom plugin configs that load after most things
require("custom")

-- Language-specific configs
require("langs")
