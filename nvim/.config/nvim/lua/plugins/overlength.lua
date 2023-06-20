require('overlength').setup({
    enabled = true,

    ctermdb = 'darkred',
    bg = '#8B0000',

    textwidth_mode = 2,

    default_overlenght = 80,
    highlight_to_eol = true,
    grace_length = 3,

    disable_ft = { 'qf', 'help', 'man', 'packer', 'Telescope' },
})

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>lt"] = { "<cmd>OverlengthToggle<CR>", "Overlength Toggle", { silent = true }},
})
