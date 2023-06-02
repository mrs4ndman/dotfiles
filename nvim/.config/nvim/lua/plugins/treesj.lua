local tsj = require('treesj')

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
