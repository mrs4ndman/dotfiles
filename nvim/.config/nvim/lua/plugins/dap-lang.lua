
return {
    -- Language / debugging plugins

    -- Rust babyyyy
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "simrat39/rust-tools.nvim",
        lazy = true,
        ft = "rust",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Java?
    { "mfussenegger/nvim-jdtls",         lazy = true,              ft = "java" },

    -- Golang poweeeer
    { "fatih/vim-go",                    lazy = true,              ft = { "go", "gomod", "gosum" } },

    -- Typescript
    { "jose-elias-alvarez/typescript.nvim" },
    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- }
    -- Python?
    {
        "mfussenegger/nvim-dap-python",
        dependencies = { "mfussenegger/nvim-dap"},
        keys = {
            { "<leader>dPt", function() require("dap-python").test_method() end, desc = "Debug test method" },
            { "<leader>dPc", function() require("dap-python").test_class() end, desc = "Debug test class" },
        },
        config = function()
            local path = require("mason-registry").get_package("debugpy"):get_install_path()
            require("dap-python").setup(path .. "/venv/bin/python")
        end,
    },

    -- Debugging
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            { "theHamsta/nvim-dap-virtual-text", config = true },
        },
        event = "VeryLazy",
    },
    "jay-babu/mason-nvim-dap.nvim",

}
