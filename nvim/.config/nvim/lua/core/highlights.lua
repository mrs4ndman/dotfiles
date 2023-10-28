local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  violet = "#a9a1e1",
  radioactive = "#FAE500",
  yellow = "#ECBE7B",
  cyan = "#008080",
  pink = "#FF00FF",
  darkblue = "#0037AA",
  turquoise = "#00CCCC",
  green = "#98be65",
  lime = "#00CC00",
  orange = "#FF8800",
  sorange = "#FF6600",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#FF0000",
  white = "#FFFFFF",
  ultraviolet = "#CC0099",
}

-- Groups used for my statusline.
---@type table<string, vim.api.keyset.highlight>
local statusline_groups = {}
for mode, color in pairs({
  Normal = "radioactive",
  Pending = "white",
  Visual = "yellow",
  V_Block = "ultraviolet",
  V_Line = "orange",
  Insert = "red",
  I_Normal = "radioactive",
  Command = "cyan",
  Replace = "blue",
  Other = "orange",
}) do
  statusline_groups["StatuslineMode" .. mode] = { fg = colors.bg, bg = colors[color] }

  statusline_groups["StatuslineModeSeparator" .. mode] = { fg = colors.bg, bg = colors[color] }
end
statusline_groups = vim.tbl_extend("error", statusline_groups, {
  Statusline = { bg = "#000000" },
  StatuslineColumnIndicator = { fg = colors.yellow, bg = colors.bg },
  StatuslineCurrentLine = { fg = colors.lime, bg = colors.bg, bold = true },
  StatuslineDapIcon = { fg = colors.lime, bg = colors.bg, bold = true },
  StatuslineFilename = { fg = colors.red, bg = colors.bg, bold = true },
  StatuslineGit = { bg = colors.bg, fg = colors.orange, bold = true },
  StatuslineGitIcon = { fg = colors.orange, bg = colors.bg, bold = true },
  StatuslineItalic = { fg = colors.magenta, bg = colors.bg, italic = true },
  StatuslineLazyIcon = { fg = colors.turquoise, bg = colors.bg, italic = true },
  StatuslineLSPIconOk = { fg = colors.lime, bg = colors.bg, bold = true },
  StatuslineLSPIconNone = { fg = colors.red, bg = colors.bg, bold = true },
  StatuslineNoiceKeys = { fg = colors.magenta, bg = colors.bg },
  StatuslineNoiceMacro = { fg = colors.radioactive, bg = colors.bg },
  StatuslinePosSeparator = { fg = colors.white, bg = colors.bg },
  StatuslineSidemark = { fg = colors.blue, bg = colors.bg },
  StatuslineSpinner = { fg = colors.lime, bg = colors.transparent_black, bold = true },
  StatuslineTitle = { fg = colors.white, bg = colors.bg, bold = true },
  StatuslineTotalLines = { fg = colors.red, italic = true },
  StatuslineWhite = { fg = colors.white, bg = colors.bg, bold = true },
  CmpGhostText = { fg = colors.violet, italic = true },
})

for group, opts in pairs(statusline_groups) do
  vim.api.nvim_set_hl(0, group, opts)
end

vim.api.nvim_create_autocmd("Colorscheme", {
  callback = function()
    for group, opts in pairs(statusline_groups) do
      vim.api.nvim_set_hl(0, group, opts)
    end
  end,
})
