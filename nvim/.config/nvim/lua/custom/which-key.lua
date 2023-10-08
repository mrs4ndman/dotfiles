local wk = require("which-key")

-- LEADER plugin keybinds (Space for this config)

wk.register({
  -- which-key category entries
  ["<leader>b"] = { name = "[Buffers] [Block-view]" },
  ["<leader>c"] = { name = "[Buffers] [chmod] " },
  ["<leader>ca"] = { name = "a secret" },
  ["<leader>d"] = { name = "[Pets] [DB] [Word-toggler]" },
  ["<leader>e"] = { name = "[Refactoring -> Extract]" },
  ["<leader>f"] = { name = "[Formatter]" },
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
  ["<leader>s"] = { name = "[Sessions] [Timer] [ISwap]" },
  ["<leader>t"] = { name = "[Telescope] [TS] [Harpoon] [To-Do]" },
  ["<leader>te"] = { name = "[Built-in] Terminal" },
  -- ["<leader>tt"] = { name = "[TS] Playground" },
  ["<leader>tc"] = { name = "[To-Do] [TS Context]" },
  ["<leader>tl"] = { name = "[Telescope] LSP Calls" },
  ["<leader>v"] = { name = "[Telescope] [Diags] [LSP]" },
  ["<leader>vc"] = { name = "[LSP] Code actions" },
  ["<leader>vr"] = { name = "[LSP] Variable actions" },
  ["<leader>w"] = { name = "[Windows] [Saving]" },
  ["<leader>x"] = { name = "[Trouble] [Export to HTML]" },
  ["<leader>xt"] = { name = "Export to HTML" },
  ["<leader>y"] = { name = "[Register yanking]" },
  ["<leader>z"] = { name = "[Zen-Mode] [Twilight]" },

  ["<localleader>b"] = { name = "[Shade]" },
  ["<localleader>h"] = { name = "[Hover-split]" },
  ["<localleader>x"] = { name = "[Executor]" },
  ["<localleader>D"] = { name = "[DAP]" },
  ["<localleader>DP"] = { name = "[DAP] Python testing" },

  -- Custom lua functions: their which-key entries
  ["<leader>th"] = { "<cmd>Themer<CR>", "Colorscheme manager", { silent = true } },

  -- LSP Stuff
  ["gp"] = { name = "[LSP] Previews" },

  -- Filling in the blanks for native stuff
  ["gj"] = { name = "Go up 1 wrapped line" },
  ["gk"] = { name = "Go down 1 wrapped line" },

  -- All the plugin keybinds are either with the plugin definition or in the corresponding
  -- custom/file.lua (e.g. LSP and CMP)
})
-- GitHub stuff
wk.register({
  g = {
    name = "+[Git]",
    h = {
      name = "+[Github]",
      c = {
        name = "+Commits",
        c = { "<cmd>GHCloseCommit<cr>", "Close" },
        e = { "<cmd>GHExpandCommit<cr>", "Expand" },
        o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
        p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
        z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
      },
      i = {
        name = "+Issues",
        p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
      },
      l = {
        name = "+Litee",
        t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
      },
      r = {
        name = "+Review",
        b = { "<cmd>GHStartReview<cr>", "Begin" },
        c = { "<cmd>GHCloseReview<cr>", "Close" },
        d = { "<cmd>GHDeleteReview<cr>", "Delete" },
        e = { "<cmd>GHExpandReview<cr>", "Expand" },
        s = { "<cmd>GHSubmitReview<cr>", "Submit" },
        z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
      },
      p = {
        name = "+Pull Request",
        c = { "<cmd>GHClosePR<cr>", "Close" },
        d = { "<cmd>GHPRDetails<cr>", "Details" },
        e = { "<cmd>GHExpandPR<cr>", "Expand" },
        o = { "<cmd>GHOpenPR<cr>", "Open" },
        p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
        r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
        t = { "<cmd>GHOpenToPR<cr>", "Open To" },
        z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
      },
      t = {
        name = "+Threads",
        c = { "<cmd>GHCreateThread<cr>", "Create" },
        n = { "<cmd>GHNextThread<cr>", "Next" },
        t = { "<cmd>GHToggleThread<cr>", "Toggle" },
      },
    },
  },
}, { prefix = "<leader>" })

