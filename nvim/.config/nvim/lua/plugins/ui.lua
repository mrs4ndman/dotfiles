return {
    -- 7.- UI customization
    --
    -- Status / buffer lines
    {
        "nvim-lualine/lualine.nvim", -- Best statusline for nvim in Lua
        event = "VeryLazy",
    },

    ({
        "willothy/nvim-cokeline", -- Addicted to this stuff
        event = "VeryLazy",
        dependencies = 'nvim-tree/nvim-web-devicons',
    }),


    -- "ap/vim-css-color", -- Frontend stuff
    -- TODO: Find a substitute for this plugin --
}
