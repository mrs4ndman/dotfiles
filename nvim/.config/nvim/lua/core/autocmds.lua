-- AUTOCMDS for various things
-- Set default terminal mode to insert & remove line numbers in terminal buffers
vim.cmd([[
  augroup Terminal
    " autocmd!
    autocmd! TermOpen * setlocal nonu nornu signcolumn=no
    autocmd! TermOpen * startinsert
  augroup END
]])
-- TEST: Don't really know why this isn't working

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

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "lazy",
--   callback = function()
--     local previous = not require("lsp_lines").toggle()
--     if not previous then
--       require("lsp_lines").toggle()
--     end
--   end
-- })

-- Fix for :Telescope oldfiles leaving me in insert mode
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})

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
