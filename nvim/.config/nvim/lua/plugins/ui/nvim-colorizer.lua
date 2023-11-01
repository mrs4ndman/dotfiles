Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-colorizer.lua"

return {
  "NvChad/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<localleader>c", "<cmd>ColorizerToggle<CR>", desc = "Color picker toggle" },
  },
  config = function()
    require("colorizer").setup({
      filetypes = {
        "css",
        "scss",
        "html",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "php",
        "markdown",
        "yaml",
        "tmux",
        lua = {
          names = false,
        },
      },
      user_default_options = {
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
        tailwind = true,
      },
    })
  end,
}
