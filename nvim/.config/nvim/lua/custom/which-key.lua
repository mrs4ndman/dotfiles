local wk = require("which-key")

-- LEADER plugin keybinds (Space for this config)

wk.register({
  -- which-key category entries
  ["<leader>b"] = { name = "[B]uffers" },
  ["<leader>c"] = { name = "Close, TS Context" },
  ["<leader>d"] = { name = "Duck + " },
  ["<leader>D"] = { name = "DAP (+ CodeLLDB when active)" },
  ["<leader>f"] = { name = "LSP Format TS Rename Function FML" },
  ["<leader>gy"] = { name = " Create code snippet + link" },
  ["<leader>i"] = { name = " [I]ndent[L]ine, Word-repetition" },
  ["<leader>k"] = { name = " Harpoon switching+" },
  ["<leader>l"] = { name = " over[L]eng[T]h, Lazy" },
  ["<leader>n"] = { name = " [N]eo[C]lip" },
  ["<leader>q"] = { name = " Close" },
  ["<leader>s"] = { name = " Cokeline+, Sessions, Alpha" },
  ["<leader>t"] = { name = " Telescope TS Aerial Harpoon ToDo" },
  ["<leader>ta"] = { name = " Aerial" },
  ["<leader>tc"] = { name = " [T]o-do [C]omments+"},
  ["<leader>v"] = { name = " HBAC, LSP, " },
  ["<leader>w"] = { name = " Windows"},
  ["<leader>x"] = { name = " Trouble+" },
  ["<leader>z"] = { name = " [Z]en-Mode / Twilight" },

  -- Custom lua functions: their which-key entries
  ["<leader>th"] = { "<cmd>Themer<CR>", "Colorschme manager", { silent = true } },

  -- All the plugin keybinds are either with the plugin definition or in the corresponding
  -- custom/file.lua
  -- Notification dismiss
  ["<leader>Cn"] = {
    function()
      require("notify").dismiss({ silent = true, pending = true })
    end,
    "Dismiss all Notifications",
  },


  -- AUTO-SESSION
  ["<leader>sd"] = { "<cmd>SessionDelete<CR>", "Delete current session", { silent = true } },
  ["<leader>sr"] = { "<cmd>SessionRestore<CR>", "Restore session for CWD", { silent = true } },
  ["<leader>ss"] = { "<cmd>SessionSave<CR>", "Save current session", { silent = true } },

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

  -- OVERLENGHT
  ["<leader>lt"] = { "<cmd>OverlengthToggle<CR>", "Overlength Toggle", { silent = true } },


  -- COKELINE
  ["<leader>cn"] = { "<Plug>(cokeline-focus-next)", "Change to next buffer", { silent = true } },
  ["<leader>cp"] = { "<Plug>(cokeline-focus-prev)", "Change to previous buffer", { silent = true } },
  ["<leader>cc"] = { "<Plug>(cokeline-pick-close)", "Pick buffer to close", { silent = true } },
  ["<leader>csn"] = { "<Plug>(cokeline-switch-next)", "Swap with next buffer", { silent = true } },
  ["<leader>csp"] = { "<Plug>(cokeline-switch-prev)", "Swap with next buffer", { silent = true } },

  -- TREESITTER
  ["<leader>ct"] = { "<cmd>TSContextToggle<CR>", "TS Context Toggle", { silent = true } },
  ["<leader>ttp"] = { "<cmd>TSPlaygroundToggle<CR>", "TS Playground Toggle", { silent = true } },

  -- TREESJ
  ["Q"] = { "<cmd>TSJToggle<CR>", "Toggle TS node", { silent = true } },

  -- OIL
  -- ["<leader>e"] = { require("oil").open, "It's oiling time", silent = true },
})
