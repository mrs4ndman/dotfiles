require("dressing").setup({
    input = {
        enabled = true,
        title_pos = "center",
        start_in_insert = false,
        border = "rounded",
        relative = "cursor",
        win_options = {
            winblend = 0,
            wrap = true,
        },
        mappings = {
            n = {
                ["<C-c>"] = "Close",
                ["<Esc>"] = "Close",
                ["<CR>"] = "Confirm",
            },
            i = {
                ["<C-c>"] = "Close",
                ["<CR>"] = "Confirm",
                ["<C-p>"] = "HistoryPrev",
                ["<C-n>"] = "HistoryNext",
            }
        }
    },
    select = {
        enabled = true,
        trim_prompt = true,
        win_options = {
            winblend = 0,
            wrap = true,
        },
        mappings = {
            ["<Esc>"] = "Close",
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
        },
    }
})


