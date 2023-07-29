-- AUTOCMDS for various things
-- Set default terminal mode to insert & remove line numbers in terminal buffers
vim.cmd([[
  augroup Terminal
    " autocmd!
    autocmd! TermOpen * setlocal nonu nornu signcolumn=no
    autocmd! TermOpen * startinsert
  augroup END
]])
-- TODO: Don't really know why this isn't working

-- Ensure we land on normal mode after terminal

vim.cmd([[
  augroup LeavingTerminal
  autocmd!
  autocmd TermLeave <silent> <Esc>
  augroup end
]])

-- Correct syntax highlighting inside netrw
vim.cmd([[
  autocmd BufEnter * if &ft == 'netrw' | setlocal syntax=netrw | endif
]])

-- Hide line numbers on Lazy buffers
vim.cmd("autocmd! filetype lazy setlocal nonumber norelativenumber")

-- vim.api.nvim_create_autocmd("Filetype", { pattern = { "astro" }, command = "TSEnable highlight" })
-- vim.cmd("autocmd BufRead,BufEnter *.astro set filetype=astro")

-- Autoshow lightbulb for codeactions
-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()]]

-- Highlight yanking action for a second
vim.api.nvim_command("au TextYankPost * silent! lua vim.highlight.on_yank {timeout = 50}")

-- Create Registry cleaner
function ClearReg()
  print('Clearing registers')
  vim.cmd([[
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
    call setreg(r, [])
    endfor
    ]])
end

vim.api.nvim_create_user_command('ClearReg', function()
  ClearReg()
end, {})
vim.keymap.set("n", "<leader>cr", "<cmd>ClearReg<CR>", { desc = "Clear registers" })
