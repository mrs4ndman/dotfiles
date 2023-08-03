Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "nvim-genghis"

return {
  "chrisgrieser/" .. plugin,
  enabled = Is_Enabled(plugin),
  dependencies = "stevearc/dressing.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    vim.keymap.set("n", "<leader>fp", require("genghis").copyFilepath, { desc = "Yank kurrent filepath" })
    vim.keymap.set("n", "<leader>fn", require("genghis").copyFilename, { desc = "Yank current filename" })
    -- vim.keymap.set("<leader>cx", { require("genghis").chmodx, desc = "Make current file executable" },
    vim.keymap.set("n", "<leader>fr", require("genghis").renameFile, { desc = "Rename current file" })
    vim.keymap.set("n", "<leader>fm", require("genghis").moveAndRenameFile, { desc = "Move and rename current filepath" })
    vim.keymap.set("n", "<leader>fc", require("genghis").createNewFile, { desc = "Create new file" })
    vim.keymap.set("n", "<leader>fd", require("genghis").duplicateFile, { desc = "Duplicate current file" })
    -- vim.keymap.set("n", "<leader>ft", function() require("genghis").trashFile({ trashLocation = "~/.Trash" }) end,
    --   { desc = "Trash current file" })
  end
}
