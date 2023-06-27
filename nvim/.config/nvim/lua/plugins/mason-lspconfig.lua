Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "mason-lspconfig.nvim"

return {
    "williamboman/" .. plugin,
    enabled = Is_Enabled(plugin),
    cmd = { "LspInstall", "LspUninstall" },
    config = function()
        require("mason-lspconfig").setup {
        ensure_installed = {
            -- Language servers automagically installed
            'lua_ls',
            'vimls',
            'marksman',
            'clangd',
            'neocmake',
            'html',
            -- 'hls',
            'cssls',
            'eslint',
            'tsserver',
            'bashls',
            'ansiblels',
            'dockerls',
            'yamlls',
            'ruff_lsp',
            'rust_analyzer',
            'ruby_ls',
            'pylsp',
            'gopls',
            'jdtls',
            'jsonls',
        },
        automatic_installation = true,
    }
    end
}
