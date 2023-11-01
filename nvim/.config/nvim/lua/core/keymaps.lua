-- MrSandman config - A mix of ThePrimeagen's + LazyVim + a bit of my own
-- Which-key plugin manages per-plugin keybinds on each plugin's config files

-- Key thing: Mapleader as Space

vim.g.mapleader = " "
vim.g.maplocalleader = "ñ"

local func = require("core.functions")

-- Lazy and Mason shortcuts
vim.keymap.set("n", "<leader>lz", "<cmd>Lazy<CR>", { desc = "Lazy", silent = true })
vim.keymap.set("n", "<leader>mp", "<cmd>Mason<CR>", { desc = "Mason", silent = true })

vim.keymap.set("n", "<leader>sb", function()
  require("telescope.builtin").live_grep({ search_dirs = { vim.api.nvim_buf_get_name(0) } })
end, { desc = "Search current buffer" })

-- OBSIDIAN: direct access
-- vim.keymap.set("n", "<leader>nt", "<cmd>!cd $OBSIDIAN_VAULT | e ~/Documents/Obsidian Vaults/Dashboard/Current TO-DO.md<CR>")

-- INTERNAL KEYBINDS
-- NORMAL mode Keybinds

-- Source current config file
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end, { silent = true, desc = "Source current file" })

-- Clear notifications and search
vim.keymap.set("n", "<Esc>", function()
  require("notify").dismiss()
  vim.cmd("Noice dismiss")
  vim.cmd("nohl")
  vim.cmd("nohlsearch")
end, {})

-- Netrw keybind
-- vim.keymap.set("n", "<leader>E", vim.cmd.Ex, { desc = "Ex", silent = true })

-- Window splits and ?tabs?
vim.keymap.set("n", "<leader>wh", "<cmd>split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<CR>", { desc = "Vertical split" })
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", {
  desc = "Make vertical split smaller",
  silent = true,
})
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", {
  desc = "Make vertical split larger",
  silent = true,
})
vim.keymap.set("n", "<A-Up>", ":resize -2<CR>", {
  desc = "Make horizontal split smaller",
  silent = true,
})
vim.keymap.set("n", "<A-Down>", ":resize +2<CR>", {
  desc = "Make horizontal split larger",
  silent = true,
})
for i = 1, 10 do
  vim.keymap.set({ "n", "v" }, "<M-" .. i .. ">", func.tabnm(i), { desc = "Go to tab " .. i})
end

-- Get me out of here (:D)
vim.keymap.set("n", "<leader><Esc>", "<cmd>quitall<CR>", { desc = "Quit all", silent = true })
vim.keymap.set("n", "<leader>ww", "<cmd>write<CR>", { desc = "Write all" })
vim.keymap.set("n", "<leader>wq", "<cmd>wqa<CR>", { desc = "Bye :D" })

-- Substitutor for current word
vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gIc<Left><Left><Left><Left>]])

-- indent machine
vim.keymap.set("n", "<leader>ip", "=ap", { desc = "Indent a paragraph", silent = true })
vim.keymap.set("n", "<leader>il", "==", { desc = "Indent current line" })

-- Set files to be executable
vim.keymap.set("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { desc = "Make file executable", silent = true })

-- greatest remaps ever,  replace current selection with paste buffer & visual deletion made easy
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Better paste :)" })
vim.keymap.set({ "n", "v" }, "<leader>dd", [["_d]], { desc = "Better delete" })

-- Enable custom mappings for 1-9 yank-paste-delete registers
local alphabet = "abcdefghijklmnopqrstuvwxyz"

for i = 1, #alphabet do
  local letter = alphabet:sub(i, i)

  vim.keymap.set({ "n", "v" }, ("<leader>y%s"):format(letter), ([["%sy]]):format(letter), { desc = ("%s"):format(letter) .. " register yank" })
  vim.keymap.set({ "n", "v" }, ("<leader>p%s"):format(letter), ([["%sp]]):format(letter), { desc = ("%s"):format(letter) .. " register paste" })
end

-- smart blackhole deletion
vim.keymap.set("n", "dd", function()
  ---@diagnostic disable-next-line: param-type-mismatch
  if vim.fn.getline(".") == "" then
    return '"_dd'
  end
  return "dd"
end, { expr = true })

vim.keymap.set("v", "D", function()
  ---@diagnostic disable-next-line: unused-local
  local l, c = unpack(vim.api.nvim_win_get_cursor(0))
  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, l - 1, l, true)) do
    if line:match("^%s*$") then
      return '"_d'
    end
  end
  return "d"
end, { desc = "Visual smart d", expr = true })

-- Yank only to nvim clipboard
vim.keymap.set({ "n", "v" }, "<leader>yy", [[""y]])
vim.keymap.set({ "n", "v" }, "<leader>pp", [[""p]])

-- Appending line below to current line ("lil J")
vim.keymap.set("n", "J", "mzJ'z", { silent = true })

-- Keeping my cursor in the middle when searching
vim.keymap.set("n", "n", "nzzzv", { silent = true })
vim.keymap.set("n", "N", "Nzzzv", { silent = true })

-- Center cursor when skipping blocks and spaces
vim.keymap.set("n", "{", "{zzzv", { silent = true })
vim.keymap.set("n", "}", "}zzzv", { silent = true })
vim.keymap.set("n", "(", "(zzzv", { silent = true })
vim.keymap.set("n", ")", ")zzzv", { silent = true })

-- "S" functionality remap for Leap functionality
vim.keymap.set("n", "+", "S")

-- Delete character without yanking
vim.keymap.set({ "n", "v" }, "x", '"_x', { silent = true })
vim.keymap.set({ "n", "v" }, "X", '"_X', { silent = true })

-- Incredible markdown codeblocks:
vim.keymap.set("n", "<leader>C", function()
  if vim.bo.filetype == "markdown" then
    local keys = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
    vim.api.nvim_feedkeys(
      [[i
```

```]],
      "n",
      true
    )
    vim.api.nvim_feedkeys(keys .. [[kkA]], "n", false)
  end
end, { desc = "Codeblock" })

-- Select all
vim.keymap.set("n", "<leader>sa", "ggVG", { desc = "Select all" })

-- Yank whole buffer
vim.keymap.set("n", "<leader>ya", 'ggVG"+y', { desc = "Yank whole buffer" })

-- Insert new line above and below and exit
-- vim.keymap.set("n", "<leader>o", "o<Esc>", { silent = true, desc = "Insert new line below and exit" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { silent = true, desc = "Insert new line above and exit" })
vim.keymap.set("i", "<C-p>", "<Esc>:Telescope oldfiles<CR>")

-- Buffer previous, next and close, window closing too
-- To use without the cokeline bar
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })

-- Delete buffer without saving
vim.keymap.set("n", "<leader>bd", "<cmd>bd!<CR>", { silent = true, desc = "Force buffer close" })
vim.keymap.set("n", "<leader>bc", "<cmd>bd<CR>", { silent = true, desc = "Close buffer softly" })
vim.keymap.set("n", "<leader>q", "<cmd>close<CR>", { silent = true, desc = "Close window the other way" })

local end_strings = {
  ";",
  ",",
  ":",
  ".",
  ")",
  "]",
  "\\",
}
for _, char in ipairs(end_strings) do
  vim.keymap.set("n", "<leader>" .. char, function()
    func.put_at_end(char)
  end, { desc = "Put " .. char .. " at the end of the line" })
end

vim.keymap.set("n", "<leader>-", function()
  func.put_at_beginning("- ")
end, { desc = "Put - at the beginning of the line" })
vim.keymap.set("n", "<leader>*", function()
  func.put_at_beginning("* ")
end, { desc = "Put * at the beginning of the line" })

-- Start recording macro for a given word / selection
vim.keymap.set({ "n", "v"}, "<M-C-q>", func.record_macro, { desc = "Ranged macro"})
-- Replay said macro
vim.keymap.set("n", "<M-C-r>", "n@i", { desc = "Replay ranged macro"})
-- Stop recording said macro
vim.keymap.set({ "i", "v", "n"}, "<M-C-c>", func.confirm_macro, { desc = "Confirm ranged macro"})

-- Normal mode CTRL Keybinds

-- Half-page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

-- Invoke sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "tmux sessionizer" })

-- Lazy terminal
vim.keymap.set("n", "<M-C-J>", function()
  require("lazy.util").float_term()
end, {})

-- Export current state to HTML:
vim.keymap.set("n", "<leader>xth", "<cmd>TOhtml<CR>", { desc = "Export to HTML" })

-- Normal mode ALT keybinds
-- Sidescrolling: Go-Go-Gadget :D
vim.keymap.set("", "<ScrollWheelLeft>", "<Nop>")
vim.keymap.set("", "<ScrollWheelRight>", "<Nop>")
vim.keymap.set("n", "<M-H>", "2<ScrollWheelLeft>")
vim.keymap.set("n", "<M-L>", "2<ScrollWheelRight>")

-- No plz
vim.keymap.set("n", "<C-z>", "<Nop>")

-- INSERT mode Keybinds

-- How to escape Vim Insert mode: keybind edition:
vim.keymap.set("i", "<C-c>", "<Esc>", { silent = true })

-- VISUAL mode Keybinds

-- Moving around text on visual
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true })

-- Better indenting
vim.keymap.set("v", "<", "<gv", { silent = true })
vim.keymap.set("v", ">", ">gv", { silent = true })

-- TERMINAL mode keybinds
vim.keymap.set("t", "<M-C-J>", "<C-\\><C-n>bd!<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader>te>", ":bd!", { desc = "Exit terminal" })
