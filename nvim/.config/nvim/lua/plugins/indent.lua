require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = { 'help', 'markdown' },
    buftype_exclude = { 'terminal', 'alpha', 'nofile' },
    show_trailing_blankline_indent = false,
    char = '┊',
}

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>il"] = { "<cmd>IndentBlanklineToggle<CR>", "Indent-line toggle" },
})
