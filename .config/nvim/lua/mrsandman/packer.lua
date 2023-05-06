-- Mr Sandman's .lua config for NVIM (NOT FINISHED) PACKER.lua


vim.cmd [[packadd packer.nvim]] -- the doom begins

return require('packer').startup(function(use)

-- Packer can manage itself
use 'wbthomason/packer.nvim' -- c'mon, do your thing

-- MAIN PLUGIN CONFIG
-- INCLUDES LSP BASE CONFIG, TMUX CONFIG, AUTOPAIRS, 

-- Plugin loader optimization:
use 'lewis6991/impatient.nvim' -- speed go brr


-- 1.- Telescope config

use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1', -- good ole telescope
    requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
    }
}


-- 2.- Load Telescope native extensions

use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
use 'nvim-telescope/telescope-file-browser.nvim'
use 'nvim-telescope/telescope-ui-select.nvim'


-- Telescope external extensions

use 'cljoly/telescope-repo.nvim' --telescope extension #1, the others are inside telescope.lua
use 'rcarriga/nvim-notify' -- telescope extension #2, cool neovim notis


-- 3.- Theme plugin config

use({ 'rose-pine/neovim', -- cool light dark colors
as = 'rose-pine',
config = function()
    vim.cmd('colorscheme rose-pine')
end
})


-- 4.- Treesitter modules

use {'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true})
    ts_update()
end,} -- colors go brr

use 'nvim-treesitter/playground' -- hehe

use 'nvim-treesitter/nvim-treesitter-context'


-- 5.- External integration: Git, tmux, ranger & fzf, also remembers where I was in the buffer

use 'christoomey/vim-tmux-navigator' -- tmux integration

use 'tmux-plugins/vim-tmux' -- tmux integration x2

use 'junegunn/fzf' -- Fuzzy searching integration

use 'lewis6991/gitsigns.nvim' -- Git signs on the gutter

use 'tpope/vim-fugitive' -- Git integration

use 'tpope/vim-surround' -- The power of surroundings

use 'tpope/vim-commentary' -- Powerful commenting, thanks to tpope

use 'farmergreg/vim-lastplace' -- Remembers where i left off the buffer

use 'kevinhwang91/rnvimr' -- Terminal file manager integration


-- 6.- ThePrimeagen plugins (Blazingly Fast)

use 'ThePrimeagen/vim-be-good' -- Vim & Neovim keybind training

use 'ThePrimeagen/harpoon' -- Reeling those files in

use 'mbbill/undotree' -- What was that thing I did 10 days ago? Leader + U

-- Goofy stuff:
use 'eandrju/cellular-automaton.nvim'


-- 7.- UI customization
--
-- Status / buffer lines
use 'nvim-lualine/lualine.nvim' -- Best statusline for nvim in Lua

use ({
    'willothy/nvim-cokeline', -- Addicted to this stuff
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
        require('cokeline').setup()
    end
})


-- Notifications and CSS color show

use 'lcheylus/overlength.nvim' -- Overlength, just that

use 'ap/vim-css-color' -- Frontend stuff


-- 7.1.- UX: Dashboard on startup config

use {
    'glepnir/dashboard-nvim', -- Startup screen for nvim
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            -- config
        }
    end,
    requires = {'nvim-tree/nvim-web-devicons'}
}

use 'nvim-tree/nvim-tree.lua'


-- 8.- LSP Configuration
use {
    'VonHeikemen/lsp-zero.nvim', -- Big boi LSP
    branch = 'v2.x',
    requires = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},         -- Required
        {
        'williamboman/mason.nvim',         -- Optional
        run = function()
            pcall(vim.cmd, 'MasonUpdate')
        end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-buffer'},   -- Optional
    {'hrsh7th/cmp-path'},     -- Optional
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    -- Lua Snippets
    {'saadparwaiz1/cmp_luasnip'},       -- Optional
    {'rafamadriz/friendly-snippets'},   -- Optional
    {'L3MON4D3/LuaSnip'},               -- Required
}
}


-- 9.- Autopairs & tabout for tabbing out of said pairs

use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
}


-- Lua tabout finally working

use {
    'abecodes/tabout.nvim',
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
                {open = '::', close = '::'} -- Rust maybe?
            },
            ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
            exclude = {} -- tabout will ignore these filetypes
        }
    end,
    wants = {'nvim-treesitter'}, -- or require if not used so far
}


-- 10.- Zen mode with Space + zz / zZ

use "folke/zen-mode.nvim" -- Pure concentration


-- 11.- Trouble: Diagnostics and status tool:

use ({
    "folke/trouble.nvim", -- woops
    config = function()
        require("trouble").setup {
            icons = false,
            -- your configuration comes here
            -- or leave it empty to use the default settings
        }
    end
})


-- 1X.- Devicons for rnvimr & telescope 
use 'ryanoasis/vim-devicons'
use 'nvim-tree/nvim-web-devicons'


end)
-- eof --
