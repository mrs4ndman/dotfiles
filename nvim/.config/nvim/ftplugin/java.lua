-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local home = os.getenv("HOME")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local M = {}
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)
-- INFO: For Vue LS
-- M.capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = true

---@diagnostic disable-next-line: missing-fields
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  },
}

local workspace_dir = home .. "/learning/java/" .. project_name
local config = {
  capabilities = M.capabilities,
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    -- 💀
    "java", -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xmx1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",

    "-jar",
    vim.fn.glob(jdtls_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    -- Must point to the                                     Change this to
    -- eclipse.jdt.ls installation                           the actual version

    "-configuration",
    jdtls_path .. "/config_linux",
    -- Must point to the eclipse.jdt.ls installation
    -- Change to one of `linux`, `win` or `mac` depending on your system.

    -- See `data directory configuration` section in the README
    "-data",
    workspace_dir,
    -- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
    --                                               ^^
    --                                               string concattenation in Lua
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    -- bundles = {},
    extendedClientCapabilities = require("jdtls").extendedClientCapabilities,
  },

  settings = {
    java = {},
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require("jdtls").start_or_attach(config)

vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.expandtab = 4
vim.bo.softtabstop = 4
