local Customize = {}

Customize = {
  -- Plugin toggles for troubleshooting

  plugins = {
    ["FixCursorHold.nvim"] = { enabled = true },
    ["LuaSnip"] = { enabled = true },
    ["aerial.nvim"] = { enabled = false, defaults = false },
    ["alpha-nvim"] = { enabled = true, defaults = false },
    ["auto-session"] = { enabled = true, defaults = false },
    ["better-escape.nvim"] = { enabled = false, defaults = false },
    ["block.nvim"] = { enabled = true },
    ["cellular-automaton.nvim"] = { enabled = true },
    ["citruszest.nvim"] = { enabled = true },
    ["codeium.nvim"] = { enabled = true },
    ["Comment.nvim"] = { enabled = true, defaults = false },
    ["doom-one.nvim"] = { enabled = true, defaults = false },
    ["dmap.nvim"] = { enabled = true },
    ["dracula.nvim"] = { enabled = true, defaults = false },
    ["dressing.nvim"] = { enabled = true, defaults = false },
    ["dropbar.nvim"] = { enabled = true },
    ["duck.nvim"] = { enabled = true },
    ["executor.nvim"] = { enabled = true, defaults = false },
    ["flash.nvim"] = { enabled = false, defaults = false },
    ["flit.nvim"] = { enabled = true, defaults = false },
    ["fluoromachine.nvim"] = { enabled = true, defaults = false },
    ["focus.nvim"] = { enabled = true },
    ["formatter.nvim"] = { enabled = true },
    ["git-blame.nvim"] = { enabled = true },
    ["github-nvim-theme"] = { enabled = true, defaults = true },
    ["gitlinker.nvim"] = { enabled = true },
    ["gitsigns.nvim"] = { enabled = true, defaults = false },
    ["go.nvim"] = { enabled = true },
    ["goto-preview"] = { enabled = true },
    ["gruber-darker.nvim"] = { enabled = true, defaults = true },
    ["hardtime.nvim"] = { enabled = true, defaults = false },
    ["harpoon"] = { enabled = true, defaults = false },
    ["headlines.nvim"] = { enabled = false },
    ["highlight-undo.nvim"] = { enabled = true },
    ["horizon.nvim"] = { enabled = true },
    ["hypersonic.nvim"] = { enabled = false, defaults = false },
    ["inc-rename.nvim"] = { enabled = true, defaults = false },
    ["iswap.nvim"] = { enabled = true },
    ["last-color.nvim"] = { enabled = true, defaults = true },
    ["leap.nvim"] = { enabled = true, defaults = false },
    ["lualine.nvim"] = { enabled = true, defaults = false }, -- Migrate to a standard config format
    ["nvim-markdown-preview"] = { enabled = true, defaults = false },
    ["markid"] = { enabled = true },
    ["mason-lspconfig.nvim"] = { enabled = true, defaults = false },
    ["mason-nvim-dap.nvim"] = { enabled = true, defaults = false },
    ["mason-tool-installer.nvim"] = { enabled = true },
    ["mason.nvim"] = { enabled = true, defaults = false },
    ["material.nvim"] = { enabled = true, defaults = false },
    ["mini.indentscope"] = { enabled = true, defaults = false },
    ["modes.nvim"] = { enabled = false },
    ["multicursors.nvim"] = { enabled = false, defaults = false },
    ["neodev.nvim"] = { enabled = true },
    ["neon"] = { enabled = true },
    ["neo-tree.nvim"] = { enabled = true },
    ["nightfox.nvim"] = { enabled = true, defaults = false },
    ["noice.nvim"] = { enabled = true, defaults = false },
    ["no-neck-pain.nvim"] = { enabled = true, defaults = false },
    ["nordic.nvim"] = { enabled = true },
    ["nord.nvim"] = { enabled = true },
    ["nui.nvim"] = { enabled = true },
    ["numb.nvim"] = { enabled = true, defaults = false },
    ["nvim-autopairs"] = { enabled = true, defaults = false },
    ["nvim-bqf"] = { enabled = true },
    ["nvim-cmp"] = { enabled = true, defaults = false },
    ["nvim-cokeline"] = { enabled = true, defaults = false }, -- ~ 5ms effect
    ["nvim_context_vt"] = { enabled = true },
    ["nvim-cursorword"] = { enabled = true },
    ["nvim-dap"] = { enabled = true },
    ["nvim-dap-go"] = { enabled = true },
    ["nvim-dap-python"] = { enabled = true },
    -- ["nvim-dap-ruby"] = { enabled = true }, -- Will get implemented
    ["nvim-dap-ui"] = { enabled = true, defaults = false },
    ["nvim-dap-virtual-text"] = { enabled = true },
    ["nvimgelion"] = { enabled = true },
    ["nvim-genghis"] = { enabled = true },
    ["nvim-ghost.nvim"] = { enabled = true },
    ["nvim-jdtls"] = { enabled = true },
    ["nvim-lastplace"] = { enabled = true, defaults = true },
    ["nvim-lightbulb"] = { enabled = true, defaults = false },
    ["nvim-lspconfig"] = { enabled = true, defaults = false },
    ["nvim-navbuddy"] = { enabled = true },
    ["nvim-navic"] = { enabled = true },
    ["nvim-notify"] = { enabled = true },
    ["nvim-surround"] = { enabled = true },
    ["nvim-tetris"] = { enabled = true },
    ["nvim-toggler"] = { enabled = true },
    ["nvim-treesitter"] = { enabled = true, defaults = false },
    ["nvim-treesitter-context"] = { enabled = true },
    ["nvim-web-devicons"] = { enabled = true },
    ["obsidian.nvim"] = { enabled = true },
    ["oil.nvim"] = { enabled = false, defaults = false },
    ["onedarkpro.nvim"] = { enabled = true, defaults = false },
    ["onenord.nvim"] = { enabled = true, defaults = false },
    ["one-small-step-for-vimkind"] = { enabled = false },
    ["open-handlers.nvim"] = { enabled = true },
    ["oxocarbon.nvim"] = { enabled = true },
    ["palenightfall.nvim"] = { enabled = true },
    ["playground"] = { enabled = true },
    ["plenary.nvim"] = { enabled = true },
    ["popup.nvim"] = { enabled = true },
    ["presence.nvim"] = { enabled = false },
    ["rainbow-delimiters.nvim"] = { enabled = true, defaults = false },
    ["rasmus.nvim"] = { enabled = true },
    ["refactoring.nvim"] = { enabled = true },
    ["rust-tools.nvim"] = { enabled = true },
    ["SmoothCursor.nvim"] = { enabled = true },
    ["specs.nvim"] = { enabled = true },
    ["sPoNGe-BoB.NvIm"] = { enabled = true },
    ["stand.nvim"] = { enabled = true },
    ["tabout.nvim"] = { enabled = true, defaults = false },
    ["tabs-vs-spaces.nvim"] = { enabled = true },
    ["telescope-dap.nvim"] = { enabled = true },
    ["telescope-fzf-native.nvim"] = { enabled = true },
    ["telescope.nvim"] = { enabled = true, defaults = false },
    ["theme-selector.nvim"] = { enabled = false, defaults = false },
    ["todo-comments.nvim"] = { enabled = true, defaults = false },
    ["tokyodark.nvim"] = { enabled = true, defaults = false },
    ["tokyonight.nvim"] = { enabled = true, defaults = false },
    ["treesj"] = { enabled = true, defaults = false },
    ["trouble.nvim"] = { enabled = true, defaults = false },
    ["twilight.nvim"] = { enabled = true, defaults = false },
    ["typescript.nvim"] = { enabled = true },
    ["undotree"] = { enabled = true },
    ["vim-be-good"] = { enabled = true },
    ["vim-commentary"] = { enabled = true },
    ["vim-illuminate"] = { enabled = true },
    ["vim-matchquote"] = { enabled = true },
    ["vim-sleuth"] = { enabled = true },
    ["vim-tmux"] = { enabled = true },
    ["vim-tmux-navigator"] = { enabled = true },
    ["vim-vinegar"] = { enabled = true },
    ["vim-visual-multi"] = { enabled = false },
    ["vscode.nvim"] = { enabled = true, defaults = false },
    ["which-key.nvim"] = { enabled = true },
    ["wpm.nvim"] = { enabled = true },
    ["zen-mode.nvim"] = { enabled = true, defaults = false },
  },
}

return Customize
