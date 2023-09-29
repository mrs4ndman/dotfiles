Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "no-neck-pain.nvim"

return {
  "shortcuts/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>np", desc = "No Neck Pain" },
    { "<leader>nwu", desc = "No Neck Pain Width Up" },
    { "<leader>nwd", desc = "No Neck Pain Width Down" },
    { "<leader>ns", desc = "No Neck Pain Scratchpad" },
  },
  version = "*",
  opts = {
    autocmds = {
      reloadOnColorSchemeChange = true,
    },
    mappings = {
      enabled = true,
      toggle = "<leader>np",
      widthUp = "<leader>nwu",
      widthDown = "<leader>nwd",
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
