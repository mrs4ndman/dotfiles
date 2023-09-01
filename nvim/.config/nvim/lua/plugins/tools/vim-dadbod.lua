local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled

return {
  {
    "tpope/vim-dadbod",
    enabled = Is_Enabled("vim-dadbod"),
    cmd = "DB",
  },
  {
    "kristijanhusak/vim-dadbod-ui",
    enabled = Is_Enabled("vim-dadbod-ui"),
    cmd = "DBUI",
    keys = {
      { "<leader>db", "<cmd>DBUI<CR>", desc = "Database toggle" }
    }
  },
}
