# Neovim Plugin summary
- ✅ means that the plugin is enabled by default
- ⚡ means that the plugin is toggled by a filetype (langs), keybind or has keybinds to toggle features
- ⭐ means that it is a plugin essential to my workflow / of common use
- ❌ means that the plugin is disabled inside the lua/mrsandman/customize.lua (custom disabling system by [Traap](https://github.com/Traap))
- The name in between () is the filename for the plugin
## UI

- ✅ [alpha-nvim](https://github.com/goolord/alpha-nvim) (`alpha.lua`) - Dashboard with shortcuts
- ⭐✅ [nvim-cokeline](https://github.com/willothy/nvim-cokeline) (`cokeline.lua + custom/cokeline.lua`) - Opinionated bufferline
- ✅ colors.lua - Contains all the colorschemes I use (toggled using custom/colors.lua)
- ✅ [dressing.nvim](https://github.com/stevearc/dressing.nvim) (`dressing.lua`) - Wrapper for vim.ui.select (cooler selection menus)
- ✅ [headlines.nvim](https://github.com/lukas-reineke/headlines.nvim) (`headlines.lua`) - Creates HL groups and borders for markdown headers
- ✅ [mini.indentscope](https://github.com/echasnovski/mini.indentscope) (`indentscope.lua`) - Animated indentation lines
- ⭐✅ [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) (`gitsigns.lua`) - Shows git diffs with signs
- ⭐✅ [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) (`lualine.lua + custom/lualine.lua`) - Very customizable and stable statusline
- ✅ [vim-matchquote](https://github.com/airblade/vim-matchquote) (`matchquote.lua`) - Highlight the opposite quote / parenthesis
- ✅ [nvim-navic](https://github.com/SmiteshP/nvim-navic) (`navic.lua`)- Dependency for SmiteshP/nvim-navbuddy
- ✅ [noice.nvim](https://github.com/folke/noice.nvim) (`noice.lua`) - Cmdline and search UI extensions
- ✅ [nvim-notify](https://github.com/rcarriga/nvim-notify) (`notify.lua`) - Notification UI extension
- ⚡ [nvim-colorizer](https://github.com/NvChad/nvim-colorizer.lua) (`colorizer.lua`) - Show colors for Hex codes and CSS
- ✅ [nvim-cursorword](https://github.com/xiyaowong/nvim-cursorword) (`nvim-cursorword.lua`) - Highlights instances of the word under the cursor
- ✅ [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) (`nvim-web-devicons.lua`) - Shows icons for many things (mainly as dependency)
- ⚡ [block.nvim](https://github.com/HampusHauffman/block.nvim) (`nvim_block.lua`) - Creates block highlights around Treesitter units
- ⚡ [SmoothCursor.nvim](https://github.com/gen740/SmoothCursor.nvim) (`smoothcursor.lua`) - Adds a fancy cursor indicator to the numberline
- ✅ [specs.nvim](https://github.com/edluffy/specs.nvim) (`specs.lua`) - Adds a beacon-like effect when jumping x number of lines
- ⚡ [tabs-vs-spaces.nvim](https://github.com/tenxsoydev/tabs-vs-spaces.nvim) (`tabs_vs_spaces.lua`) - Checks if indentation is made with tabs or spaces
- ✅ [twilight.nvim](https://github.com/folke/twilight.nvim) (`twilight.lua`) - Focuses highlighting only on the current code context
- ✅ [wpm.nvim](https://github.com/jcdickinson/wpm.nvim) (`wpm.lua`) - Inserts a wpm meter in the lualine statusline
- ✅ [zen-mode.nvim](https://github.com/folke/zen-mode.nvim) (`zen-mode.lua`) - Creates a Zen mode UI with less width and highlighting (uses twilight)
- ❌ [modes.nvim](https://github.com/mvllow/modes.nvim) (`modes.lua`) - Highlight the cursorline based on the current mode
<br>

## Tools

- ⭐✅ [nvim-autopairs](https://github.com/windwp/nvim-autopairs) (`autopairs.lua`) - Auto pair brackets, quotes, etc
- ⭐✅ [auto-session](https://github.com/rmagatti/auto-session) (`auto-session.lua`) - Automatically saves sessions and restores them
- ⭐✅⚡ [Comment.nvim](https://github.com/numToStr/Comment.nvim) (`comment.lua`) - Great code-commenting plugin (integrates with Treesitter)
- ✅ [dropbar.nvim](https://github.com/Bekaboo/dropbar.nvim) (`dropbar.lua`) - IDE-like breadcrumbs as the tabline
- ⚡ [executor.nvim](https://github.com/google/executor.nvim) (`executor.lua`) - Per-project command executor
- ⚡ [git-blame.nvim](https://github.com/f-person/git-blame.nvim) (`git-blame.lua`) - See Git blame for the code and many other things
- ⭐⚡ [gitlinker.nvim](https://github.com/ruifm/gitlinker.nvim) (`gitlinker.lua`) - Create permalinks for blocks of code
- ⭐⚡ [harpoon](https://github.com/ThePrimeagen/harpoon) (`harpoon.lua`) - Harpoon for all your buffer switching needs
- ⚡ [live-server.nvim](https://github.com/barrett-ruth/live-server.nvim) (`live-server.lua`) - Local HTML / web preview
- ⭐⚡ [markdown-preview.nvim](https://github.com/davidgranstrom/nvim-markdown-preview) (`markdown-preview.lua`) - Markdown previewer
- ⚡ [neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) (`neotree.lua`) - Tree-like project view (almost never use it)
- ✅ [numb.nvim](https://github.com/nacro90/numb.nvim) (`numb.lua`) - "Peek" into x line in a buffer
- ⚡ [nvim-genghis](https://github.com/chrisgrieser/nvim-genghis) (`nvim-genghis.lua`) - Multiple file-related actions
- ✅ [nvim-ghost](https://github.com/subnut/nvim-ghost.nvim) (`nvim-ghost.lua`) - Connect to text boxes in the browser
- ⭐✅ [nvim-lastplace](https://github.com/ethanholz/nvim-lastplace) (`nvim-lastplace.lua`) - Enter a buffer where you left it
- ⭐✅⚡ [nvim-surround](https://github.com/kylechui/nvim-surround) (`nvim-surround.lua`) - Surround text with characters
- ⚡ [nvim-toggler](https://github.com/nguyenvukhang/nvim-toggler) (`nvim_toggler.lua`) - Invert predefined pairs of text
- ⭐✅ [tabout.nvim](https://github.com/abecodes/tabout.nvim) (`tabout.lua`) - Tab out of parentesis, quotes and brackets
- ⭐✅⚡ [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) (`telescope.lua`) - Fuzzy finding and pickers forever
- ⭐⚡ [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) (`todo-comments.lua`) - Comment highlighting and finding for TO-DO's and more
- ⚡ [trouble.nvim](https://github.com/folke/trouble.nvim) (`trouble.lua`) - A quick way to view your errors
- ⭐⚡ [undotree](https://github.com/mbbill/undotree) (`undotree.lua`) - Visualize your undos in a tree like way
- ✅ [vim-sleuth](https://github.com/tpope/vim-sleuth) (`vim_sleuth.lua`) - Detect the indentation level auautomagically
- ⭐✅⚡ [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) (`vim-tmux-navigator.lua`) - Navigate between Neovim and tmux seseamless
- ⭐✅ [vim-tmux](https://github.com/tmux-plugins/vim-tmux) (`vim-tmux.lua`) - Plugin for editing the `.tmux.conf` file
- ⭐⚡ [vim-vinegar](https://github.com/tpope/vim-vinegar) (`vim-vinegar.lua`) - Supercharged Ex
- ✅⚡ [which-key.nvim](https://github.com/folke/which-key.nvim) (`which-key.lua`) - Shows a list of your keybindings
- ❌ [better-escape.nvim](https://github.com/max397574/better-escape.nvim) (`better-escape.lua`) - "Better" / different escape keybinds
- ❌ [focus.nvim](https://github.com/nvim-focus/focus.nvim) (`focus.lua`) - Auto-resizing for windows
- ❌ [multicursors.nvim](https://github.com/smoka7/multicursors.nvim) (`multicursors.lua`) - Lua version of vim-visual-multi
- ❌ [oil.nvim](https://github.com/stevearc/oil.nvim) (`oil.lua`) - Edit your filesystem like a buffer (I use Ex)
- ❌ [open-handlers.nvim](https://github.com/mrshmllow/open-handlers.nvim) (`open-handlers.lua`) - Open files with a specific handler
- ❌[vim-visual-multi](https://github.com/mg979/vim-visual-multi) (`vim-visual-multi.lua`) - Multi-cursor power
<br>


## Movement

- ⚡ [flash.nvim](https://github.com/folke/flash.nvim) (`flash.lua`) - Leap-like interface (using it for TS navigation)
- ⭐⚡ [flit.nvim](https://github.com/ggandor/flit.nvim) (`flit.lua`) - Enhanced `f/F` & `t/T` movement for multiple lines
- ⭐⚡ [leap.nvim](https://github.com/ggandor/leap.nvim) (`leap.lua`) - 3-key-combos for epic speed
- ⭐ Leap extensions: [leap-ast.nvim](https://github.com/ggandor/leap-ast.nvim) for Treesitter (TS) and [leap-spooky.nvim](https://github.com/ggandor/leap-spooky.nvim) for Leap [telekinesis](https://github.com/ggandor/leap.nvim#faq)
<br>



## LSP
- ⭐✅⚡ [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) (`lsp.lua`) - LSP Integration for Neovim
- ⭐✅⚡ [mason.nvim](https://github.com/williamboman/mason.nvim) (mason.lua & `lsp.lua`) - Manage LSP Servers, Formatters, Linters and more
- ⭐✅⚡ [mason-lspconfig.nvim](https://github.com/williamboman/mason-lspconfig.nvim) (`mason-lspconfig.lua`) - Auto-install LSP servers
- ✅ [virtual-types.nvim](https://github.com/jubnzv/virtual-types.nvim) (`lsp.lua`) - Show type annotations for LSP CodeLens
- ✅ [lsp-colors.nvim](https://github.com/folke/lsp-colors.nvim) (`lsp.lua`) - Fill in HL groups for some LSPs
- ✅⚡ [nvim-navbuddy](https://github.com/SmiteshP/nvim-navbuddy) (`lsp.lua`) - Menu for navigating code through LSP
- ⭐✅⚡ [lsp_lines.nvim](https://git.sr.ht/~whynothugo/lsp_lines.nvim) (`lsp.lua`) - Create multi-line virtual-text diagnostics
- ⚡ [nvim_context_vt](https://github.com/haringsrob/nvim_context_vt) (`nvim-context-vt.lua`) - Show function context in the closing statement with virtual text
- ⭐⚡ [formatter.nvim](https://github.com/mhartington/formatter.nvim) (`formatter.lua`) - Formatter for many languages
- ✅⚡ [mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim) (`formatter.lua`) - Auto-installer for formatters and linters
- ✅⚡ [goto-preview](https://github.com/rmagatti/goto-preview) (`goto_preview.lua`) - Preview windows for LSP definitions, references and more
- ⚡ [inc-rename.nvim](https://github.com/smjonas/inc-rename.nvim) (`inc-rename.lua`) - Rename LSP arguments across entire projects
- ⚡ [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim) (`refactoring.lua`) - Refactor LSP code
- ❌ [aerial.nvim](https://github.com/stevearc/aerial.nvim) (`aerial.lua`) - Code outline window for symbols, LSP and Treesitter
- ❌ [dmap.nvim](https://github.com/doums/dmap.nvim) (`dmap.lua`) - Sidebar with clickable LSP events
<br>


## Treesitter
- ⭐✅ [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) (`treesitter.lua`) - Treesitter highlighting in Neovim
- ⭐✅ [treesj](https://github.com/Wansmer/treesj) (`treesj.lua`) - Toggle (join / separate TS nodes)
- ⭐✅ [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) (`treesitter.lua`) - Current code context by Treesitter
- ✅ [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) (`treesitter.lua`) - `Comment.nvim` integration
- ⚡ [playground](https://github.com/nvim-treesitter/playground) (`treesitter.lua`) - Playground for Treesitter
- ✅ [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag) (`treesitter.lua`) - Auto close tags
- ⭐✅ [iswap.nvim](https://github.com/mizlan/iswap.nvim) (`iswap.lua`) - Swap treesitter nodes with keybinds
- ✅ [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim) (`rainbow-delimiters.lua`) - Highlights delimiters in alternating colors
- ⭐✅ [markid](https://github.com/David-Kunz/markid) (`markid.lua`) - Highlight every LSP symbol in a different color for better visuals
<br>


## Completion:
- ⭐✅ [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) (`nvim-cmp.lua + custom/cmp.lua`) - Completion engine for Neovim
- ⭐✅ [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) (`nvim-cmp.lua`) - Buffer completion source
- ✅ [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) (`nvim-cmp.lua`) - Completion source for cmdline
- ✅ [cmp-path](https://github.com/hrsh7th/cmp-path) (`nvim-cmp.lua`) - Completion source for filesystem paths
- ✅ [cmp-emoji](https://github.com/hrsh7th/cmp-emoji) (`nvim-cmp.lua`) - Completioin source for Unicode emojis
- ✅ [cmp-nvim-lua](https://github.com/hrsh7th/cmp-nvim-lua) (`nvim-cmp.lua`) - Completes the vim.api and lua functions
- ⭐✅ [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) (`nvim-cmp.lua`) - Uses LSPs as completion sources
- ✅ [cmp-ts-tag-close](https://github.com/buschco/nvim-cmp-ts-tag-close) (`nvim-cmp.lua`) - Complete closing tags
- ✅ [cmp-tabnine](https://github.com/tzachar/cmp-tabnine) (`nvim-cmp.lua`) - TabNine AI autocompletion
- ⭐✅ [codeium.nvim](https://github.com/jcdickinson/codeium.nvim) (`nvim-cmp.lua`) - Forever free AI completion
- ✅ [LuaSnip](https://github.com/L3MON4D3/LuaSnip) (`nvim-cmp.lua`) - Neovim Snippet engine
- ✅ [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) (`nvim-cmp.lua`) - Uses LuaSnip as a completion source
- ✅ [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) (`nvim-cmp.lua`) - Adds more snippets to LuaSnip
- ❌ [nvim-cmp-buffer-lines](https://github.com/amarakon/nvim-cmp-buffer-lines) (`nvim-cmp.lua`) - Like cmp-buffer but with entire lines
- ❌ [cmp-nvim-lsp-signature-help](https://github.com/hrsh7th/cmp-nvim-lsp-signature-help) (`nvim-cmp.lua`)
- ❌ [cmp-nvim-lsp-document-symbol](https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol) (`nvim-cmp.lua`)
- ❌ [cmp-treesitter](https://github.com/ray-x/cmp-treesitter) (`nvim-cmp.lua`) - Uses TS nodes as completion objects
<br>


## Languages
- ⚡ [go.nvim](https://github.com/ray-x/go.nvim) (`go.lua`) - Go development tooling
- ⚡ [rust.vim](https://github.com/rust-lang/rust.vim) (`langs.lua`) - Rust development tooling
- ⚡ [crates.nvim](https://github.com/saecki/crates.nvim) (`langs.lua`) - Completion source for Rust crates
- ⚡ [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls) (`langs.lua`) - Java development tooling
- ⚡ [typescript.nvim](https://github.com/jose-elias-alvarez/typescript.nvim) (`langs.lua`) - TypeScript development tooling
<br>


## MIscellaneous / small stuff

- **DAP / debugging** -> look at `dap.lua` , `lua/langs` and `mason_nvim_dap.lua` for the setups

- ⚡ [cellular-automaton.nvim](https://github.com/eandrju/cellular-automaton.nvim) (`cellular-automaton.lua`) - Cool text decomposition effects
- ⚡ [duck.nvim](https://github.com/tamton-aquib/duck.nvim) (`duck.lua`) - VS Code-like pets for Neovim
- ✅ [hardtime.nvim](https://github.com/m4xshen/hardtime.nvim) (`hardtime.lua`) - Vim motions and habbits training
- ✅ [highlight-undo.nvim](https://github.com/tzachar/highlight-undo.nvim) (`hl-undo`) - Highlight the modified code section when undoing / redoing
- ⚡ [no-neck-pain.nvim](https://github.com/shortcuts/no-neck-pain.nvim) (`no-neck-pain.lua`) - Center the current buffer on the window
- ⚡ [obsidian.nvim](https://github.com/epwalsh/obsidian.nvim) (`obsidian.lua`) - Use Obsidian vaults inside of Neovim
- ⚡ [sPoNGe-BoB.NvIm](https://github.com/tjdevries/sPoNGe-BoB.NvIm) (`sPoNGe-BoB.lua`) - sPoNGe-BoB-ify your text
- ⚡ [stand.nvim](https://github.com/mvllow/stand.nvim) (`stand.lua`) - Create and manage timers for standing up IRL
- ⚡ [nvim-tetris](https://github.com/alec-gibson/nvim-tetris) (`tetris.lua`)
- ✅ [vim-be-good](https://github.com/ThePrimeagen/vim-be-good) (`vim-be-good.lua`) - Goodbye bad habits, hello motion training
- ❌ [hypersonic.nvim](https://github.com/tomiis4/hypersonic.nvim) (`hypersonic.lua`) - Explain vim-search regex on-the-fly
- ❌ [presence.nvim](https://github.com/andweeb/presence.nvim) (`discord.lua`) - Discord Rich Presence for Neovim
