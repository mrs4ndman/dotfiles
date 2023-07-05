return {
  -- 4.- Treesitter modules

  {
    "nvim-treesitter/nvim-treesitter", -- parsing to the end of time
    event = { "BufReadPost", "BufNewFile" },
    -- build = function()
    --   require("nvim-treesitter.install").update({ with_sync = true })
    -- end,
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        init = function()
          require("lazy.core.loader").disable_rtp_plugin("nvim-treesitter-textobjects")
          load_textobjects = true
        end,
      },
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = {
          "astro",
          "bash",
          "c",
          "cmake",
          "cpp",
          "css",
          "diff",
          "fish",
          "gitignore",
          "go",
          "gomod",
          "gosum",
          "gowork",
          "html",
          "http",
          "java",
          "javascript",
          "jsdoc",
          "jsonc",
          "json",
          "lua",
          "luap",
          "markdown",
          "markdown_inline",
          "meson",
          "ninja",
          "nix",
          "norg",
          "org",
          "php",
          "python",
          "query",
          "regex",
          "rust",
          "scss",
          "sql",
          "svelte",
          "tsx",
          "typescript",
          "toml",
          "vim",
          "vimdoc",
          "yaml",
          "zig",
        },

        sync_install = false,

        auto_install = true,

        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },

        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<M-space>",
          },
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },
        },

        playground = {
          enable = true,
          disable = {},
          updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      })
    end,
  },

  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    enabled = true,
    opts = { mode = "cursor" },
  },

  {
    "Wansmer/treesj",
    cmd = "TSJToggle",
    opts = {
      use_default_keymaps = false,
      check_syntax_error = false,
      max_join_length = 300,
      cursor_behaviour = "hold",
      notify = true,
      dot_repeat = true,
    },
  },
}
