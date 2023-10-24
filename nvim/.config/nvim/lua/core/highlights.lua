local colors = {
  bg                   = '#202328',
  fg                   = '#bbc2cf',
  violet               = '#a9a1e1',
  radioactive          = '#FAE500',
  yellow               = '#ECBE7B',
  cyan                 = '#008080',
  pink                 = '#FF00FF',
  darkblue             = '#0037AA',
  turquoise            = '#00CCCC',
  green                = '#98be65',
  lime                 = '#00CC00',
  orange               = '#FF8800',
  sorange              = '#FF6600',
  magenta              = '#c678dd',
  blue                 = '#51afef',
  red                  = '#FF0000',
  white                = '#FFFFFF',
  ultraviolet          = '#CC0099',
  catppuccin_rosewater = '#f5e0dc',
  catppuccin_flamingo  = '#f2cdcd',
  catppuccin_pink      = '#f5c2e7',
  catppuccin_mauve     = '#cba6f7',
  catppuccin_red       = '#f38ba8',
  catppuccin_maroon    = '#eba0ac',
  catppuccin_peach     = '#fab387',
  catppuccin_yellow    = '#f9e2af',
  catppuccin_green     = '#a6e3a1',
  catppuccin_teal      = '#94e2d5',
  catppuccin_sky       = '#89dceb',
  catppuccin_sapphire  = '#74c7ec',
  catppuccin_blue      = '#89b4fa',
  catppuccin_lavender  = '#b4befe',
  catppuccin_base      = '#1e1e2e',
  catppuccin_text      = '#cdd6f4',
  catppuccin_subtext0  = '#a6adc8',
  catppuccin_mantle    = '#181825',
  catppuccin_surface0  = '#313244',
}

-- Groups used for my statusline.
---@type table<string, vim.api.keyset.highlight>
local statusline_groups = {}
for mode, color in pairs {
  Normal = 'radioactive',
  Pending = 'white',
  Visual = 'yellow',
  V_Block = 'ultraviolet',
  V_Line = 'orange',
  Insert = 'red',
  I_Normal = 'radioactive',
  Command = 'cyan',
  Replace = 'blue',
  Other = 'orange',
} do
  statusline_groups['StatuslineMode' .. mode] = { fg = colors.bg, bg = colors[color] }

  statusline_groups['StatuslineModeSeparator' .. mode] = { fg = colors.bg, bg = colors[color] }
end
statusline_groups = vim.tbl_extend('error', statusline_groups, {
  StatuslineItalic = { fg = colors.magenta, italic = true },
  StatuslineSpinner = { fg = colors.lime, bg = colors.transparent_black, bold = true },
  StatuslineTitle = { fg = colors.bright_white, bg = colors.transparent_black, bold = true },
  StatuslineSidemark = { fg = colors.blue, bg = colors.bg },
  StatuslineFilename = { fg = colors.red, bg = colors.bg, bold = true },
  StatuslineGit = { bg = colors.bg, fg = colors.orange, bold = true },
  StatuslineLSP = { fg = colors.white, bold = true },
  StatuslineLSPIcon = { fg = colors.turquoise, bold = true },
  StatuslineCurrentLine = { fg = colors.lime, bold = true },
  StatuslinePosSeparator = { fg = colors.white },
  StatuslineTotalLines = { fg = colors.red, italic = true },
  StatuslineColumnIndicator = { fg = colors.yellow },
})

for group, opts in pairs(statusline_groups) do
  vim.api.nvim_set_hl(0, group, opts)
end

vim.api.nvim_create_autocmd("Colorscheme", {
  callback = function()
    for group, opts in pairs(statusline_groups) do
      vim.api.nvim_set_hl(0, group, opts)
    end
  end
})
