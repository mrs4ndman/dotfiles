
require('nvim-lightbulb').setup({
    ignore = {},
    sign = {
        enabled = true,
        priority = 10,
    },
})

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>iw"] = { "<cmd>IlluminateToggle<CR>", "Indent-line toggle" },
})
