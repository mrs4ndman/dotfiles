return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = "williamboman/mason.nvim",
  cmd = { "DapInstall", "DapUninstall" },
  opts = {
    automatic_installation = false,
    handlers = {},
    ensure_installed = {
      -- DAP
      "bash-debug-adapter",
      -- 'codelldb',
      "debugpy",
      "delve",
      "go-debug-adapter",
      "java-debug-adapter",
      "js-debug-adapter",
      "php-debug-adapter",
    },
  },
}
