local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

local plugin = "cellular-automaton.nvim"
-- Goofy stuff:
return {
    "eandrju/" .. plugin,
    enabled = Is_Enabled(plugin),
    cmd = "CellularAutomaton",
}
