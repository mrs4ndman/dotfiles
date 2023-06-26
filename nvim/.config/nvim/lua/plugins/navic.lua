Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-navic"

return {
    "SmiteshP/" .. plugin,
    enabled = Is_Enabled(plugin),
    dependencies = "neovim/nvim-lspconfig",
    init = function()
        vim.g.navic_silence = true
    end,
    opts = function(_, opts)
        if Use_Defaults then
            opts = opts
        else
            opts = function()
                return {
                    separator = " > ",
                    highlight = true,
                    depth_limit = 4,
                    lsp = {
                        auto_attach = true,
                    }
                }
            end
        end
    end,
    config = function()
        require("nvim-navic").setup()
    end
}
