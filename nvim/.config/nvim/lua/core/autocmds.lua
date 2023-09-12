-- AUTOCMDS for various things
-- Correct syntax highlighting inside netrw
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "netrw" then
      vim.cmd([[setlocal syntax=netrw]])
    end
  end
})

-- Fix for :Telescope oldfiles leaving me in insert mode
vim.api.nvim_create_autocmd("WinLeave", {
  callback = function()
    if vim.bo.ft == "TelescopePrompt" and vim.fn.mode() == "i" then
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "i", false)
    end
  end,
})

-- Highlight yanking action for a second
vim.api.nvim_create_autocmd("TextYankPost",{
  callback = function()
    vim.highlight.on_yank {timeout = 60}
  end
})

-- Create Registry cleaner
local function ClearReg()
  print("Clearing registers")
  vim.cmd([[
    let regs=split('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789/-"', '\zs')
    for r in regs
    call setreg(r, [])
    endfor
    ]])
end

-- Clearing the registers?
vim.api.nvim_create_user_command("ClearReg", function() ClearReg() end, {})
vim.keymap.set("n", "<leader>cr", "<cmd>ClearReg<CR>", { desc = "Clear registers" })
