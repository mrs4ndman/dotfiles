Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "mini.indentscope"
-- Indenting visual marks
return {
  "echasnovski/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("mini.indentscope").setup({
      draw = {
        delay = 25,
        priority = 1,
      },
      mappings = {
        object_scope = "ii",
        object_scope_with_borer = "ai",
        goto_top = "[i",
        goto_bottom = "]i",
      },
      options = {
        border = "both",
        indent_at_cursor = true,
      },
      symbol = "|"
    })
  end
}
