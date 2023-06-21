return {
    -- 1.- Telescope config

    {
        "nvim-telescope/telescope.nvim",
        event = "VimEnter",
        branch = '0.1.x', -- good ole telescope
        dependencies = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
        },
        cmd = "Telescope",
    },

    -- 2.- Load Telescope native extensions,

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        event = "VeryLazy",
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        event = "VeryLazy",
    },

    "nvim-telescope/telescope-ui-select.nvim",
}

