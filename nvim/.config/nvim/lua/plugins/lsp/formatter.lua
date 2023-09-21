Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "formatter.nvim"

return {
  {
    "mhartington/" .. plugin,
    enabled = Is_Enabled(plugin),
    cmd = "Format",
    keys = {
      { "<leader>ff", "<cmd>Format<CR>", desc = "Formatter" },
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
          javascript = { vim.lsp.buf.format({ async = true }) },
        },
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    enabled = Is_Enabled("mason-tool-installer.nvim"),
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        enabled = Is_Enabled("mason.nvim"),
        cmd = "Mason",
        opts = {
          ui = {
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
    },
    config = function()
      require("mason").setup()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Formatters
          "stylua",
          "prettierd",
          -- DAP
          -- 'codelldb',
          "bash-debug-adapter",
          "debugpy",
          "delve",
          "go-debug-adapter",
          "java-debug-adapter",
          "js-debug-adapter",
          "php-debug-adapter",
          "debugpy",
          -- LSPs
          "lua-language-server",
          "vim-language-server",
          "html-lsp",
          "astro-language-server",
          "typescript-language-server",
          "css-lsp",
          "eslint-lsp",
          "intelephense",
          "marksman",
          "clangd",
          "neocmakelsp",
          "json-lsp",
          "python-lsp-server",
          "ruby-lsp",
          "bash-language-server",
          -- 'hls',
          "ansible-language-server",
          "dockerfile-language-server",
          "yaml-language-server",
          "ruff-lsp",
          "rust-analyzer",
          "gopls",
          "jdtls",
        },
        auto_update = true,
        debounce_hours = 2,
      })
    end,
  },
}
