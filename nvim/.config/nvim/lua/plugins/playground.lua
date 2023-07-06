Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "playground"

  return {
    "nvim-treesitter/" .. plugin,
    enabled = Is_Enabled(plugin),
    cmd = "TSPlaygroundToggle",
  }
