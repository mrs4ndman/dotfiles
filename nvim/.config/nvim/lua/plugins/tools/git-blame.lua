Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "git-blame.nvim"

return {
  "f-person/" .. plugin,
  enabled = Is_Enabled(plugin),
  keys = {
    { "<leader>gb", "<cmd>GitBlameToggle<CR>",  desc = "Blame Toggle"  },
    { "<leader>go", "<cmd>GitBlameOpenCommitURL<CR>",  desc = "Blame Open"  },
    { "<leader>gO", "<cmd>GitBlameOpenFileURL<CR>",  desc = "Blame Open"  },
    { "<leader>gch", "<cmd>GitBlameCopySHA<CR>",  desc = "Blame Open"  },
    { "<leader>gcu", "<cmd>GitBlameCopyCommitURL<CR>",  desc = "Blame Open"  },
    { "<leader>gcf", "<cmd>GitBlameCopyFileURL<CR>",  desc = "Blame Open"  },
  },
  config = function()
    vim.g.gitblame_enabled = 0
    vim.g.gitblame_message_when_not_committed = "Not yet?"
  end
}
