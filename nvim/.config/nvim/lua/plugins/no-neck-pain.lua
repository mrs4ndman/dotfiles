Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "no-neck-pain.nvim"

return {
  "shortcuts/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
      "<leader>np",
      "<leader>nh",
      "<leader>nl",
      "<leader>ns",
  },
  version = "*",
  opts = {
    autocmds = {
      reloadOnColorSchemeChange = true,
    },
    mappings = {
      enabled = true,
      toggle = "<leader>np",
      widthUp = "<leader>nh",
      widthDown = "<leader>nl",
      scratchPad = "<leader>ns",
    },
    buffers = {
      setNames = true,
      scratchPad = {
        enabled = true,
        location = "~/Documents/",
      },
      right = {
        enabled = false,
      },
      bo = {
        filetype = "md",
      },
    },
    integrations = {
      NeoTree = {
        position = "left",
        reopen = true,
      },
    },
  },
}
