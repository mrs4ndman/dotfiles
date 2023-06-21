
return {
    -- 9.- Autopairs & tabout for tabbing out of said pairs

    "airblade/vim-matchquote",

    {
        "windwp/nvim-autopairs",
        event = { "BufReadPost", "BufNewFile" },
        opts = {},
    },


    -- Lua tabout finally working

    {
        "abecodes/tabout.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" }, -- parsing to the end of time
        event = "InsertEnter",
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>',
                backwards_tabkey = '<S-Tab>',
                act_as_tab = true,
                act_as_shift_tab = false,
                enable_backwards = true,
                completion = true,
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' },
                    { open = '<', close = '>' },
                    -- {open = ':', close = ':'} -- Rust maybe?
                },
                ignore_beginning = true,
                exclude = {}
            }
        end,
    },
}

