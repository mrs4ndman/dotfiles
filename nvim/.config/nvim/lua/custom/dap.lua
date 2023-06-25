-- DAP Keybinds
-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>db"] = { function() require("dap").toggle_breakpoint() end, "DAP Toggle Breakpoint", { silent = true } },
    ["<leader>dc"] = { function() require("dap").continue() end, "DAP Continue" },
    ["<leader>dC"] = { function() require("dap").run_to_cursor() end, "DAP Run To Cursor" },
    ["<leader>dg"] = { function() require("dap").goto_() end, "DAP Go to line (no execute)" },
    ["<leader>di"] = { function() require("dap").step_into() end, "Step Into" },
    ["<leader>dj"] = { function() require("dap").down() end, "DAP Down" },
    ["<leader>dk"] = { function() require("dap").up() end, "DAP Up" },
    ["<leader>dl"] = { function() require("dap").run_last() end, "DAP Run Last" },
    ["<leader>do"] = { function() require("dap").step_out() end, "DAP Step-Out" },
    ["<leader>dO"] = { function() require("dap").step_over() end, "DAP Step-Over" },
    ["<leader>dp"] = { function() require("dap").pause() end, "DAP Pause" },
    ["<leader>dr"] = { function() require("dap").repl.toggle() end, "DAP Toggle REPL" },
    ["<leader>ds"] = { function() require("dap").session() end, "DAP Session" },
    ["<leader>dt"] = { function() require("dap").terminate() end, "DAP Terminate" },
    ["<leader>dw"] = { function() require("dap.ui.widgets").hover() end, "DAP Widgets" },
})
