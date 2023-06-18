-- Mr Sandman's .lua config for NVIM (NOT FINISHED) PACKER.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {

    -- Packer can manage itself
    -- 'wbthomason/packer.nvim' -- c'mon, do your thing

    -- MAIN PLUGIN CONFIG
    -- INCLUDES LSP BASE CONFIG, TMUX CONFIG, AUTOPAIRS, GIT AND MANY OTHERS

    -- 1.- Telescope config

    {
        'nvim-telescope/telescope.nvim', branch = '0.1.x', -- good ole telescope
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        }
    },


    -- 2.- Load Telescope native extensions,

    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
        event = "VeryLazy",
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        event = "VeryLazy",
    },

    "nvim-telescope/telescope-ui-select.nvim",


    -- 3.- Theme plugins config
    { 'rose-pine/neovim', lazy = true, name = 'rose-pine', priority = 1000 },
    -- the coolest color scheme B)

    { 'folke/tokyonight.nvim', lazy = true, priority = 1000, opts = { } },
    { 'catppuccin/nvim', lazy = true, name = "catppuccin", priority = 1000 },


    -- 4.- Treesitter modules

    {
        "nvim-treesitter/nvim-treesitter", -- parsing to the end of time
        build = ":TSUpdate",
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        lazy = true,
    },

    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
    },

    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPre",
        enabled = true,
        opts = { mode = 'cursor'},
    },

    {
        "Wansmer/treesj",
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        keys = { "n", "<leader>bt", "<cmd>TSJToggle<CR>" }
    },


    -- 5.- External integration: Git, tmux, ranger & fzf, also remembers where I was in the buffer

    "christoomey/vim-tmux-navigator", -- tmux integration

    "tmux-plugins/vim-tmux", -- tmux integration x2

    {
        "junegunn/fzf", -- Fuzzy searching integration
        event = "VeryLazy",
    },

    {
        "AckslD/nvim-neoclip.lua", -- Bob likes to yank :)
        cmd = "Telescope neoclip",
    },

    "kevinhwang91/rnvimr", -- Terminal file manager integration

    {
        "kevinhwang91/nvim-bqf", -- Better Quickfix list
        lazy = true,
    },

    "farmergreg/vim-lastplace", -- Remembers where i left off the buffer

    "max397574/better-escape.nvim", -- Better Esc keybindings

    {
        "axkirillov/hbac.nvim", -- Vacuuming up them buffers
        lazy = true,
    },

    "rmagatti/auto-session", -- Intelligent Neovim session manager


    -- tpope plugins
    --
    {
        "tpope/vim-fugitive", -- Git wrapper
        event = "VeryLazy",
    },

    "tpope/vim-surround", -- The power of surroundings

    "tpope/vim-commentary", -- Powerful commenting, thanks to tpope

    "tpope/vim-sleuth", -- Automatic tabstop and shiftwidth detection

    {
        "tpope/vim-eunuch", -- Shell commands inside Vim
        event = "VeryLazy",
    },
    "tpope/vim-vinegar", -- Native Ex gets extensions


    -- folke plugins
    --
    -- Zen mode with Space + zz / zZ

    {
        "folke/zen-mode.nvim", -- Pure concentration
        event = "VeryLazy",
    },

    -- Trouble: Diagnostics and status tool:
    {
        "folke/trouble.nvim",
        cmd = "TroubleToggle",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },

    { 'folke/which-key.nvim', opts = {} },

    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        opts = {},
    },

    {
        "folke/twilight.nvim",
        event = "VeryLazy",
    },


    -- 6.- ThePrimeagen plugins (Blazingly Fast)

    {
        "ThePrimeagen/vim-be-good", -- Vim & Neovim keybind training
        cmd = "VimBeGood",
    },

    "ThePrimeagen/harpoon", -- Reeling those files in

    "mbbill/undotree", -- What was that thing I did 10 days ago? Leader + U


    -- Goofy stuff:
    {
        "eandrju/cellular-automaton.nvim",
        cmd = "CellularAutomaton",
    },


    -- Language / debugging plugins

    -- Rust babyyyy
    {
        "simrat39/rust-tools.nvim",
        event = "VeryLazy",
    },

    -- Golang poweeeer
    {
        "fatih/vim-go",
        ft = { "go", "gomod", "gosum" }
    },

    -- Debugging

    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            {
                "theHamsta/nvim-dap-virtual-text",
                config = true,
            },
            "williamboman/mason.nvim",
        },
        event = "VeryLazy",
    },

    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = function()
            require("inc_rename").setup()
        end,
    },

    {
        'stevearc/aerial.nvim',
        cmd = "AerialToggle",
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons",
        },
    },


    -- 7.- UI customization
    --
    -- Status / buffer lines
    "nvim-lualine/lualine.nvim", -- Best statusline for nvim in Lua

    ({
        'willothy/nvim-cokeline', -- Addicted to this stuff
        event = "VimEnter",
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function()
            require('cokeline').setup()
        end
    }),

    -- Overlength, and CSS color show
    {
        "lcheylus/overlength.nvim", -- Overlength, just that
        keys = { "n", "<leader>lt", "<cmd>OverlengthToggle<CR>" }
    },

    -- "ap/vim-css-color", -- Frontend stuff
    -- TODO: Find a substitute for this plugin

    -- Indenting visual marks
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
    },

    -- Highlighting instances of words with LSP, Treesitter and Regex matching
    {
        "RRethy/vim-illuminate",
        cmd = "IlluminateToggle",
    },

    -- Ideas for the brain
    {
        'kosayoda/nvim-lightbulb',
        event = 'VeryLazy',
        dependencies = 'antoinemadec/FixCursorHold.nvim',
    },


    -- 8.- LSP Configuration
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        lazy = true,
        dependencies = {
            'neovim/nvim-lspconfig',
            {
                'williamboman/mason.nvim',
                build = function() pcall(vim.cmd, 'MasonUpdate') end,
                config = true,
            },

            'hrsh7th/nvim-cmp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-cmdline',

            'rafamadriz/friendly-snippets',
            'simrat39/inlay-hints.nvim',
        },
    },

    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {},
    },

    'folke/neodev.nvim',

    'lewis6991/gitsigns.nvim',


    -- 9.- Autopairs & tabout for tabbing out of said pairs

    'airblade/vim-matchquote',

    {
        'windwp/nvim-autopairs',
        event = "VimEnter",
    },


    -- Lua tabout finally working

    {
        'abecodes/tabout.nvim',
        dependencies = {'nvim-treesitter'}, -- or require if not used so far
        event = "InsertEnter",
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>', -- Key to tab me out of parenthesis and stuff
                backwards_tabkey = '<S-Tab>', -- key to do backwards tabout, empty string to disable
                act_as_tab = true, -- shift content if tab out is not possible
                act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                enable_backwards = true, -- well ...
                completion = true, -- if the tabkey is used in a completion pum
                tabouts = {
                    {open = "'", close = "'"},
                    {open = '"', close = '"'},
                    {open = '`', close = '`'},
                    {open = '(', close = ')'},
                    {open = '[', close = ']'},
                    {open = '{', close = '}'},
                    {open = '<', close = '>'},
                    -- {open = ':', close = ':'} -- Rust maybe?
                },
                ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                exclude = {} -- tabout will ignore these filetypes
            }
        end,
    },


    -- 10.- Startup screen

    {
        'goolord/alpha-nvim',
        dependencies = 'nvim-tree/nvim-web-devicons',
        event = "VimEnter"
    },


}

require("lazy").setup(plugins, opts)
-- eof --
