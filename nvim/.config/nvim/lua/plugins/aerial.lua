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
          max_width = { 40, 0.3 },
          width = nil,
          min_width = 10,
          default_direction = "prefer_right",
          preserve_equality = false,
          placement = "window",
        },
        close_automatic_events = { "unsupported", "unfocus" },
        disable_max_lines = 20000,
        highlight_closest = true,
        highlight_on_hover = true,
        autojump = true,
        ignore = {
          unlisted_buffers = true,
        },
        open_automatic = false,
        post_jump_cmd = "normal! zz",
        lsp = {
          diagnostics_trigger_update = true,
          update_when_errors = true,
          update_delay = 700,
        },
        treesitter = { update_delay = 700 },
        markdown = { update_delay = 800 },
        man = { update_delay = 900 },
      }
    end
  end,
}
