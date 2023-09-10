local wk = require("which-key")

-- LEADER plugin keybinds (Space for this config)

wk.register({
  -- which-key category entries
  ["<leader>b"] = { name = "[Buffers] [Block-view]" },
  ["<leader>c"] = { name = "[Buffers] [chmod] [TSContext]" },
  ["<leader>ca"] = { name = "a secret" },
  ["<leader>d"] = { name = "[Pets] [DB] [Word-toggler]" },
  ["<leader>e"] = { name = "[Refactoring -> Extract]" },
  ["<leader>f"] = { name = "[Formatter] [File-Ops]" },
  ["<leader>g"] = { name = "[Git (Blame + Links)]" },
  ["<leader>gc"] = { name = "Blame Copy" },
  ["<leader>i"] = { name = "[Indenting] [ISwap] [Word HL]" },
  ["<leader>l"] = { name = "[Leap] [Live Server] [Lazy]" },
  ["<leader>m"] = { name = "[Markdown] [Mason] [TS Move]" },
  ["<leader>n"] = { name = "[Navbuddy] [NeckPain] [Navbar]" },
  ["<leader>nw"] = { name = "[NeckPain] Split width" },
  ["<leader>k"] = { name = "[Harpoon]" },
  ["<leader>p"] = { name = "[NeoTree] [Register-pasting]" },
  ["<leader>r"] = { name = "[Refactoring] [LSP Rename]" },
  ["<leader>s"] = { name = "[Cokeline] [Sessions] [Timer] [ISwap]" },
  ["<leader>t"] = { name = "[Telescope] [TS] [Harpoon] [To-Do]" },
  ["<leader>te"] = { name = "[Built-in] Terminal" },
  ["<leader>tt"] = { name = "[TS] Playground" },
  ["<leader>tc"] = { name = "[To-Do] [TS Context]" },
  ["<leader>tl"] = { name = "[Telescope] LSP Calls" },
  ["<leader>v"] = { name = "[Telescope] [Diagnostics] [LSP Actions]" },
  ["<leader>vc"] = { name = "[LSP] Code actions" },
  ["<leader>vr"] = { name = "[LSP] Variable actions" },
  ["<leader>w"] = { name = "[Windows] [Saving]" },
  ["<leader>x"] = { name = "[Trouble] [Export to HTML]" },
  ["<leader>xt"] = { name = "Export to HTML" },
  ["<leader>y"] = { name = "[Register yanking]" },
  ["<leader>z"] = { name = "[Zen-Mode] [Twilight]" },

  ["<localleader>x"] = { name = "[Executor]" },
  ["<localleader>D"] = { name = "[DAP]" },
  ["<localleader>DP"] = { name = "[DAP] Python testing" },

  -- Custom lua functions: their which-key entries
  ["<leader>th"] = { "<cmd>Themer<CR>", "Colorscheme manager", { silent = true } },

  -- LSP Stuff
  ["gd"] = { name = "[g]o to [d]efinition" },
  ["gD"] = { name = "[g]o to [D]eclaration" },
  ["gT"] = { name = "[g]o to [T]ype definition" },
  ["gI"] = { name = "[g]o to [I]mplementation" },
  ["gp"] = { name = "LSP Previews" },
  ["K"] = { name = "Hover info" },
  ["<leader>tD"] = { name = "[Telescope] Document symbols" },
  ["<leader>tW"] = { name = "[Telescope] Workspace symbols" },
  ["[d"] = { name = "Next diagnostic" },
  ["]d"] = { name = "Prev diagnostic" },
  ["<leader>vca"] = { name = "View code action" },
  ["<leader>vrr"] = { name = "Show variable references" },
  ["<leader>vrn"] = { name = "Rename project-wide variable with LSP" },

  -- All the plugin keybinds are either with the plugin definition or in the corresponding
  -- custom/file.lua (e.g. LSP and CMP)
})
