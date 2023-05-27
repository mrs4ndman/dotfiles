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
-- INCLUDES LSP BASE CONFIG, TMUX CONFIG, AUTOPAIRS, 

-- Plugin loader optimization:
'lewis6991/impatient.nvim', -- speed go brr
{ "folke/neodev.nvim", opts = {} }, -- initial setup / loadtime


-- 1.- Telescope config

{
    'nvim-telescope/telescope.nvim', tag = '0.1.1', -- good ole telescope
    dependencies = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
    }
},


-- 2.- Load Telescope native extensions,

{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
'nvim-telescope/telescope-file-browser.nvim',
'nvim-telescope/telescope-ui-select.nvim',


-- 3.- Theme plugin config

{ 'rose-pine/neovim', name = 'rose-pine' },
-- cool light dark colors


-- 4.- Treesitter modules

'nvim-treesitter/nvim-treesitter',

'nvim-treesitter/playground', -- hehe

'nvim-treesitter/nvim-treesitter-context',


-- 5.- External integration: Git, tmux, ranger & fzf, also remembers where I was in the buffer

'christoomey/vim-tmux-navigator', -- tmux integration

'tmux-plugins/vim-tmux', -- tmux integration x2

'junegunn/fzf', -- Fuzzy searching integration

'lewis6991/gitsigns.nvim', -- Git signs on the gutter

"AckslD/nvim-neoclip.lua", -- Bob likes to yank :)


-- tpope plugins
--
'tpope/vim-fugitive', -- Git integration

'tpope/vim-surround', -- The power of surroundings

'tpope/vim-commentary', -- Powerful commenting, thanks to tpope

'tpope/vim-eunuch', -- Shell commands inside Vim

'tpope/vim-vinegar', -- Native Ex gets extensions


'farmergreg/vim-lastplace', -- Remembers where i left off the buffer

'kevinhwang91/rnvimr', -- Terminal file manager integration

-- 6.- ThePrimeagen plugins (Blazingly Fast)

'ThePrimeagen/vim-be-good', -- Vim & Neovim keybind training

'ThePrimeagen/harpoon', -- Reeling those files in

'mbbill/undotree', -- What was that thing I did 10 days ago? Leader + U

-- Goofy stuff:
'eandrju/cellular-automaton.nvim',

-- Rust babyyyy
'simrat39/rust-tools.nvim',

-- Golang poweeeer
'fatih/vim-go',

-- Debugging
'mfussenegger/nvim-dap',
'rcarriga/nvim-dap-ui',



-- 7.- UI customization
--
-- Status / buffer lines
'nvim-lualine/lualine.nvim', -- Best statusline for nvim in Lua

({
    'willothy/nvim-cokeline', -- Addicted to this stuff
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require('cokeline').setup()
    end
}),


-- Overlength, and CSS color show

'lcheylus/overlength.nvim', -- Overlength, just that

'ap/vim-css-color', -- Frontend stuff



-- 8.- LSP Configuration
{
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'hrsh7th/cmp-buffer'},   -- Optional
    {'hrsh7th/cmp-path'},     -- Optional
    -- Lua Snippets
    {'saadparwaiz1/cmp_luasnip'},       -- Optional
    {'rafamadriz/friendly-snippets'},   -- Optional
    {'L3MON4D3/LuaSnip'},               -- Required
  }
},

-- 9.- Autopairs & tabout for tabbing out of said pairs


"windwp/nvim-autopairs",


-- Lua tabout finally working

{
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
               -- {open = ':', close = ':'} -- Rust maybe?
            },
            ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
            exclude = {} -- tabout will ignore these filetypes
        }
    end,
    dependencies = {'nvim-treesitter'}, -- or require if not used so far
},


-- 10.- Zen mode with Space + zz / zZ

"folke/zen-mode.nvim", -- Pure concentration


-- 11.- Trouble: Diagnostics and status tool:
{
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" },
 opts = {
  -- your configuration comes here
  -- or leave it empty to use the default settings
  -- refer to the configuration section below
 },
},


-- 1X.- Devicons for rnvimr & telescope 
'ryanoasis/vim-devicons',
'nvim-tree/nvim-web-devicons',


}

require("lazy").setup(plugins, opts)
-- eof --
