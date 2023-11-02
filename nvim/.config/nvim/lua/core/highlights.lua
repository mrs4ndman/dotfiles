local colors = require("core.colors")

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
  CmpGhostText = { fg = colors.deep_lavender, bg = colors.deep_velvet, force = true },
  Statusline = { bg = "#000000" },
  StatuslineColumnIndicator = { fg = colors.yellow, bg = colors.bg },
  StatuslineCurrentLine = { fg = colors.lime, bg = colors.bg, bold = true },
  StatuslineDapIcon = { fg = colors.lime, bg = colors.bg, bold = true },
  StatuslineFilename = { fg = colors.red, bg = colors.bg, bold = true },
  StatuslineGit = { bg = colors.bg, fg = colors.orange, bold = true },
  StatuslineGitIcon = { fg = colors.orange, bg = colors.bg, bold = true },
  StatuslineItalic = { fg = colors.magenta, bg = colors.bg, italic = true },
  StatuslineLazyIcon = { fg = colors.turquoise, bg = colors.bg, italic = true },
  StatuslineLSPIconNone = { fg = colors.red, bg = colors.bg, bold = true },
  StatuslineLSPIconOk = { fg = colors.lime, bg = colors.bg, bold = true },
  StatuslineNoiceKeys = { fg = colors.magenta, bg = colors.bg },
  StatuslineNoiceMacro = { fg = colors.radioactive, bg = colors.bg },
  StatuslinePosSeparator = { fg = colors.white, bg = colors.bg },
  StatuslineSidemark = { fg = colors.blue, bg = colors.bg },
  StatuslineSpinner = { fg = colors.lime, bg = colors.transparent_black, bold = true },
  StatuslineTitle = { fg = colors.white, bg = colors.bg, bold = true },
  StatuslineTotalLines = { fg = colors.red, italic = true },
  StatuslineWhite = { fg = colors.white, bg = colors.bg, bold = true },
  WinbarTitle = { link = "StatuslineTitle" },
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
