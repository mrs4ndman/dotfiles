require("gitsigns").setup {
    signs = {
        add = {
            hl = "DiffAdd",
            text = "+",
            numhl = "GitSignsAddNr",
        },
        change = {
            hl = "DiffChange",
            text = "",
            numhl = "GitSignsChangeNr",
        },
        delete = {
            hl = "DiffDelete",
            text = "_",
            show_count = true,
            numhl = "GitSignsDeleteNr",
        },
        topdelete = {
            hl = "DiffDelete",
            text = "‾",
            show_count = true,
            numhl = "GitSignsDeleteNr",
        },
        changedelete = {
            hl = "DiffChange",
            text = "~",
            show_count = true,
            numhl = "GitSignsChangeNr",
        },
    },
    count_chars = {
        [1] = "",
        [2] = "₂",
        [3] = "₃",
        [4] = "₄",
        [5] = "₅",
        [6] = "₆",
        [7] = "₇",
        [8] = "₈",
        [9] = "₉",
        ["+"] = "",
    },
    numhl = true,
    attach_to_untracked = true,
}
