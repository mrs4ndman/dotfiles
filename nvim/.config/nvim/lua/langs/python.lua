local navic = require("nvim-navic")
require("lspconfig").pylsp.setup {
    on_attach = function(client, bufnr)
        navic.atatch(client, bufnr)
    end
}

