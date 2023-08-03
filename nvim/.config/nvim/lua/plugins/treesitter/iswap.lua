Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "iswap.nvim"

return {
  "mizlan/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = "ISwap",
  keys = {
    { "<leader>is", "<cmd>ISwap<CR>", desc = "Swap start" },
    { "<leader>sw", "<cmd>ISwapWith<CR>", desc = "Swap current item" },
    { "<leader>sn", "<cmd>ISwapNode<CR>", desc = "Swap current node" },
    { "<leader>sl", "<cmd>ISwapNodeWithLeft<CR>", desc = "Swap current node with left one" },
    { "<leader>mw", "<cmd>IMoveWith<CR>", desc = "Move current item" },
  },
  opts = {
    keys = "ahsjdkfluiop",
    autoswap = true,
  }
}
