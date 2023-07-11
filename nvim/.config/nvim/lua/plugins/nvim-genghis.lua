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
    vim.keymap.set("n", "<leader>yp", require("genghis").copyFilepath, { desc = "Yank kurrent filepath" })
    vim.keymap.set("n", "<leader>yn", require("genghis").copyFilename, { desc = "Yank current filename" })
    -- vim.keymap.set("<leader>cx", { require("genghis").chmodx, desc = "Make current file executable" },
    vim.keymap.set("n", "<leader>fr", require("genghis").renameFile, { desc = "Rename current file" })
    vim.keymap.set("n", "<leader>mf", require("genghis").moveAndRenameFile, { desc = "Move and rename current filepath" })
    vim.keymap.set("n", "<leader>nf", require("genghis").createNewFile, { desc = "Create new file" })
    vim.keymap.set("n", "<leader>yf", require("genghis").duplicateFile, { desc = "Duplicate current file" })
    vim.keymap.set("n", "<leader>Df", function() require("genghis").trashFile({ trashLocation = "$HOME/.Trash" }) end,
      { desc = "Trash current file" })
  end
}
