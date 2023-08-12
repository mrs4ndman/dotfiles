Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "hacker.nvim"

return {
  "letieu/" .. plugin,
  enabled = Is_Enabled(plugin),
  cmd = { "Hack", "HackFollow", "HackAuto" },
  opts = {
    content = [[
local opts = {
  defaults = { lazy = true, version = false },
  checker = { enabled = true },
  performance = {
    cache = { enabled = true },
    rtp = { disabled_plugins = { "man", "gzip", "tarPlugin", "tutor", "zipPlugin" } }
  },
}

require("lazy").setup(plugins, opts)
--
-- colorizer
local telescope_actions = require("telescope.actions")
local telescope_action_state = require("telescope.actions.state")
local telescope_pickers = require("telescope.pickers")
local telescope_finders = require("telescope.finders")
local telescope_sorters = require("telescope.sorters")

local function themer_enter(prompt_bufnr)
  local selected = telescope_action_state.get_selected_entry()
  -- print(vim.inspect(selected))
  local cmd = "colorscheme " .. selected[1]
  vim.cmd(cmd)
  telescope_actions.close(prompt_bufnr)
end

local function themer_next_color(prompt_bufnr)
  telescope_actions.move_selection_next(prompt_bufnr)
  local selected = telescope_action_state.get_selected_entry()
  local cmd = "colorscheme " .. selected[1]
  vim.cmd(cmd)
end

local function themer_prev_color(prompt_bufnr)
  telescope_actions.move_selection_previous(prompt_bufnr)
  local selected = telescope_action_state.get_selected_entry()
  local cmd = "colorscheme " .. selected[1]
  vim.cmd(cmd)
end

local themer_opts = {
  prompt_title = "Which color?",
  layout_strategy = "vertical",
  layout_config = { height = 0.45, width = 0.25, prompt_position = "top" },
  sorting_strategy = "ascending",
  finder = telescope_finders.new_table({
    "rose-pine",
    "tokyonight",
    "oxocarbon",
    "vscode",
    "citruszest",
    "doom-one",
    "tokyodark",
    "nvimgelion",
    "palenightfall",
    "rasmus",
    "onedark_dark",
    "catppuccin",
    "github_dark_high_contrast",
    "carbonfox",
    "material",
    "gruber-darker",
    "fluoromachine",
    "nord",
    "nordic",
    "dracula",
    "onenord",
    "nightfox",
    "nordfox",
    "neon",
    "tokyonight-moon",
  }),
  sorter = telescope_sorters.get_generic_fuzzy_sorter({}),
  ---@diagnostic disable-next-line: unused-local
  attach_mappings = function(prompt_bufnr, map)
    map("i", "<CR>", themer_enter)
    map("i", "<C-k>", themer_prev_color)
    map("i", "<C-j>", themer_next_color)
    return true
  end,
}

local themer_colors = telescope_pickers.new(themer_opts)

vim.api.nvim_create_user_command("Themer", function() themer_colors:find() end, {})

-- last-color plugin
local theme = require("last-color").recall() or "rose-pine"
vim.cmd(("colorscheme %s"):format(theme))
    ]],
    filetype = "lua",
    speed = {
      min = 3,
      max = 15,
    },
    is_popup = true,
    popup_after = 10,
  }
}
