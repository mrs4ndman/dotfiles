local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "put_at_end.nvim"

return {
  "rareitems/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    {
      "<leader>;",
      function()
        require("put_at_end").put_semicolon()
      end,
      desc = "Add ; to line end",
    },
    {
      "<leader>,",
      function()
        require("put_at_end").put_comma()
      end,
      desc = "Add , to line end",
    },
    {
      "<leader>.",
      function()
        require("put_at_end").put_period()
      end,
      desc = "Add . to line end",
    },
  },
}
