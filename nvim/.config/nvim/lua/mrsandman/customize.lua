local Customize = {}

Customize = {
  -- Plugin toggles for troubleshooting

  plugins = {
    ["FixCursorHold.nvim"] = { enabled = true },
    ["LuaSnip"] = { enabled = true },
    ["alpha-nvim"] = { enabled = true, defaults = false },
    ["aerial.nvim"] = { enabled = true, defaults = false },
    ["auto-session"] = { enabled = true, defaults = false },
    ["better-escape.nvim"] = { enabled = false, defaults = false },
    ["cellular-automaton.nvim"] = { enabled = true },
    ["Comment.nvim"] = { enabled = true, defaults = false },
    ["doom-one.nvim"] = { enabled = true, defaults = false },
    ["dracula.nvim"] = { enabled = true, defaults = false },
    ["dressing.nvim"] = { enabled = true, defaults = false },
    ["fluoromachine.nvim"] = { enabled = true, defaults = false },
    ["gitsigns.nvim"] = { enabled = true, defaults = false },
    ["github-nvim-theme"] = { enabled = true, defaults = true },
    ["glow.nvim"] = { enabled = true, defaults = true },
    ["gruber-darker.nvim"] = { enabled = true, defaults = true },
    ["hardtime.nvim"] = { enabled = true, defaults = false },
    ["harpoon"] = { enabled = true, defaults = false },
    ["heirline.nvim"] = { enabled = false, defaults = false },
    ["horizon.nvim"] = { enabled = true },
    ["hypersonic.nvim"] = { enabled = true, defaults = false },
    ["inlay-hints.nvim"] = { enabled = true },
    ["inc-rename.nvim"] = { enabled = true, defaults = false },
    ["indent-blankline.nvim"] = { enabled = true },
    ["last-color.nvim"] = { enabled = true, defaults = true },
    ["lualine.nvim"] = { enabled = true, defaults = false },
    ["lsp_signature.nvim"] = { enabled = true, defaults = false },
    ["mason.nvim"] = { enabled = true, defaults = false },
    ["mason-lspconfig.nvim"] = { enabled = true, defaults = false },
    ["mason-nvim-dap.nvim"] = { enabled = true, defaults = false },
    ["mason-null-ls.nvim"] = { enabled = true, defaults = false },
    ["material.nvim"] = { enabled = true, defaults = false },
    ["multicursors.nvim"] = { enabled = true, defaults = false },
    ["neodev.nvim"] = { enabled = true },
    ["neon"] = { enabled = true },
    ["neo-tree.nvim"] = { enabled = true },
    ["nightfox.nvim"] = { enabled = true, defaults = false },
    ["noice.nvim"] = { enabled = true, defaults = false },
    ["no-neck-pain.nvim"] = { enabled = true, defaults = false },
    ["nord.nvim"] = { enabled = true },
    ["nordic.nvim"] = { enabled = true },
    ["nui.nvim"] = { enabled = true },
    ["null-ls.nvim"] = { enabled = true },
    ["numb.nvim"] = { enabled = true, defaults = false },
    ["nvim-autopairs"] = { enabled = true, defaults = false },
    ["nvim-bqf"] = { enabled = true },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["nvim-cokeline"] = { enabled = true, defaults = false },
    ["nvim-dap"] = { enabled = true },
    ["nvim-dap-go"] = { enabled = true },
    ["nvim-dap-python"] = { enabled = true },
    -- ["nvim-dap-ruby"] = { enabled = true },
    ["nvim-dap-ui"] = { enabled = true, defaults = false },
    ["nvim-dap-virtual-text"] = { enabled = true },
    ["nvim-genghis"] = { enabled = true },
    ["nvim-jdtls"] = { enabled = true },
    ["nvim-lastplace"] = { enabled = true, defaults = true },
    ["nvim-lightbulb"] = { enabled = true, defaults = false },
    ["nvim-lspconfig"] = { enabled = true, defaults = false },
    ["nvim-navic"] = { enabled = true },
    ["nvim-notify"] = { enabled = true },
    ["nvim-scrollbar"] = { enabled = false },
    ["nvim-surround"] = { enabled = true },
    ["nvim-tetris"] = { enabled = true },
    ["nvim-treesitter"] = { enabled = true },
    ["nvim-web-devicons"] = { enabled = true },
    ["oil.nvim"] = { enabled = true, defaults = false },
    ["one-small-step-for-vimkind"] = { enabled = true },
    ["overlength.nvim"] = { enabled = true },
    ["onedarkpro.nvim"] = { enabled = true, defaults = false },
    ["onenord.nvim"] = { enabled = true, defaults = false },
    ["oxocarbon.nvim"] = { enabled = true },
    ["plenary.nvim"] = { enabled = true },
    ["popup.nvim"] = { enabled = true },
    ["rainbow-delimiters.nvim"] = { enabled = true, defaults = false },
    ["rust-tools.nvim"] = { enabled = true },
    ["tabout.nvim"] = { enabled = true, defaults = false },
    ["telescope.nvim"] = { enabled = true },
    ["telescope-dap.nvim"] = { enabled = true },
    ["telescope-fzf-native.nvim"] = { enabled = true },
    ["telescope-ui-select.nvim"] = { enabled = true },
    ["theme-selector.nvim"] = { enabled = false, defaults = false },
    ["trouble.nvim"] = { enabled = true, defaults = false },
    ["todo-comments.nvim"] = { enabled = true, defaults = false },
    ["tokyodark.nvim"] = { enabled = true, defaults = true },
    ["tokyonight.nvim"] = { enabled = true, defaults = false },
    ["twilight.nvim"] = { enabled = true, defaults = false },
    ["typescript.nvim"] = { enabled = true },
    ["undotree"] = { enabled = true },
    ["vim-be-good"] = { enabled = true },
    ["vim-commentary"] = { enabled = true },
    -- ["vim-go"] = { enabled = true }, -- TODO: Look for alternatives
    ["vim-illuminate"] = { enabled = true },
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
