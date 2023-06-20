-- MrSandman config - A mix of ThePrimeagen's + LazyVim + a bit of my own
-- Which-key plugin manages per-plugin keybinds on each plugin's config files

-- Key thing: Mapleader as Space

vim.g.mapleader = " "


-- LEADER plugin keybinds (Space for this config)

-- Treesitter context and playground bindings
vim.keymap.set("n", "<leader>ct", "<cmd>TSContextToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>ttp", "<cmd>TSPlaygroundToggle<CR>", { silent = true })

-- Try it out if you're that desperate
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>", { silent = true })

-- Indentline toggle
vim.keymap.set("n", "<leader>il", "<cmd>IndentBlanklineToggle<CR>", { silent = true })

-- Illuminate the word instances
vim.keymap.set("n", "<leader>iw", "<cmd>IlluminateToggle<CR>", { silent = true })

-- Overlength toggle
vim.keymap.set("n", "<leader>lt", "<cmd>OverlengthToggle<CR>", { silent = true })

-- Lazy shortcut
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { noremap = true, silent = true })

-- Neoclip extension for Telescope
vim.keymap.set("n", "<leader>nc", "<cmd>Telescope neoclip<CR>", { silent = true })

-- RNVIMR / ranger toggle
vim.keymap.set("n", "<leader>r", "<cmd>RnvimrToggle<CR>", ({ silent = true, noremap = true }))

-- Rename identifiers with LSP
vim.keymap.set("n", "<leader>fr", ":IncRename ")

-- Hbac: The buffer vacuum
vim.keymap.set("n", "<leader>vp", require("hbac").toggle_pin, { silent = true })
vim.keymap.set("n", "<leader>vo", require("hbac").close_unpinned, { silent = true })

-- Todo list management
vim.keymap.set("n", "<leader>tcn", require("todo-comments").jump_next)
vim.keymap.set("n", "<leader>tcp", require("todo-comments").jump_prev)
vim.keymap.set("n", "<leader>td", "<cmd>TodoQuickFix<CR>", { silent = true })

-- Twilight keybinds
vim.keymap.set("n", "<leader>zt", "<cmd>Twilight<CR>")

-- Fugitive keybinds
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gd", vim.cmd.Git_diff);
-- TODO: Create new Fugitive keybinds


local wk = require("which-key")

wk.register({
    -- which-key category entries
    ["<leader>b"] = { name = "Buffers + TreeSJ" },
    ["<leader>d"] = { name = "DAP +" },
    ["<leader>k"] = { name = "Harpoon switching" },
    ["<leader>s"] = { name = "Harpoon + Sessions + " },
    ["<leader>t"] = { name = "Telescope, Aerial + ToDo" },
    ["<leader>ta"] = { name = "Aerial" },

    -- Custom lua functions: their which-key entries
    ["<leader>th"] = { ":lua colorizer()<CR>", "Colorizer", { silent = true } },
})




-- INTERNAL KEYBINDS

-- NORMAL mode Keybinds
--
-- Source current config file
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end, { silent = true })

-- Netrw start
vim.keymap.set("n", "<leader>e", vim.cmd.Ex, { silent = true })

-- Get me out of here (:D)
vim.keymap.set("n", "<leader><Esc>", "<cmd>quitall<CR>", { silent = true })
vim.keymap.set("n", "<leader>w", "<cmd>write<CR>")

-- Substitutor for current word
vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set files to be executable
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true })

-- greatest remaps ever,  replace current selection with paste buffer & visual deletion made easy
vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]])

-- Appending line below to current line ("lil J")
vim.keymap.set("n", "J", "mzJ'z", { silent = true })

-- Keeping my cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- No-do
vim.keymap.set("n", "Q", "<nop>")

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
vim.keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>cw", "<cmd>close<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>close<CR>", { noremap = true, silent = true })

-- Delete buffer without saving
vim.keymap.set("n", "<leader>bd", "<cmd>bd!<CR>", { noremap = true, silent = true })


-- Normal mode CTRL Keybinds

-- Half-page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- Invoke sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


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
vim.keymap.set("n", "<leader>te>", ":bd!")
