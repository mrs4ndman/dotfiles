Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-markdown-preview"

return {
  "davidgranstrom/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = { "MarkdownPreview" },
  ft = { "markdown" },
  keys = {
    { "<leader>md", "<cmd>MarkdownPreview<CR>", desc = "Toggle MD preview" },
  },
  config = function()
    vim.g.nvim_markdown_preview_theme = "solarized-dark"
  end
}
