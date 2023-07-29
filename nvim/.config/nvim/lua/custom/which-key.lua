local wk = require("which-key")

-- LEADER plugin keybinds (Space for this config)

wk.register({
  -- which-key category entries
  ["<leader>b"] = { name = "[B]uffers" },
  ["<leader>c"] = { name = "Close, Colorpicker, TSContext" },
  ["<leader>d"] = { name = "Duck + " },
  ["<leader>D"] = { name = "DAP" },
  ["<leader>e"] = { name = "Refactoring extractions" },
  ["<leader>f"] = { name = "LSP Format + Genghis" },
  ["<leader>g"] = { name = "Git Blame + Links" },
  ["<leader>i"] = { name = "Indenting, Swap, Word HL" },
  ["<leader>l"] = { name = "Leap, Live Server, OverLength, Lazy" },
  ["<leader>m"] = { name = "Markdown, Mason, TS Move" },
  ["<leader>n"] = { name = "Navbuddy, NeckPain, func context" },
  ["<leader>k"] = { name = "Harpoon swap" },
  ["<leader>p"] = { name = "NeoTree" },
  ["<leader>r"] = { name = "Refactoring, func. rename" },
  ["<leader>s"] = { name = "Cokeline Sessions Timer ISwap" },
  ["<leader>t"] = { name = "Telescope TS Aerial Harpoon ToDo" },
  ["<leader>te"] = { name = "Terminal" },
  ["<leader>ta"] = { name = "Aerial" },
  ["<leader>tc"] = { name = "[T]o-do [C]omments+" },
  ["<leader>v"] = { name = "HBAC, LSP, " },
  ["<leader>w"] = { name = "Windows + Saving" },
  ["<leader>x"] = { name = "Trouble + Export to HTML" },
  ["<leader>X"] = { name = "Executor" },
  ["<leader>y"] = { name = "Yank" },
  ["<leader>z"] = { name = "[Z]en-Mode / Twilight" },

  -- Custom lua functions: their which-key entries
  ["<leader>th"] = { "<cmd>Themer<CR>", "Colorscheme manager", { silent = true } },

  -- All the plugin keybinds are either with the plugin definition or in the corresponding
  -- custom/file.lua

  -- TWILIGHT
  ["<leader>zt"] = { "<cmd>Twilight<CR>", "Twilight toggle" },

  -- AERIAL
  ["<leader>tat"] = { "<cmd>AerialToggle!<CR>", "Toggle Aerial", { silent = true } },
  ["<leader>tac"] = { "<cmd>AerialClose<CR>", "Close Aerial" },
  ["<leader>tax"] = { "<cmd>AerialCloseAll<CR>", "Close all Aerial instances" },

  -- RENAMER
  ["<leader>rf"] = {
    function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end,
    expr = true,
    "Rename function under cursor",
  },


  -- COKELINE
  ["<leader>cn"] = { "<Plug>(cokeline-focus-next)", "Change to next buffer", { silent = true } },
  ["<leader>cp"] = { "<Plug>(cokeline-focus-prev)", "Change to previous buffer", { silent = true } },
  ["<leader>cc"] = { "<Plug>(cokeline-pick-close)", "Pick buffer to close", { silent = true } },
  ["<leader>csn"] = { "<Plug>(cokeline-switch-next)", "Swap with next buffer", { silent = true } },
  ["<leader>csp"] = { "<Plug>(cokeline-switch-prev)", "Swap with prev buffer", { silent = true } },

  -- TREESITTER
  ["<leader>ct"] = { "<cmd>TSContextToggle<CR>", "TS Context Toggle", { silent = true } },
  ["<leader>ttp"] = { "<cmd>TSPlaygroundToggle<CR>", "TS Playground Toggle", { silent = true } },

})
