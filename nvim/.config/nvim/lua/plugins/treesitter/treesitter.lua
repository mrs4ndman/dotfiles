Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-treesitter"

return {
  "nvim-treesitter/" .. plugin, -- parsing to the end of time
  enabled = Is_Enabled(plugin),
  cmd = { "TSInstall", "TSUpdate" },
  event = { "BufRead", "BufNewFile", "BufAdd" },
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      keys = {
        { "<leader>tct", "<cmd>TSContextToggle<CR>", desc = "TS Context Toggle" },
      },
      opts = { mode = "cursor" },
    },
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
    { "David-Kunz/markid", enabled = Is_Enabled("markid") },
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
      end,
    },
    -- {
    --   "nvim-treesitter/playground",
    --   keys = {
    --     { "<leader>ttp", "<cmd>TSPlaygroundToggle<CR>", desc = "TS Playground Toggle" },
    --   },
    --   enabled = Is_Enabled("playground"),
    --   cmd = "TSPlaygroundToggle",
    -- },
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
        "luadoc",
        "markdown",
        "markdown_inline",
        "php",
        "rust",
        "ssh_config",
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
            ["aI"] = { query = "@conditional.outer", desc = "Around the conditional" },
            ["iI"] = { query = "@conditional.inner", desc = "Inside the conditional" },
            ["aL"] = { query = "@loop.outer", desc = "Around the loop" },
            ["iL"] = { query = "@loop.inner", desc = "Inside the loop" },
            ["aC"] = { query = "@comment.outer", desc = "Around the comment" },
            ["iC"] = { query = "@comment.inner", desc = "Inside the comment" },
            ["as"] = { query = "@scope", desc = "Language scope" },
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]f"] = { query = "@function.*", desc = "Next function start" },
            ["]c"] = { query = "@class.*", desc = "Next class start" },

            -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queries.
            -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
            ["]l"] = { query = "@loop.*", desc = "Go to next loop part"},
            ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
          goto_next = {
            ["]I"] = "@conditional.outer",
          },
          goto_previous = {
            ["[I"] = "@conditional.outer",
          },
        },
      },
    })
  end,
}
