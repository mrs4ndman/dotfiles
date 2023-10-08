Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "noice.nvim"

return {
  "folke/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
  },
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts.lsp = {
        progress = {
          enabled = true,
          view = "mini",
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      }
      opts.presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
        lsp_doc_border = false,
      }
      opts.routes = {
        view = "notify",
        filter = { event = "msg_showmode" },
      }
    end
  end,
}
