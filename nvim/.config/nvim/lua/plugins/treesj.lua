local tsj = require('treesj')

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>bt"] = { require('treesj').toggle, "Toggle TS node", { silent = true } },
})

local lang_utils = require('treesj.langs.utils')
local langs = {
    go = {
        require('treesj.langs.go')
    }
}

tsj.setup({

    use_default_keymaps = false,

    check_syntax_error = true,

    max_join_length = 150,

    cursor_behaviour = 'hold',

    notify = true,

    dot_repeat = true,
})
