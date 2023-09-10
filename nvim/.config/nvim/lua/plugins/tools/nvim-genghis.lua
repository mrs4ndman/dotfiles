Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-genghis"

return {
  "chrisgrieser/" .. plugin,
  enabled = Is_Enabled(plugin),
  dependencies = "stevearc/dressing.nvim",
  keys = {
    { "<leader>fp", desc = "Yank current filepath" },
    { "<leader>fn", desc = "Yank current filename" },
    { "<leader>fr", desc = "Rename current file" },
    { "<leader>fm", desc = "Move and rename current file" },
    { "<leader>fc", desc = "Create new file" },
    { "<leader>fd", desc = "Duplicate current file" },
  },
  config = function()
    vim.keymap.set("n", "<leader>fp", require("genghis").copyFilepath, { desc = "Yank kurrent filepath" })
    vim.keymap.set("n", "<leader>fn", require("genghis").copyFilename, { desc = "Yank current filename" })
    vim.keymap.set("n", "<leader>fr", require("genghis").renameFile, { desc = "Rename current file" })
    vim.keymap.set("n", "<leader>fm", require("genghis").moveAndRenameFile, { desc = "Move and rename current filepath" })
    vim.keymap.set("n", "<leader>fc", require("genghis").createNewFile, { desc = "Create new file" })
    vim.keymap.set("n", "<leader>fd", require("genghis").duplicateFile, { desc = "Duplicate current file" })
  end
}
