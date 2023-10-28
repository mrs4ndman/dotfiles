local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

return {
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
        "cbfmt",
        "shfmt",
        "stylua",
        "prettierd",
        "commitlint",
        "clang-format",
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
        "ltex-ls",
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
}
