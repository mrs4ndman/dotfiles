local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "nvim-autopairs"

return {
  -- 9.- Autopairs & tabout for tabbing out of said pairs
  "windwp/" .. plugin,
  event = { "BufRead", "BufNewFile" },
  enabled = Is_Enabled(plugin),
  opts = { check_ts = true }
}
