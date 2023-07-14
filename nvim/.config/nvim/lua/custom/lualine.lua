-- Eviline config for lualine, modified by MrSandman
-- Author: shadmansaleh
-- Credit: glepnir
--
-- Slightly modified GeoMetro
-- (if you get it, you get it)
local lualine = require("lualine")
-- Color table for highlights
-- stylua: ignore
local colors = {
    bg          = '#202328',
    fg          = '#bbc2cf',
    yellow      = '#ECBE7B',
    cyan        = '#008080',
    pink        = '#FF00FF',
    darkblue    = '#0037AA',
    turquoise   = '#00CCCC',
    green       = '#98be65',
    lime        = '#00CC00',
    orange      = '#FF8800',
    sorange     = '#FF6600',
    violet      = '#a9a1e1',
    magenta     = '#c678dd',
    blue        = '#51afef',
    red         = '#FF0000',
    ultraviolet = '#CC0099',
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

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = "auto",
    globalstatus = true,
    disabled_filetypes = {
      statusline = { "dashboard", "alpha" },
      winbar = {
        "help",
        "alpha",
        "lazy",
        "Trouble",
      },
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
local function ins_winb_left(component)
  table.insert(config.winbar.lualine_b, component)
end

-- Inserts a component in lualine_x at right section on winbar
local function ins_winb_right(component)
  table.insert(config.winbar.lualine_x, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_winb_left({
  -- "navic",
  -- function()
  --   return require("nvim-navic").get_location()
  -- end,
  -- --[[ conditions.hide_in_width, ]]
  -- cond = function()
  --   return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
  -- end,
})

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
    return ""
  end,
  color = { fg = colors.lime }, -- Sets highlighting of component
  padding = { left = 1, right = 1 }, -- We don't need space before this
})

ins_left({
  -- mode component
  function()
    return ""
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.pink,
      i = colors.turquoise,
      v = colors.orange,
      [""] = colors.blue,
      V = colors.sorange,
      c = colors.green,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [""] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ["r?"] = colors.cyan,
      ["!"] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 0, right = 1 },
})

ins_left({
  "filename",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.red, gui = "bold" },
  path = 0,
})

ins_left({
  -- git branch icon & name
  "branch",
  icon = "",
  color = { fg = colors.orange, gui = "bold" },
  cond = conditions.hide_in_width,
})

ins_left({
  function()
    return require("noice").api.status.command.get()
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

ins_left {
    require("lazy.status").updates,
    cond = require("lazy.status").has_updates,
}

ins_left({
  function()
    return "%="
  end,
})

ins_left({
  -- Lsp server name
  function()
    local msg = "None"

    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = "",
  color = { fg = "cyan", gui = "bold" },
  cond = conditions.hide_in_width,
})

ins_left({
  -- filetype / language component
  "filetype",
  colored = true,
  icon_only = false,
  icon = { align = "left" },
  color = { fg = "cyan", gui = "bold" },
  padding = { left = 1, right = 0 },
  cond = conditions.hide_in_width,
})

ins_left({
  -- filesize component
  "filesize",
  cond = conditions.buffer_not_empty,
  color = { fg = colors.cyan },
  padding = { left = 1, right = 0 },
})

ins_left({
  -- cursor location in file component
  "location",
  color = { fg = colors.lime, gui = "bold" },
  padding = { left = 1, right = 0 },
})

ins_left({
  -- same as location but in % form
  "progress",
  color = { fg = colors.ultraviolet, gui = "bold" },
  padding = { left = 1, right = 0 },
})
ins_left({
  function()
    return "%="
  end,
})

ins_right({
  "diagnostics",
  sources = { "nvim_diagnostic" },
  symbols = { error = " ", warn = " ", info = " " },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },

})

ins_right({
  "diff",
  -- Is it me or the symbol for modified us really weird
  symbols = { added = " ", modified = "柳", removed = " " },
  diff_color = {
    added = { fg = colors.lime },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
})


ins_right({
  "fileformat",
  fmt = string.upper,
  icons_enabled = true,
  color = { fg = colors.white, gui = "bold" },
  padding = { left = 1, right = 2 },
})
--
-- Now don't forget to initialize lualine
lualine.setup(config)
