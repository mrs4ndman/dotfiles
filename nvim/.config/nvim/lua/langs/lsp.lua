require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            }
        }
    }
})
require("lspconfig").rust_analyzer.setup{}
