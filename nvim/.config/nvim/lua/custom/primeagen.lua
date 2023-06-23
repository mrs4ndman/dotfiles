-- HARPOON
require("harpoon")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local term = require("harpoon.term")

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>a"] = { mark.add_file, "Harpoon a file" },
    ["<leader>h"] = { ui.toggle_quick_menu, "Harpoon menu" },

    ["<leader>kn"] = { ui.nav_next, "Harpoon switch next" },
    ["<leader>kp"] = { ui.nav_prev, "Harpoon switch previous" },

    ["<leader>1"] = { function() ui.nav_file(1) end, "Harpoon file", { silent = true } },
    ["<leader>2"] = { function() ui.nav_file(2) end, "Harpoon file", { silent = true } },
    ["<leader>3"] = { function() ui.nav_file(3) end, "Harpoon file", { silent = true } },
    ["<leader>4"] = { function() ui.nav_file(4) end, "Harpoon file", { silent = true } },
    ["<leader>5"] = { function() ui.nav_file(5) end, "Harpoon file", { silent = true } },
    ["<leader>6"] = { function() ui.nav_file(6) end, "Harpoon file", { silent = true } },
    ["<leader>7"] = { function() ui.nav_file(7) end, "Harpoon file", { silent = true } },
    ["<leader>8"] = { function() ui.nav_file(8) end, "Harpoon file", { silent = true } },
    ["<leader>9"] = { function() ui.nav_file(9) end, "Harpoon file", { silent = true } },
    ["<leader>0"] = { function() ui.nav_file(0) end, "Harpoon file", { silent = true } },

    ["<leader>t1"] = { function() term.gotoTerminal(1) end, "Harpoon terminal 1", { silent = true } },
    ["<leader>t2"] = { function() term.gotoTerminal(2) end, "Harpoon terminal 2", { silent = true } },
    ["<leader>t3"] = { function() term.gotoTerminal(3) end, "Harpoon terminal 3", { silent = true } },
    ["<leader>t4"] = { function() term.gotoTerminal(4) end, "Harpoon terminal 4", { silent = true } },
})

-- UNDOTREE
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo-tree Toggle"})

-- Try it out if you're that desperate
vim.keymap.set("n", "<leader>cat", "<cmd>CellularAutomaton make_it_rain<CR>", { desc = "cool stuff", silent = true })
