Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "git-blame.nvim"

return {
  "f-person/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>gb", "<cmd>GitBlameToggle<CR>",  desc = "Git blame Toggle"  },
    { "<leader>go", "<cmd>GitBlameOpenCommitURL<CR>",  desc = "Git Blame Open"  },
    { "<leader>gO", "<cmd>GitBlameOpenFileURL<CR>",  desc = "Git Blame Open"  },
    { "<leader>gch", "<cmd>GitBlameCopySHA<CR>",  desc = "Git Blame Open"  },
    { "<leader>gcu", "<cmd>GitBlameCopyCommitURL<CR>",  desc = "Git Blame Open"  },
    { "<leader>gcf", "<cmd>GitBlameCopyFileURL<CR>",  desc = "Git Blame Open"  },
  },
  config = function()
    vim.g.gitblame_enabled = 0
    vim.g.gitblame_message_when_not_committed = "Not yet?"
  end
}
