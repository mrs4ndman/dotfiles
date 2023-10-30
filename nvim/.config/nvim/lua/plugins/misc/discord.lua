Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "presence.nvim"

return {
  "andweeb/" .. plugin,
  enabled = false,
  lazy = true,
  config = function()
    require("presence").setup({
      auto_update = true,
      neovim_image_text = "Flying through code",
      main_image = "neovim",
      log_level = nil,
      debounce_timeout = 10,
      buttons = true,
      enable_line_number = false,
      show_time = true,

      editing_text = "Flying through %s",
      file_explorer_text = "Browsing %s",
      git_commit_text = "Committing changes",
      plugin_manager_text = "Managing plugins",
      reading_text = "Parsing through %s",
      workspace_text = "Working On %s",
    })
  end,
}
