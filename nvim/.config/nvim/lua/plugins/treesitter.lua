Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-treesitter"

return {
  -- 4.- Treesitter modules

  {
    "nvim-treesitter/" .. plugin, -- parsing to the end of time
    enabled = Is_Enabled(plugin),
    event = "VimEnter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-context",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = function(_, opts)
      if Use_Defaults(plugin) then
        opts = opts
      else
        opts = {
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
          playground = {
            enable = true,
            disable = {},
            updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
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
        }
      end
    end,
  },
}
