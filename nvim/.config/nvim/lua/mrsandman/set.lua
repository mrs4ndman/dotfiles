-- NVIM terminal config
--
-- Set default terminal mode to insert & remove line numbers in terminal buffers
vim.cmd("autocmd! TermOpen * startinsert")

vim.cmd([[
augroup Terminal
    autocmd!
    autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
]])


-- Ensure we land on normal mode after terminal

vim.cmd([[
    augroup LeavingTerminal
    autocmd! 
    autocmd TermLeave <silent> <Esc>
    augroup end
]])

-- Remove padding in terminal
vim.api.nvim_command('autocmd TermOpen * setlocal signcolumn=no')

-- Highlight yanking action for a second
vim.api.nvim_command("au TextYankPost * silent! lua vim.highlight.on_yank {timeout = 50}")

-- General config
-- Clipboard
vim.api.nvim_command('set clipboard+=unnamedplus')

-- Highlight bracket pairs
vim.api.nvim_command('set showmatch')

-- Don't show status in cmdline
vim.api.nvim_command('set noshowmode')


-- VIM OPTIONS

-- Cursor config
vim.opt.guicursor = ""

-- Type-writer mode = ON xD
vim.opt.scrolloff = 8

-- Sidebar & tab config
-- Numbers config
vim.opt.nu = true
vim.opt.relativenumber = true

-- Tab config
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- No text wrapping
vim.opt.wrap = false

-- Vim indenting
vim.opt.smartindent = true

-- Keep the sign column open
vim.opt.signcolumn = "yes"

-- Search tweaks, highlighting and included search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Terminal colors
vim.opt.termguicolors = true

-- Update time
vim.opt.updatetime = 50

-- Set nvim timeout
vim.opt.timeoutlen = 2000

-- Color columns
vim.opt.colorcolumn = "80"


-- NVIM Plugin set zone

-- NVIM-TREE CONFIG
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- RNVIMR CONFIG
vim.g.rnvimr_ex_enable = 0
vim.g.rnvimr_enable_bw = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_bw_enable = 1
vim.g.rnvimr_bw_restore_screen_on_close = 1
vim.g.rnvimr_draw_border = 1
vim.g.rnvimr_pick_enable = 1
vim.g.rnvimr_pick_create = 0
vim.g.rnvimr_enable_treesitter = 1

-- netrw config
-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0

-- Undotree & NVIM integration config:
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- NVIM Notify plugin
vim.notify = require("notify")

-- Provider disabling config
vim.g.loaded_perl_provider = 0

