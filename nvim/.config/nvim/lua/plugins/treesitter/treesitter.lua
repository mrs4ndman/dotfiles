Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-treesitter"

return {
  "nvim-treesitter/" .. plugin, -- parsing to the end of time
  enabled = Is_Enabled(plugin),
  cmd = { "TSInstall", "TSUpdate" },
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
      enabled = Is_Enabled("markid"),
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      event = { "BufRead", "BufNewFile" },
      enabled = Is_Enabled("nvim-treesitter-textobjects"),
    },
    {
      "David-Kunz/treesitter-unit",
      config = function()
        vim.keymap.set("x", "iu", ':lua require("treesitter-unit").select()<CR>', { noremap = true, desc = "Inside TS unit" })
        vim.keymap.set("x", "au", ':lua require("treesitter-unit").select(true)<CR>', { noremap = true, desc = "Around TS unit" })
        vim.keymap.set("o", "iu", ':<c-u>lua require"treesitter-unit".select()<CR>', { noremap = true, desc = "Inside TS unit" })
        vim.keymap.set("o", "au", ':<c-u>lua require"treesitter-unit".select(true)<CR>', { noremap = true, desc = "Around TS unit" })
      end
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
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = { query = "@function.outer", desc = "Around the function" },
            ["if"] = { query = "@function.inner", desc = "Inside the function" },
            ["ac"] = { query = "@class.outer", desc = "Around the class" },
            ["ic"] = { query = "@class.inner", desc = "Inside the class" },
            ["aC"] = { query = "@comment.outer", desc = "Around the comment" },
            ["iC"] = { query = "@comment.inner", desc = "Inside the comment" },
            ["as"] = { query = "@scope", desc = "Language scope" },
          },
        },
      },
    })
  end,
}
