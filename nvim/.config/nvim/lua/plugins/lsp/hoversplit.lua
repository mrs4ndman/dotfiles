local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "hoversplit.nvim"

return {
  "roobert/" .. plugin,
  keys = {
    { "<localleader>hh", desc = "Docs h-split focused" },
    { "<localleader>hv", desc = "Docs V-split focused" },
    { "<localleader>hH", desc = "Docs h-split" },
    { "<localleader>hV", desc = "Docs v-split" },
  },
  config = function()
    require("hoversplit").setup({
      key_bindings = {
        split_remain_focused = "<localleader>hh",
        vsplit_remain_focused = "<localleader>hv",
        split = "<localleader>hH",
        vsplit = "<localleader>hV",
      },
    })
  end,
}
