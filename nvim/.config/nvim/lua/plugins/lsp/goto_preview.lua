Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "goto-preview"

return {
  "rmagatti/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    ["gp"] = { name = "LSP Previews" },
    { "gpd", desc = "Preview Definitions" },
    { "gpt", desc = "Preview Type Definitions" },
    { "gpi", desc = "Preview Implementations" },
    { "gpr", desc = "Preview References" },
    { "gP", desc = "Preview Close All" },
  },
  config = function()
    require("goto-preview").setup {
      width = 80,
      height = 30,
      default_mappings = true,
      opacity = 5,
      resizing_mappings = true,
      references = {
        telescope = require("telescope.themes").get_ivy(),
      },
      focus_on_open = true,
      force_close = true,
      stack_floating_preview_windows = true,
      preview_window_title = { enable = true, position = "right" },
    }
  end
}
