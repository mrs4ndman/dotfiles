-- MrSandman config - A mix of ThePrimeagen's + LazyVim + a bit of my own
-- Which-key plugin manages per-plugin keybinds on each plugin's config files

-- Key thing: Mapleader as Space

vim.g.mapleader = " "

-- Lazy and Mason shortcuts
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Lazy", noremap = true, silent = true })
vim.keymap.set("n", "<leader>mp", "<cmd>Mason<CR>", { desc = "Mason", noremap = true, silent = true })

-- Fugitive keybinds
vim.keymap.set("n", "<leader>gs", "<cmd>Git status<CR>", { desc = "FuGITive Status" })
vim.keymap.set("n", "<leader>gd", "<cmd>Git diff<CR>", { desc = "FuGITive Diff" })
-- TODO: Create new Fugitive keybinds

-- Try it out if you're that desperate
vim.keymap.set("n", "<leader>cat", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "cool stuff", silent = true })

vim.keymap.set("n", "<leader>cl", "<cmd>ColorizerToggle<CR>", { desc = "Color picker toggle", silent = true })
-- Number buffer selection with Leader + c + <number>
for i = 1, 9 do
    vim.keymap.set('n', ('<leader>c%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i), { desc = "Change to buffer x", silent = true })
    vim.keymap.set('n', ('<leader>s%s'):format(i), ('<Plug>(cokeline-switch-%s)'):format(i), { desc = "Swap with buffer x", silent = true })
end

-- Trouble config:
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true, desc = "Trouble Toggle"})

vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true, desc = "Trouble Quickfix" })

vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true, desc = "Trouble Loclist" })

vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true, desc = "Trouble Workspace Diagnostics" })

vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true, desc = "Trouble Document Diagnostics" })

vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true, desc = "Trouble LSP References" })

vim.keymap.set("n", "<leader>iw", "<cmd>IlluminateToggle<CR>", { desc = "Word HL toggle"})


local wk = require("which-key")

-- LEADER plugin keybinds (Space for this config)

wk.register({
    -- which-key category entries
    ["Q"] = { name = "TreeSJ" },
    ["<leader>b"] = { name = "[B]uffers" },
    ["<leader>c"] = { name = "Close + TS Context" },
    ["<leader>d"] = { name = "DAP (+ CodeLLDB when active)" },
    ["<leader>f"] = { name = "LSP Format TS Rename Function FML" },
    ["<leader>g"] = { name = "Fu[G]itive" },
    ["<leader>i"] = { name = "[I]ndent[L]ine, Word-repetition" },
    ["<leader>k"] = { name = "Harpoon switching+" },
    ["<leader>l"] = { name = "over[L]eng[T]h, Lazy" },
    ["<leader>n"] = { name = "[N]eo[C]lip" },
    ["<leader>q"] = { name = "Close" },
    ["<leader>s"] = { name = "Cokeline+, Sessions, Alpha" },
    ["<leader>t"] = { name = "Telescope TS Aerial Harpoon ToDo"},
    ["<leader>ta"] = { name = "Aerial" },
    -- ["<leader>tc"] = { name = "[T]o-do [C]omments+"},
    -- ["<leader>tt"] = { name = "[T]reesi[T]ter [P]layground"},
    -- ["<leader>u"] = { name = "[U]ndo-Tree" },
    ["<leader>v"] = { name = "HBAC, LSP, " },
    ["<leader>x"] = { name = "Trouble+" },
    ["<leader>z"] = { name = "[Z]en-Mode / Twilight" },

    -- Custom lua functions: their which-key entries
    ["<leader>th"] = { "<cmd>Themer<CR>", "Colorschme manager", { silent = true } },
})

-- All the plugin keybinds are either with the plugin definition or in the corresponding
-- custom/file.lua


-- INTERNAL KEYBINDS

-- NORMAL mode Keybinds
--
-- Source current config file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { silent = true, desc = "Source current file" })

-- Netrw start
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { desc = "Ex", silent = true })

-- Get me out of here (:D)
vim.keymap.set("n", "<leader><Esc>", "<cmd>quitall<CR>", { desc = "Quit all", silent = true })
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Write all" })

-- Substitutor for current word
vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- indent machine
vim.keymap.set("n", "<leader>ip", "=ap", { desc = "Indent a paragraph", silent = true })

-- Set files to be executable
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })

-- greatest remaps ever,  replace current selection with paste buffer & visual deletion made easy
vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "Better paste :)" })
vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]], { desc = "Better delete" })

-- smart blackhole deletion
vim.keymap.set("n", "dd", function ()
    if vim.fn.getline(".") == "" then return '"_dd' end
    return "dd"
end, {expr = true})

-- Appending line below to current line ("lil J")
vim.keymap.set("n", "J", "mzJ'z", { silent = true })

-- Keeping my cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Delete character without yanking
vim.keymap.set({ "n", "v" }, "x", "\"_x", { silent = true })
vim.keymap.set({ "n", "v" }, "X", "\"_X", { silent = true })

-- Select all
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all" })

-- Yank whole buffer
vim.keymap.set("n", "<leader>ya", "ggVG\"+y", { desc = "Yank whole buffer" })

-- Insert new line above and below and exit
vim.keymap.set("n", "<leader>o", "o<Esc>", { silent = true, desc = "Insert new line below and exit" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { silent = true, desc = "Insert new line above and exit" })

-- Buffer previous, next and close, window closing too
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { noremap = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { noremap = true, silent = true, desc = "Previous buffer"})
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>", { noremap = true, silent = true, desc = "Close buffer softly"})
vim.keymap.set("n", "<leader>cw", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close window one way"})
vim.keymap.set("n", "<leader>q", "<cmd>close<CR>", { noremap = true, silent = true, desc = "Close window the other way"})

-- Delete buffer without saving
vim.keymap.set("n", "<leader>bd", "<cmd>bd!<CR>", { noremap = true, silent = true, desc = "Force buffer close"})


-- Normal mode CTRL Keybinds

-- Half-page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- Invoke sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux sessionizer" })


-- INSERT mode Keybinds

-- How to escape Vim Insert mode: keybind edition:

vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })


-- VISUAL mode Keybinds

-- Moving around text on visual

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- TERMINAL mode keybinds
--
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>te>", ":bd!", { desc = "Exit terminal" })
