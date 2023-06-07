-- Main Keybind config file: Other keybinds are in their own .lua config files
-- MrSandman config / Forked from ThePrimeagen's NVIM 0 to LSP video & GitHub

-- Key thing: Mapleader as Space

vim.g.mapleader = " "


-- LEADER Keybinds (Space for this config)

-- Source current config file

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { silent = true })

-- Treesitter context bindings:
vim.keymap.set("n", "<leader>ct", "<cmd>TSContextToggle<CR>", { silent = true })

-- Set files to be executable:
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true })

-- Netrw start 
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { silent = true })

-- Try it out if you're that desperate
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", { silent = true })

--
vim.keymap.set("n", "<leader>il", "<cmd>IndentBlanklineToggle<CR>", { silent = true })

-- Neoclip extension for Telescope
vim.keymap.set("n", "<leader>nc", "<cmd>Telescope neoclip<CR>", { silent = true })

-- Overlength toggle
vim.keymap.set("n", "<leader>lt", ":OverlengthToggle<CR>", { silent = true })

-- Lazy shortcut
vim.keymap.set("n", "<leader>ps", ":Lazy<CR>", { noremap = true, silent = true })

-- RNVIMR / ranger toggle
vim.keymap.set("n", "<leader>r", ":RnvimrToggle<CR>", ( { silent = true, noremap = true} ))

-- Starting dashboard: Alpha
vim.keymap.set("n", "<leader>sp", ":Alpha<CR>", ( { silent = true, noremap = true} ))

-- Hbac: The buffer vacuum
vim.keymap.set("n", "<leader>vo", require("hbac").close_unpinned, { silent = true } )
vim.keymap.set("n", "<leader>pb", require("hbac").toggle_pin, { silent = true } )

-- Session management
vim.keymap.set("n", "<leader>ss", ":SessionSave<CR>", { desc = "Saved current session" })
vim.keymap.set("n", "<leader>sr", ":SessionRestore<CR>", { desc = "Restore session for CWD" })
vim.keymap.set("n", "<leader>sd", ":SessionDelete<CR>", { desc = "Saved current session" })

-- Todo list management
vim.keymap.set("n", "<leader>nt", require("todo-comments").jump_next)
vim.keymap.set("n", "<leader>pt", require("todo-comments").jump_prev)
vim.keymap.set("n", "<leader>td", "<cmd>TodoQuickFix<CR>", { silent = true })

-- Treesitter split toggle with TreeSJ
vim.keymap.set("n", "<leader>bt", require('treesj').toggle)


-- Telescope bindings
local builtin = require('telescope.builtin')

-- Keymaps

vim.keymap.set('n', '<leader>tf', builtin.find_files, {})
vim.keymap.set('n', '<leader>tg', builtin.git_files, {})
vim.keymap.set('n', '<leader>tb', builtin.buffers, {})
vim.keymap.set('n', '<leader>ts', function()
	builtin.grep_string({
        search = vim.fn.input("Grep > "),
    });
end)
vim.keymap.set('n', '<leader>tl', builtin.loclist, {} )
vim.keymap.set('n', '<leader>to', builtin.oldfiles )
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

--
-- NORMAL mode Keybinds
--
-- Substitutor for current word:
vim.keymap.set("n", "<C-s>",[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- greatest remaps ever,  replace current selection with paste buffer & visual deletion made easy
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set({"n", "v"}, "<leader>dd", [["_d]])

-- Delete character without yanking
vim.keymap.set({"n", "v"}, "x", "\"_x", { silent = true })
vim.keymap.set({"n", "v"}, "X", "\"_X", { silent = true })

-- Select all
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all" })

-- Yank whole buffer
vim.keymap.set("n", "<leader>ya", "ggVG\"+y", { desc = "Yank whole buffer" })

-- Insert new line above and below and exit
vim.keymap.set("n", "<leader>o", "o<Esc>", { silent = true, desc = "Insert new line below and exit" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { silent = true, desc = "Insert new line above and exit" })

-- Buffer previous, next and close
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>", { noremap = true, silent = true })

-- Delete buffer & Delete buffer without saving
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", "<cmd>bd!<CR>", { noremap = true, silent = true })

-- CTRL Keybinds

-- Half-page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- Invoke sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

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
