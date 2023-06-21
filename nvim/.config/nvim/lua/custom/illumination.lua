
require('nvim-lightbulb').setup()

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>iw"] = { "<cmd>IlluminateToggle<CR>", "Indent-line toggle" },
})
-- require('nvim-lightbulb').get_status_text()
