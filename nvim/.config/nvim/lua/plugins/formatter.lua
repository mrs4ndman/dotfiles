Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "formatter.nvim"

return {
  {
    "mhartington/" .. plugin,
    enabled = Is_Enabled(plugin),
    keys = {
      { "<leader>ff", "<cmd>Format<CR>" },
    },
    config = function()
      require("formatter").setup({
        logging = false,
        filetype = {
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          html = {
            require("formatter.filetypes.html").prettierd,
          },
        },
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    enabled = Is_Enabled("mason-tool-installer.nvim"),
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("mason-tool-installer").setup {
        ensure_installed = {
          "stylua",
          "prettierd",
        },
        auto_update = true,
        debounce_hours = 2,
      }
    end
  },
}
