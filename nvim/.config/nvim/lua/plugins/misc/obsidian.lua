Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "obsidian.nvim"

return {
  "epwalsh/" .. plugin,
  enabled = Is_Enabled(plugin),
  lazy = true,
  event = { "BufReadPre ~/Documents/Obsidian Vaults/**.md" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mrs4ndman/nvim-cmp",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    dir = "~/Documents/Obsidian Vaults",
    notes_subdir = "new_notes",
    completion = {
      nvim_cmp = true,
      min_chars = 2,
      new_notes_location = "notes_subdir",
    },
    follow_url_func = function(url)
      vim.fn.jobstart({"xdg-open", url})
    end,
    open_app_foreground = true,
    finder = "telescope.nvim",
  },
  config = function(_, opts)
    require("obsidian").setup(opts)
    vim.keymap.set("n", "gf", function()
      if require("obisidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end, { noremap = false, expr = true })
  end,
}
