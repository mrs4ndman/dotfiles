-- TODO: Integrate with plugin definition
require('neoclip').setup({
    history = 2000,
    preview = true,
    on_select = {
        move_to_front = false,
        close_telescope = false,
    },
    on_paste = {
        move_to_front = false,
        close_telescope = true,
    },
    keys = {
        telescope = {
            i = {
                select = '<cr>',
                paste = '<c-p',
                paste_behind = '<c-b>',
            },
            n = {
                select = '<cr>',
                paste = 'p',
                paste_behind = 'P',
            },
        },
        fzf = {
            select = 'default',
            paste = 'ctrl-p',
            paste_behind = 'ctrl-b'
        },
    },
})

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>nc"] = { "<cmd>Telescope neoclip<CR>", { desc = "Neoclip toggle", silent = true } },
})
