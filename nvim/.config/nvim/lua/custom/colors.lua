-- colorizer
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local sorters = require("telescope.sorters")

local function enter(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  -- print(vim.inspect(selected))
  local cmd = "colorscheme " .. selected[1]
  vim.cmd(cmd)
  actions.close(prompt_bufnr)
end

local function next_color(prompt_bufnr)
  actions.move_selection_next(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  local cmd = "colorscheme " .. selected[1]
  vim.cmd(cmd)
end

local function prev_color(prompt_bufnr)
  actions.move_selection_previous(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  local cmd = "colorscheme " .. selected[1]
  vim.cmd(cmd)
end

local opts = {
  prompt_title = "Which color?",
  layout_strategy = "vertical",
  layout_config = {
    height = 0.45,
    width = 0.25,
    prompt_position = "top",
  },
  sorting_strategy = "ascending",
  finder = finders.new_table({
    "tokyodark",
    "tokyonight",
    "oxocarbon",
    "github_dark_high_contrast",
    "rose-pine",
    "enfocado",
    "material-deep-ocean",
    "fluoromachine",
    -- "carbonfox",
    -- "doom-one",
    -- "onedark_dark",
    -- "vscode",
    -- "catppuccin",
    -- "midnight",
    -- "gruber-darker",
    -- "nord",
    -- "nordic",
    -- "dracula",
    -- "onenord",
    -- "nightfox",
    -- "nordfox",
    -- "tol",
    -- "noctishc",
    -- "citruszest",
    -- "nvimgelion",
    -- "space-nvim",
    -- "oh-lucy",
    -- "palenightfall",
    -- "rasmus",
    -- "tokyonight-moon",
  }),
  sorter = sorters.get_generic_fuzzy_sorter({}),
---@diagnostic disable-next-line: unused-local
  attach_mappings = function(prompt_bufnr, map)
    map("i", "<CR>", enter)
    map("i", "<C-k>", prev_color)
    map("i", "<C-j>", next_color)
    return true
  end,
}

local colors = pickers.new(opts)

vim.api.nvim_create_user_command("Themer", function() colors:find() end, {})

-- last-color plugin
local theme = require("last-color").recall() or "tokyonight"
vim.cmd(("colorscheme %s"):format(theme))
