local wk = require("which-key")

-- LEADER plugin keybinds (Space for this config)

wk.register({
  -- which-key category entries
  ["<leader>b"] = { name = "[B]uffers, Block view" },
  ["<leader>c"] = { name = "Close, Colorpicker, TSContext" },
  ["<leader>ca"] = { name = "a secret" },
  ["<leader>cs"] = { name = "Cokeline change-switch" },
  ["<leader>d"] = { name = "Duck" },
  ["<leader>e"] = { name = "Refactoring extractions" },
  ["<leader>f"] = { name = "LSP Format + Genghis" },
  ["<leader>g"] = { name = "Git Blame + Links" },
  ["<leader>gc"] = { name = "Blame Copy" },
  ["<leader>i"] = { name = "Indenting, Swap, Word HL" },
  ["<leader>l"] = { name = "Leap, Live Server, Lazy" },
  ["<leader>m"] = { name = "Markdown, Mason, TS Move" },
  ["<leader>n"] = { name = "Navbuddy, NeckPain, func context" },
  ["<leader>nw"] = { name = "NeckPain Width" },
  ["<leader>k"] = { name = "Harpoon swap" },
  ["<leader>p"] = { name = "NeoTree" },
  ["<leader>r"] = { name = "Refactoring, func. rename" },
  ["<leader>s"] = { name = "Cokeline Sessions Timer ISwap" },
  ["<leader>t"] = { name = "Telescope TS Aerial Harpoon ToDo" },
  ["<leader>te"] = { name = "Terminal" },
  ["<leader>ta"] = { name = "Aerial" },
  ["<leader>tt"] = { name = "Playground" },
  ["<leader>tc"] = { name = "[T]o-do [C]omments+" },
  ["<leader>v"] = { name = "HBAC, LSP, " },
  ["<leader>w"] = { name = "Windows + Saving" },
  ["<leader>x"] = { name = "Trouble + Export to HTML" },
  ["<leader>xt"] = { name = "Export to HTML" },
  ["<leader>y"] = { name = "Yank" },
  ["<leader>z"] = { name = "[Z]en-Mode / Twilight" },

  ["<localleader>x"] = { name = "Executor" },
  ["<localleader>D"] = { name = "DAP" },
  ["<localleader>DP"] = { name = "Python testing" },

  -- Custom lua functions: their which-key entries
  ["<leader>th"] = { "<cmd>Themer<CR>", "Colorscheme manager", { silent = true } },

  -- LSP Stuff
  ["gd"] = { name = "[g]o to [d]efinition" },
  ["gD"] = { name = "[g]o to [D]eclaration" },
  ["gT"] = { name = "[g]o to [T]ype definition" },
  ["gI"] = { name = "[g]o to [I]mplementation" },
  ["gp"] = { name = "LSP Previews" },
  ["K"] = { name = "Hover info" },
  ["<leader>tD"] = { name = "Document LSP symbols" },
  ["<leader>tW"] = { name = "Document LSP symbols" },
  ["[d"] = { name = "Next diagnostic" },
  ["]d"] = { name = "Prev diagnostic" },
  ["<leader>vca"] = { name = "View code action" },
  ["<leader>vrr"] = { name = "Show variable references" },
  ["<leader>vrn"] = { name = "Rename project-wide variable with LSP" },

  -- All the plugin keybinds are either with the plugin definition or in the corresponding
  -- custom/file.lua (e.g. LSP and CMP)
})
