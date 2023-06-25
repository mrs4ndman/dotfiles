return {
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
        dependencies = "nvim-tree/nvim-web-devicons",
        config = function()
            if vim.o.filetype == "lazy" then
                vim.cmd.close()
                vim.api.nvim_create_autocmd("User", {
                    pattern = "AlphaReady",
                    callback = function()
                        require("lazy").show()
                    end,
                })
            end
        end,
    },
}
