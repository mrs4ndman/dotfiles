
return {
    -- 6.- ThePrimeagen plugins (Blazingly Fast)

    {
        "ThePrimeagen/vim-be-good", -- Vim & Neovim keybind training
        cmd = "VimBeGood",
    },

    {
        "ThePrimeagen/harpoon", -- Reeling those files in
        event = "VimEnter",
        opts = {
            global_settings = {
                save_on_toggle = true,
            },
        },
    },

    {
        "mbbill/undotree",      -- What was that thing I did 10 days ago? Leader + U
        cmd = "UndotreeToggle",
    },

    -- Goofy stuff:
    { "eandrju/cellular-automaton.nvim", cmd = "CellularAutomaton" },
}
