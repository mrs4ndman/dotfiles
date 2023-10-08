-- Slightly modified GeoMetro
-- (if you get it, you get it)

local lualine = require("lualine")
-- Color table for highlights
-- stylua: ignore
local colors = {
  bg          = '#202328',
  fg          = '#bbc2cf',
  violet      = '#a9a1e1',
  radioactive = '#FAE500',
  yellow      = '#ECBE7B',
  cyan        = '#008080',
  pink        = '#FF00FF',
  darkblue    = '#0037AA',
  turquoise   = '#00CCCC',
  green       = '#98be65',
  lime        = '#00CC00',
  orange      = '#FF8800',
  sorange     = '#FF6600',
  magenta     = '#c678dd',
  blue        = '#51afef',
  red         = '#FF0000',
  ultraviolet = '#CC0099',
  catppuccin_rosewater = '#f5e0dc',
  catppuccin_flamingo = '#f2cdcd',
  catppuccin_pink = '#f5c2e7',
  catppuccin_mauve = '#cba6f7',
  catppuccin_red = '#f38ba8',
  catppuccin_maroon = '#eba0ac',
  catppuccin_peach = '#fab387',
  catppuccin_yellow = '#f9e2af',
  catppuccin_green = '#a6e3a1',
  catppuccin_teal = '#94e2d5',
  catppuccin_sky = '#89dceb',
  catppuccin_sapphire = '#74c7ec',
  catppuccin_blue = '#89b4fa',
  catppuccin_lavender = '#b4befe',
  catppuccin_base = '#1e1e2e',
  catppuccin_text = '#cdd6f4',
  catppuccin_subtext0 = '#a6adc8',
  catppuccin_mantle = '#181825',
  catppuccin_surface0 = '#313244',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local function wordcount()
  return tostring(vim.fn.wordcount().words) .. " words"
end

local function readingtime()
  return tostring(math.ceil(vim.fn.wordcount().words / 200.0)) .. " min"
end

local function is_markdown()
  return vim.bo.filetype == "markdown" or vim.bo.filetype == "asciidoc"
end

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = "auto",
    globalstatus = true,
    disabled_filetypes = {
      statusline = { "dashboard", "alpha", "trouble" },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  extensions = { "lazy" },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_c at right section on winbar
---@diagnostic disable-next-line: unused-local, unused-function
local function ins_winb_left(component)
  table.insert(config.winbar.lualine_b, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

-- Inserts a component in lualine_x at right section on winbar
-- local function ins_winb_right(component)
--   table.insert(config.winbar.lualine_x, component)
-- end

-- Add components to right sections
-- ins_winb_right({
--   "diagnostics",
--   sources = { "nvim_diagnostic" },
--   symbols = { error = " ", warn = " ", info = " " },
--   diagnostics_color = {
--     color_error = { fg = colors.red },
--     color_warn = { fg = colors.yellow },
--     color_info = { fg = colors.cyan },
--   },
-- })
--
-- ins_winb_right({
--   -- Lsp server name
--   function()
--     local msg = "None"
--
--     local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
--     local clients = vim.lsp.get_active_clients()
--     if next(clients) == nil then
--       return msg
--     end
--     for _, client in ipairs(clients) do
--       local filetypes = client.config.filetypes
--       if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--         return client.name
--       end
--     end
--     return msg
--   end,
--   icon = "",
--   color = { fg = "cyan", gui = "bold" },
--   cond = conditions.hide_in_width,
-- })

ins_left({
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 0 },
})

ins_left({
  function()
    -- return "" .. " ?"
    return ""
  end,
  color = { fg = colors.turquoise }, -- Sets highlighting of component
  padding = { left = 1, right = 1 }, -- We don't need space before this
})

ins_left({
  -- mode component
  function()
    local VMode = vim.fn.mode()
    local VUpper = "[" .. string.upper(VMode) .. "]"
    return "   " .. VUpper
    -- u
    -- return " "
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.radioactive,
      i = colors.red,
      v = colors.orange,
      V = colors.orange,
      [""] = colors.turquoise,
      R = colors.blue,
      Rv = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    return { fg = colors.bg, bg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 0, right = 0 },
  separator = { left = " ", right = "" },
})

ins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = "lime", gui = "bold" },
  path = 0,
  symbols = {
    modified = "[+]", -- Text to show when the file is modified.
    readonly = "[]", -- Text to show when the file is non-modifiable or readonly.
    unnamed = "[No Name]", -- Text to show for unnamed buffers.
    newfile = "[New]", -- Text to show for newly created file before first write
  },
})

-- ins_left({
--   ---@return string
--   function()
--    return --[[ "🎵" .. ]] require("custom.music"):player_split()
--   end,
--   color = { fg = colors.turquoise }, -- Sets highlighting of component
--   padding = { left = 1, right = 1 }, -- We don't need space before this
-- })

ins_left({
  -- git branch icon & name
  "branch",
  icon = "",
  color = { fg = colors.orange, gui = "bold" },
  cond = conditions.hide_in_width,
})

ins_left({
  function()
    return "󰌓 " .. require("noice").api.status.command.get()
  end,
  cond = function()
    return package.loaded["noice"] and require("noice").api.status.command.has()
  end,
  padding = { left = 1, right = 1 },
  color = { fg = "violet", gui = "bold" },
})

ins_left({
  require("noice").api.statusline.mode.get,
  cond = require("noice").api.statusline.mode.has,
  color = { fg = "violet", gui = "bold" },
})

ins_left({
  require("lazy.status").updates,
  cond = require("lazy.status").has_updates,
})

ins_left({
  function()
    return "%="
  end,
})

ins_left({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " ", hint = " " },
  diagnostics_color = {
    error = { fg = colors.red },
    warn = { fg = colors.yellow },
    info = { fg = colors.turquoise },
    hint = { fg = colors.magenta },
  },
})

ins_left({
  "diff",
  -- Is it me or the symbol for modified us really weird
  symbols = { added = " ", modified = " ", removed = " " },
  diff_color = {
    added = { fg = colors.lime },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
})

-- ins_right({
--   function()
--     return "%="
--   end,
-- })

ins_right({ wordcount, cond = is_markdown })

ins_right({ readingtime, cond = is_markdown })

ins_right({
  -- filesize component
  "filesize",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.ultraviolet },
  padding = { left = 1, right = 0 },
})

ins_right({
  -- same as location but in % form
  "progress",
  color = { fg = "violet", gui = "bold" },
  padding = { left = 1, right = 0 },
})

ins_right({
  -- cursor location in file component
  "location",
  color = { fg = colors.lime, gui = "bold" },
  padding = { left = 1, right = 0},
})

ins_right({
  -- Lsp server name
  function()
    local msg = "None"
    local clients = vim.lsp.get_clients({ bufnr = 0 })

    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
        return client.name
    end
  end,
  icon = "",
  color = { fg = "cyan", gui = "bold" },
  cond = conditions.hide_in_width,
  padding = { left = 1, right = 0 },
})

ins_right({
  -- filetype / language component
  "filetype",
  colored = true,
  icon_only = false,
  icon = { align = "left" },
  color = { fg = "cyan", gui = "bold" },
  padding = { left = 1, right = 1 },
  cond = conditions.hide_in_width,
})

-- ins_right({
--   "fileformat",
--   fmt = string.upper,
--   icons_enabled = true,
--   color = { fg = colors.white, gui = "bold" },
--   padding = { left = 1, right = 2 },
-- })

ins_right({
  function()
    return "▊"
  end,
  color = { fg = colors.blue },
  padding = { left = 0 },
})

-- Now don't forget to initialize lualine
lualine.setup(config)
