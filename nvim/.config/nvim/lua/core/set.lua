-- VIM OPTS

-- Clipboard
vim.api.nvim_command("set clipboard+=unnamedplus")

-- Cursor config
vim.opt.guicursor = ""

-- Cursorline, statusline and scrolling
vim.wo.cursorline = true
vim.wo.cursorlineopt = "both"
vim.opt.smoothscroll = true
vim.opt.laststatus = 3

vim.opt.showmode = false
vim.opt.laststatus = 3

-- Numbers config
vim.opt.nu = true
vim.opt.relativenumber = true

-- Type-writer mode = ON xD
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Color columns
vim.opt.colorcolumn = "81"

-- Tab config
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
-- vim.opt.list = true
-- vim.opt.listchars = {
--     eol = '⤶',
-- }

-- If I even want to fold
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

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
vim.opt.matchtime = 10

-- Terminal colors
vim.opt.termguicolors = true

-- Update time
vim.opt.updatetime = 50

-- Set nvim timeout
vim.opt.timeoutlen = 500

-- Added auto signs to the signcolumn
vim.opt.signcolumn = "auto:1-4"

-- Disable fold marks
vim.o.foldenable = false

-- NVIM Plugin set zone
-- netrw config
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_silent = 1
vim.g.netrw_fastbrowse = 0

-- undotree and nvim-ghost config
vim.g.undotree_SetFocusWhenToggle = 1
vim.g.nvim_ghost_super_quiet = 1

-- Undotree & NVIM integration config:
vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

-- Max CMP height
vim.o.pumheight = 20

-- Sesssion config
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.opt.sessionoptions = {
  "blank",
  "buffers",
  "curdir",
  "folds",
  "help",
  "tabpages",
  "winsize",
  "winpos",
  "terminal",
  "localoptions",
  -- "globals"
}
