local Customize = {}

Customize = {
    -- Plugin toggles for troubleshooting

    plugins = {
        ["FixCursorHold.nvim"] = { enabled = true },
        ["LuaSnip"] = { enabled = true },
        ["alpha-nvim"] = { enabled = true, defaults = false },
        ["aerial.nvim"] = { enabled = true, defaults = false },
        ["auto-session"] = { enabled = true, defaults = false },
        ["better-escape.nvim"] = { enabled = false, defaults = false},
        ["cellular-automaton.nvim"] = { enabled = true },
        ["Comment.nvim"] = { enabled = true, defaults = false },
        ["nvim-cokeline"] = { enabled = true, defaults = false },
        ["dracula.nvim"] = { enabled = true, defaults = false },
        ["dressing.nvim"] = { enabled = true, defaults = false },
        ["fzf"] = { enabled = true },
        ["fluoromachine.nvim"] = { enabled = true, defaults = false },
        ["gitsigns.nvim"] = { enabled = true, defaults = false },
        ["glow.nvim"] = { enabled = true, defaults = true },
        ["heirline.nvim"] = { enabled = false, defaults = false },
        ["harpoon"] = { enabled = true, defaults = false },
        ["inlay-hints.nvim"] = { enabled = true },
        ["inc-rename.nvim"] = { enabled = true, defaults = false },
        ["indent-blankline.nvim"] = { enabled = true },
        ["lualine.nvim"] = { enabled = true, defaults = false },
        ["last-color.nvim"] = { enabled = true, defaults = true },
        ["mason.nvim"] = { enabled = true, defaults = false },
        ["mason-lspconfig.nvim"] = { enabled = true, defaults = false },
        ["mason-nvim-dap.nvim"] = { enabled = true, defaults = false },
        ["mason-null-ls.nvim"] = { enabled = true, defaults = false },
        ["material.nvim"] = { enabled = true, defaults = false },
        ["neodev.nvim"] = { enabled = true },
        ["neon"] = { enabled = true },
        ["noice.nvim"] = { enabled = true, defaults = false },
        ["nightfox.nvim"] = { enabled = true, defaults = false },
        ["nord.nvim"] = { enabled = true },
        ["nordic.nvim"] = { enabled = true },
        ["nui.nvim"] = { enabled = true },
        ["null-ls.nvim"] = { enabled = true },
        ["nvim-autopairs"] = { enabled = true, defaults = false },
        ["nvim-bqf"] = { enabled = true },
        ["nvim-cmp"] = { enabled = true, defaults = false },
        ["nvim-dap"] = { enabled = true },
        ["nvim-dap-go"] = { enabled = true },
        ["nvim-dap-python"] = { enabled = true },
        -- ["nvim-dap-ruby"] = { enabled = true },
        ["nvim-dap-ui"] = { enabled = true, defaults = false },
        ["nvim-dap-virtual-text"] = { enabled = true },
        ["nvim-genghis"] = { enabled = true },
        ["nvim-jdtls"] = { enabled = true },
        ["nvim-lightbulb"] = { enabled = false, defaults = false },
        ["nvim-lspconfig"] = { enabled = true, defaults = false },
        ["nvim-navic"] = { enabled = true },
        ["nvim-neoclip.lua"] = { enabled = true, defaults = false },
        ["nvim-notify"] = { enabled = true },
        ["nvim-surround"] = { enabled = true },
        ["nvim-treesitter"] = { enabled = true },
        ["nvim-web-devicons"] = { enabled = true },
        ["one-small-step-for-vimkind"] = { enabled = true },
        ["overlength.nvim"] = { enabled = true },
        ["onedarkpro.nvim"] = { enabled = true, defaults = false },
        ["onenord.nvim"] = { enabled = true, defaults = false },
        ["oxocarbon.nvim"] = { enabled = true },
        ["plenary.nvim"] = { enabled = true },
        ["popup.nvim"] = { enabled = true },
        ["rnvimr"] = { enabled = true, defaults = false },
        ["rust-tools.nvim"] = { enabled = true },
        ["tabout.nvim"] = { enabled = true, defaults = false },
        ["telescope.nvim"] = { enabled = true },
        ["telescope-dap.nvim"] = { enabled = true },
        ["telescope-fzf-native.nvim"] = { enabled = true },
        ["telescope-ui-select.nvim"] = { enabled = true },
        ["trouble.nvim"] = { enabled = true, defaults = false },
        ["todo-comments.nvim"] = { enabled = true, defaults = false },
        ["tokyonight.nvim"] = { enabled = true, defaults = false },
        ["twilight.nvim"] = { enabled = true, defaults = false },
        ["typescript.nvim"] = { enabled = true },
        ["undotree"] = { enabled = true },
        ["vim-be-good"] = { enabled = true },
        ["vim-commentary"] = { enabled = true },
        ["vim-fugitive"] = { enabled = true },
        -- ["vim-go"] = { enabled = true }, -- TODO: Look for alternatives
        ["vim-illuminate"] = { enabled = true },
        ["vim-lastplace"] = { enabled = true },
        ["vim-matchquote"] = { enabled = true },
        ["vim-sleuth"] = { enabled = true },
        ["vim-tmux"] = { enabled = true },
        ["vim-tmux-navigator"] = { enabled = true },
        ["vim-vinegar"] = { enabled = true },
        ["vscode.nvim"] = { enabled = true, defaults = false },
        ["which-key.nvim"] = { enabled = true },
        ["zen-mode.nvim"] = { enabled = true, defaults = false },
        -- [""] = { enabled = true },
        -- [""] = { enabled = true },
    },

    debuggers = {
        ["bash"] = { enabled = true },
        ["dart"] = { enabled = false },
        ["go"] = { enabled = true },
        ["haskell"] = { enabled = false },
        ["java"] = { enabled = true },
        ["lua"] = { enabled = true },
        ["python"] = { enabled = true },
        ["ruby"] = { enabled = false },
        ["rust"] = { enabled = true },
        -- [""] = { enabled = true },
    },
}

return Customize