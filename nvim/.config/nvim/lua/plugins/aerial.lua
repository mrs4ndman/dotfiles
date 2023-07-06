Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "aerial.nvim"
return {

  "stevearc/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "AerialToggle",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = function(_, opts)
    if Use_Defaults(plugin) then
      opts = opts
    else
      opts = {
        backends = { "treesitter", "lsp", "markdown", "man" },

        layout = {
          max_width = { 40, 0.2 },
          width = nil,
          min_width = 10,

          default_direction = "prefer_right",
          preserve_equality = false,
          placement = "window",
        },
        attach_mode = "window",
        close_automatic_events = { "unsupported", "unfocus" },
        lazy_load = true,
        disable_max_lines = 20000,
        filter_kind = {
          "Class",
          "Constructor",
          "Enum",
          "Function",
          "Interface",
          "Module",
          "Method",
          "Struct",
        },
        highlight_closest = true,
        highlight_on_hover = true,
        autojump = true,
        ignore = {
          unlisted_buffers = true,
          buftypes = "special",
          wintypes = "special",
        },
        nerd_font = "auto",
        open_automatic = false,
        post_jump_cmd = "normal! zz",

        lsp = {
          diagnostics_trigger_update = true,
          update_when_errors = true,
          update_delay = 300,
        },
        treesitter = { update_delay = 200 },
        markdown = { update_delay = 400 },
        man = { update_delay = 500 },
      }
    end
  end,
}
