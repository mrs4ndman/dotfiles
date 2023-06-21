
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

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>dt"] = { require("dapui").toggle, "Toggle DAP", { silent = true } },
    ["<leader>db"] = { "<cmd>DapToggleBreakpoint<CR>", "Toggle Breakpoint", { silent = true } },
    ["<leader>dq"] = { "<cmd>DapTerminate<CR>", "Terminate DAP" },
    ["<leader>do"] = { "<cmd>DapStepOver<CR>", "DAP Step-Over" },
})
