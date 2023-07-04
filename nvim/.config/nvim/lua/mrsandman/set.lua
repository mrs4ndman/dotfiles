-- NVIM terminal config
--
-- General config
-- Clipboard
vim.api.nvim_command("set clipboard+=unnamedplus")

-- VIM OPTS

-- Cursor config
vim.opt.guicursor = ""

-- Cursorline
vim.wo.cursorline = true
vim.wo.cursorlineopt = "both"

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = false

-- Numbers config
vim.opt.nu = true
vim.opt.relativenumber = true

-- Type-writer mode = ON xD
vim.opt.scrolloff = 8
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 1

-- Color columns
vim.opt.colorcolumn = "81"

-- Tab config
vim.opt.tabstop = 4
-- vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Vim indenting
vim.opt.smartindent = true
vim.opt.breakindent = true

-- No text wrapping
vim.opt.wrap = false

-- Search tweaks, highlighting and included search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Highlight bracket pairs
vim.opt.showmatch = true

-- bars
vim.opt.showmode = false

-- Terminal colors
vim.opt.termguicolors = true

-- Update time
vim.opt.updatetime = 50

-- Set nvim timeout
vim.opt.timeoutlen = 1000

-- Added auto signs to the signcolumn
vim.opt.signcolumn = "auto"

-- Disable fold marks
vim.o.foldenable = false

-- NVIM Plugin set zone
-- netrw config
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_silent = 1

-- rnvimr config
vim.g.rnvimr_ex_enable = 0
vim.g.rnvimr_enable_bw = 1
vim.g.rnvimr_enable_picker = 1
vim.g.rnvimr_bw_enable = 1
vim.g.rnvimr_bw_restore_screen_on_close = 1
vim.g.rnvimr_draw_border = 1
vim.g.rnvimr_pick_enable = 1
vim.g.rnvimr_pick_create = 0
vim.g.rnvimr_enable_treesitter = 1

-- undotree config
vim.g.undotree_SetFocusWhenToggle = 1

-- Undotree & NVIM integration config:
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- Max CMP height
vim.o.pumheight = 20

vim.notify = require("notify")

-- Sesssion config
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
