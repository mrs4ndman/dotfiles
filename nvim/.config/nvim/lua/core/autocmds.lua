-- AUTOCMDS for various things
-- Correct syntax highlighting inside netrw
vim.cmd([[
  autocmd BufEnter * if &ft == 'netrw' | setlocal syntax=netrw | endif
]])

-- Hide line numbers on Lazy buffers
vim.cmd("autocmd! filetype lazy setlocal nonumber norelativenumber")

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
  print("Clearing registers")
  vim.cmd([[
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
    call setreg(r, [])
    endfor
    ]])
end

-- Clearing the registers?
vim.api.nvim_create_user_command("ClearReg", function()
  ClearReg()
end, {})
vim.keymap.set("n", "<leader>cr", "<cmd>ClearReg<CR>", { desc = "Clear registers" })
