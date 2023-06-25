
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
        ft = "rust",
    },
    {
        "saecki/crates.nvim",
        ft = "rust",
        dependencies = {"nvim-lua/plenary.nvim"},
        config = function()
            require("crates").setup()
        end
    },

    -- Java?
    { "mfussenegger/nvim-jdtls",         lazy = true,              ft = "java" },

    -- Golang poweeeer
    { "fatih/vim-go",                    lazy = true,              ft = { "go", "gomod", "gosum" } },

    -- Typescript
    {
        "jose-elias-alvarez/typescript.nvim",
        ft = "typescript",
    },

    -- {
    --     "pmizio/typescript-tools.nvim",
    --     dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    --     opts = {},
    -- }

    -- Python?
    {
        "mfussenegger/nvim-dap-python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        ft = "python",
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
            {
                "folke/which-key.nvim",
                optional = true,
                opts = {
                    defaults = {
                        ["<leader>d"] = { name = "+debug" },
                        ["<leader>da"] = { name = "+adapters" },
                    },
                },
            },
            {
                "theHamsta/nvim-dap-virtual-text",
                opts = {},
            },
            {
                "jay-babu/mason-nvim-dap.nvim",
                dependencies = "williamboman/mason.nvim",
                cmd = { "DapInstall", "DapUninstall" },
                opts = {
                    automatic_installation = false,
                    handlers = {},
                    ensure_installed = {
                        -- DAP
                        'bash-debug-adapter',
                        -- 'codelldb',
                        'debugpy',
                        'js-debug-adapter',
                        'go-debug-adapter',
                    },
                }
            },
            {
                "rcarriga/nvim-dap-ui",
                keys = {
                    { "<leader>du", function() require("dapui").toggle({ }) end, desc = "DAP UI" },
                    { "<leader>de", function() require("dapui").eval() end, desc = "DAP Eval", mode = {"n", "v"} },
                },
                opts = {},
                config = function(_, opts)
                    local dap = require("dap")
                    local dapui = require("dapui")

                    dap.listeners.after.event_initialized["dapui_config"] = function()
                        dapui.open()
                    end

                    dap.listeners.before.event_terminated["dapui_config"] = function()
                        dapui.close()
                    end

                    dap.listeners.after.event_exited["dapui_config"] = function()
                        dapui.close()
                    end
                end
            },
        },
        event = "VeryLazy",
        config = function()
            vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
        end
    },
}
