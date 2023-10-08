Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "git-blame.nvim"

return {
  "f-person/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>gb", "<cmd>GitBlameToggle<CR>", desc = "Blame Toggle" },
    { "<leader>go", "<cmd>GitBlameOpenCommitURL<CR>", desc = "Open Commit URL" },
    { "<leader>gO", "<cmd>GitBlameOpenFileURL<CR>", desc = "Open File URL" },
    { "<leader>gch", "<cmd>GitBlameCopySHA<CR>", desc = "Copy Blame Commit SHA" },
    { "<leader>gcu", "<cmd>GitBlameCopyCommitURL<CR>", desc = "Copy Commit URL" },
    { "<leader>gcf", "<cmd>GitBlameCopyFileURL<CR>", desc = "Copy File URL" },
  },
  opts = {
    enabled = false,
    message_when_not_committed = "Not yet?",
  },
}
