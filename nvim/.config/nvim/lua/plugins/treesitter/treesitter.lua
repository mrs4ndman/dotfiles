Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-treesitter"

return {
  "nvim-treesitter/" .. plugin, -- parsing to the end of time
  enabled = Is_Enabled(plugin),
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      keys = {
        { "<leader>tct", "<cmd>TSContextToggle<CR>", desc = "TS Context Toggle" },
      },
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
    {
      "David-Kunz/markid",
      enabled = Is_Enabled("markid")
    },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "astro",
        "c",
        "cpp",
        "css",
        "gitcommit",
        "gitignore",
        "go",
        "html",
        "java",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "rust",
        "tsx",
        "typescript",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      autotag = { enable = true },
      markid = { enable = true },
    })
  end,
}
