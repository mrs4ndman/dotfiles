return {
    -- tpope plugins
    --
    {
        "tpope/vim-fugitive", -- Git wrapper
        event = { "BufReadPost", "BufNewFile" },
    },

    -- "tpope/vim-surround",   -- The power of surroundings

    "tpope/vim-commentary", -- Powerful commenting, thanks to tpope

    {
        "tpope/vim-sleuth", -- Automatic tabstop and shiftwidth detection
        event = { "BufReadPost", "BufNewFile" },
    },

    {
        "tpope/vim-vinegar", -- Native Ex gets extensions
        event = "VimEnter",
    },
}
