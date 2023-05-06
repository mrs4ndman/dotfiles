-- Main Keybind config file: Other keybinds are in their own .lua config files
-- MrSandman config / Forked from ThePrimeagen's NVIM 0 to LSP video & GitHub

-- Key thing: Mapleader as Space

vim.g.mapleader = " "


-- LEADER Keybinds (Space for this config)

-- Source current config file

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { silent = true })

-- Buffer previous and next

vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>", { noremap = true, silent = true })

-- Treesitter context bindings:
vim.keymap.set("n", "<leader>ct", "<cmd>TSContextToggle<CR>", { silent = true })

-- Try it out if you're that desperate: 
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", { silent = true })

-- Netrw start 
vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, { silent = true })

-- Overlength toggle
vim.keymap.set("n", "<leader>ol", ":OverlengthToggle<CR>", { silent = true })

-- RNVIMR / ranger toggle
vim.keymap.set("n", "<leader>r", ':RnvimrToggle<CR>', ( { silent = true, noremap = true} ))

-- Substitutor for current word:
vim.keymap.set("n", "<leader>s",[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set files to be executable:
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Packer Sync shortcut
vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>", { noremap = true, silent = true })

-- greatest remap ever,  replace current selection with paste buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Terminal testing
-- vim.keymap.set("n", "<leader>t1", ":ToggleTerm size=20 direction=horizontal<CR>")
-- vim.keymap.set("n", "<leader>t2", ":ToggleTerm size=60 direction=vertical<CR>")
-- vim.keymap.set("n", "<leader>t3", ":ToggleTerm size=40 direction=horizontal<CR>")


-- CTRL Keybinds

-- Quitting and saving exit

vim.keymap.set("n", "<C-q>", ":q!<CR>", { silent = true})
vim.keymap.set("n", "<C-w>", ":w<CR>", { silent = true})

-- Half-page jumping

vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })


-- NORMAL mode Keybinds

-- Appending line below to current line ("lil J")

vim.keymap.set("n", "J", "mzJ'z", { silent = true})

-- Keeping my cursor in the middle when searching

vim.keymap.set("n", "n", "nzzzv", { silent = true})
vim.keymap.set("n", "N", "Nzzzv", { silent = true})

-- No-do

vim.keymap.set("n", "Q", "<nop>")


-- INSERT mode Keybinds

-- How to escape Vim Insert mode: keybind edition:

vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })


-- VISUAL mode Keybinds

-- Moving around text on visual

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Sessionizer (to be configured)
-- vim.keymap.set("n", "C-f", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

