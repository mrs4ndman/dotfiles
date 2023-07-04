Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
  "mrs4ndman/theme-selector.nvim",
  enabled = Is_Enabled("theme-selector.nvim"),
  lazy = false,
  opts = {
    -- prompt_title = "Which color?",
    -- layout_strategy = "vertical",
    -- layout_config = {
    --     height = 0.45,
    --     width = 0.25,
    --     prompt_position = "top",
    -- },
    -- sorting_strategy = "ascending",
    -- finder = finders.new_table {
    --     "rose-pine",
    --     "catppuccin",
    --     "onedark_dark",
    --     "tokyonight",
    --     "oxocarbon",
    --     "vscode",
    --     "doom-one",
    --     "github_dark_high_contrast",
    --     "tokyodark",
    --     "carbonfox",
    --     "material",
    --     "gruber-darker",
    --     "fluoromachine",
    --     "nord",
    --     "nordic",
    --     "dracula",
    --     "onenord",
    --     "nightfox",
    --     "nordfox",
    --     "neon",
    --     "tokyonight-moon"
    -- },
    -- sorter = sorters.get_generic_fuzzy_sorter({}),
    -- attach_mappings = function(prompt_bufnr, map)
    --     map("i", "<CR>", enter)
    --     map("i", "<C-k>", prev_color)
    --     map("i", "<C-j>", next_color)
    --     return true
    -- end,
  },
}
