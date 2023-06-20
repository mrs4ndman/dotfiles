local dap = require("dap")
local dapui = require("dapui")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.after.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.keymap.set("n", "<Leader>dt", require("dapui").toggle)
vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<Leader>dq", ":DapTerminate<CR>")
vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")

require("dapui").setup(opts)
