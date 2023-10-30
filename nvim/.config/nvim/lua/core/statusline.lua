local icons = require("core.icons")

local M = {}

vim.g.qf_disable_statusline = 1

vim.o.showmode = false

--- Keep track of the created HL groups
---@type table<string, boolean>
local statusline_hls = {}

---@param hl string
---@return string
function M.get_or_create_hl(hl)
  local hl_name = "Statusline" .. hl
  if not statusline_hls[hl] then
    local bg_hl = vim.api.nvim_get_hl(0, { name = "StatusLine" })
    local fg_hl = vim.api.nvim_get_hl(0, { name = hl })

    vim.api.nvim_set_hl(0, hl_name, { bg = ("#%06x"):format(bg_hl.bg), fg = ("#%06x"):format(fg_hl.fg) })
    statusline_hls[hl] = true
  end

  return hl_name
end

--- Current mode module
---@return string
function M.mode_component()
  -- Note that: \19 = ^S and \22 = ^V.
  local mode_to_str = {
    ["n"] = "NORMAL",
    ["no"] = "OP-PENDING",
    ["nov"] = "OP-PENDING",
    ["noV"] = "OP-PENDING",
    ["no\22"] = "OP-PENDING",
    ["niI"] = "I-NORMAL",
    ["niR"] = "NORMAL",
    ["niV"] = "NORMAL",
    ["nt"] = "NORMAL",
    ["ntT"] = "NORMAL",
    ["v"] = "VISUAL",
    ["vs"] = "VISUAL",
    ["V"] = "V-LINE",
    ["Vs"] = "V-LINE",
    ["\22"] = "V-BLOCK",
    ["\22s"] = "V-BLOCK",
    ["s"] = "SELECT",
    ["S"] = "SELECT",
    ["\19"] = "SELECT",
    ["i"] = "INSERT",
    ["ic"] = "INSERT",
    ["ix"] = "INSERT",
    ["R"] = "REPLACE",
    ["Rc"] = "REPLACE",
    ["Rx"] = "REPLACE",
    ["Rv"] = "VIRT REPLACE",
    ["Rvc"] = "VIRT REPLACE",
    ["Rvx"] = "VIRT REPLACE",
    ["c"] = "COMMAND",
    ["cv"] = "VIM EX",
    ["ce"] = "EX",
    ["r"] = "PROMPT",
    ["rm"] = "MORE",
    ["r?"] = "CONFIRM",
    ["!"] = "SHELL",
    ["t"] = "TERMINAL",
  }
  local mode = mode_to_str[vim.api.nvim_get_mode().mode] or "UNKNOWN"

  local hl = "Other"
  if mode:find("NORMAL") then
    hl = "Normal"
  elseif mode:find("PENDING") then
    hl = "Pending"
  elseif mode:find("REPLACE") then
    hl = "Replace"
  elseif mode:find("VISUAL") then
    hl = "Visual"
  elseif mode:find("V-LINE") then
    hl = "V_LINE"
  elseif mode:find("V-BLOCK") then
    hl = "V_BLOCK"
  elseif mode:find("I-NORMAL") then
    hl = "I_Normal"
  elseif mode:find("INSERT") or mode:find("SELECT") then
    hl = "Insert"
  elseif mode:find("COMMAND") or mode:find("TERMINAL") or mode:find("EX") then
    hl = "Command"
  end

  return table.concat({
    string.format("%%#StatuslineModeSeparator%s#   ", hl),
    string.format("%%#StatuslineMode%s#%s", hl, mode),
    string.format("%%#StatuslineModeSeparator%s#  %%", hl),
  })
end

--- Filename (if any)
---@return string
function M.filename_component()
  ---@diagnostic disable-next-line: unused-local
  local default_options = {
    symbols = {
      modified = " [+]", -- Text to show when the file is modified.
      readonly = " [  ]", -- Text to show when the file is non-modifiable or readonly.
      unnamed = "[No Name]", -- Text to show for unnamed buffers.
      newfile = "[New]", -- Text to show for newly created file before first write
    },
    file_status = true,
    newfile_status = false,
    path = 0,
    shorting_target = 40,
  }

  local filename = vim.fn.expand("%:t")

  if filename == "" then
    filename = "[No Name]"
  end
  if vim.fn.mode() == "t" then
    local terminalName = "%t"
    return string.format("%%#StatuslineWhite# %s", terminalName)
  end

  if vim.bo.modified and vim.bo.modifiable then
    filename = filename .. default_options.symbols.modified
  end
  if (not vim.bo.modifiable) or vim.bo.readonly then
    filename = filename .. default_options.symbols.readonly
  end

  -- local relpath = "%f%m%r"
  return string.format("%%#StatuslineFilename# %s", filename)
end

--- Git status (if any)
---@return string

function M.git_component()
  local check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
  local head = vim.b.gitsigns_head
  if (not head) or not check_git_workspace then
    return ""
  end
  return string.format("%%#StatuslineGit# %s", head)
end

--- Noice key status
---@return string
function M.noice_macro()
  if not package.loaded["noice"] then
    return ""
  end
  local callStatement = require("noice").api.status.mode.get()
  if callStatement == nil then
    return ""
  end
  return string.format("%%#StatuslineNoiceMacro#󱐋%%#StatuslineWhite# %s", callStatement)
end

--- Noice key status
---@return string
function M.noice_keys()
  if not package.loaded["noice"] then
    return ""
  end
  local noiceCommand = require("noice").api.statusline.command.get()
  return string.format("%%#StatuslineNoiceKeys#󰌓 %s", noiceCommand)
end

--- The current debugging status (if any)
---@return string?
function M.dap_component()
  if not package.loaded["dap"] or require("dap").status() == "" then
    return ""
  end
  return string.format("%%#%s#%s%%#StatuslineWhite# %s", M.get_or_create_hl("DapUIRestart"), icons.misc.bug, require("dap").status())
end

--- Keep track of LSP progress
---@type table<string, string?>
local progress_status = {
  client = nil,
  kind = nil,
  title = nil,
}

vim.api.nvim_create_autocmd("LspProgress", {
  group = vim.api.nvim_create_augroup("mrsandman/statusline", { clear = true }),
  desc = "Update LSP progress in statusline",
  pattern = { "begin", "end" },
  callback = function(args)
    if not args.data then
      return
    end

    progress_status = {
      client = vim.lsp.get_client_by_id(args.data.client_id).name,
      kind = args.data.result.value.kind,
      title = args.data.result.value.title,
    }

    if progress_status.kind == "end" then
      progress_status.title = nil
      -- Wait a bit before clearing the status.
      vim.defer_fn(function()
        vim.cmd.redrawstatus()
      end, 3000)
    else
      vim.cmd.redrawstatus()
    end
  end,
})

--- The latest LSP progress message (might disable this in favor of noice)
---@return string
function M.lsp_progress_component()
  if not progress_status.client or not progress_status.title then
    return ""
  end
  return table.concat({
    "%#StatuslineSpinner#󱥸 ",
    string.format("%%#StatuslineTitle#%s  ", progress_status.client),
    string.format("%%#StatuslineItalic#%s...", progress_status.title),
  })
end

local last_diagnostic_component = ""

--- Diagnostic counts in the current buffer.
---@return string
function M.diagnostics_component()
  -- Use the last computed value if in insert mode (not updating until normal mode)
  if vim.startswith(vim.api.nvim_get_mode().mode, "i") then
    return last_diagnostic_component
  end

  local counts = vim.iter(vim.diagnostic.get(0)):fold({
    ERROR = 0,
    WARN = 0,
    HINT = 0,
    INFO = 0,
  }, function(acc, diagnostic)
    local severity = vim.diagnostic.severity[diagnostic.severity]
    acc[severity] = acc[severity] + 1
    return acc
  end)

  local parts = vim.iter.map(function(severity, count)
    if count == 0 then
      return nil
    end
    local hl = "Diagnostic" .. severity:sub(1, 1) .. severity:sub(2):lower()
    return string.format("%%#%s#%s %d", M.get_or_create_hl(hl), icons.diagnostics[severity], count)
  end, counts)

  return table.concat(parts, " ")
end

--- The buffer's filetype.
---@return string
function M.filetype_component()
  local devicons = require("nvim-web-devicons")

  local special_icons = {
    DressingInput = { "󰍩 ", "Comment" },
    DressingSelect = { " ", "Comment" },
    dapui_breakpoints = { icons.misc.bug, "StatuslineDapIcon" },
    dapui_scopes = { icons.misc.bug, "StatuslineDapIcon" },
    dapui_stacks = { icons.misc.bug, "StatuslineDapIcon" },
    gitcommit = { " ", "StatuslineGitIcon" },
    gitrebase = { " ", "StatuslineGitIcon" },
    lazy = { icons.misc.lazy, "StatuslineLazyIcon" },
    TelescopePrompt = { icons.misc.telescope, "Comment" },
    lazyterm = { " ", "Comment" },
    qf = { icons.misc.search, "Comment" },
    alpha = { icons.misc.alpha, "Comment" },
    oil = { icons.misc.oil, "StatuslineColumnIndicator" },
    -- OverseerList = { "󰦬", "Special" },
    -- spectre_panel = { icons.misc.search, "String" },
  }

  local filetype = vim.bo.filetype
  if filetype == "" then
    filetype = "[No Name]"
  end

  local icon, icon_hl
  if special_icons[filetype] then
    icon, icon_hl = unpack(special_icons[filetype])
  else
    local buf_name = vim.api.nvim_buf_get_name(0)
    local name, ext = vim.fn.fnamemodify(buf_name, ":t"), vim.fn.fnamemodify(buf_name, ":e")

    icon, icon_hl = devicons.get_icon(name, ext)
    if not icon then
      icon, icon_hl = devicons.get_icon_by_filetype(filetype, { default = true })
    end
  end
  icon_hl = M.get_or_create_hl(icon_hl)

  return string.format("%%#%s#%s %%#StatuslineTitle#%s", icon_hl, icon, filetype)
end

--- LSP name return
---@return string
function M.lsp_component()
  -- local encoding = vim.opt.fileencoding:get()
  -- return encoding ~= "" and string.format("%%#StatuslineModeSeparatorOther# %s", encoding) or ""
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  local icon = " "

  if next(clients) == nil then
    return string.format("%%#StatuslineLSPIconNone#%s %%#StatuslineWhite# None ", icon)
  end
  for _, client in ipairs(clients) do
    return clients ~= "" and string.format("%%#StatuslineLSPIconOk#%s %%#StatuslineWhite#%s", icon, client.name) or ""
  end
end

--- The current line, total line count, and column position.
---@return string
function M.position_component()
  local line = vim.fn.line(".")
  local line_count = vim.api.nvim_buf_line_count(0)
  local col = vim.fn.virtcol(".")

  return table.concat({
    -- "%#StatuslinePosSeparator#l: ",
    string.format("%%#StatuslineCurrentLine#%d", line),
    string.format("%%#StatuslinePosSeparator#/%d", line_count),
    string.format(":%%#StatuslineColumnIndicator#%d", col),
  })
end
--- Lazy package updates for the session
---@return string
function M.lazy_updates()
  if not package.loaded["lazy"] or not require("lazy.status").has_updates() then
    return ""
  end
  return table.concat({
    string.format("%%#StatuslineLazyIcon# %s", string.sub((require("lazy.status").updates()), 1, 3)),
    string.format("%%#StatuslineWhite#%s", string.sub((require("lazy.status").updates()), 4, 5)),
  })
end
---@return string
function M.current_time()
  local time = string.sub(tostring(os.date()), 13)
  return string.format("%%#StatuslineTime# %s", time)
end

--- Current formatter for the buffer
---@return string
function M.formatter_component()
  local formatterIcon = " 󰺬 "
  if not package.loaded["conform"] then
    return string.format("%%#StatuslineLSPIconNone#%s%%#StatuslineWhite#None", formatterIcon)
  end
  local formatterSource = require("conform").list_formatters_for_buffer(0)
  local formatterName = string.format("%s", table.concat(formatterSource))
  if package.loaded["conform"] and (formatterName == (nil or "")) then
    return string.format("%%#StatuslineLSPIconNone#%s None", formatterIcon)
  end
  return table.concat({
    string.format(" %%#StatuslineLSPIconOk#󰺦  %%#StatuslineWhite#%s", formatterName),
  })
end

--- Side marks, a la Doom-Emacs
---@return string
function M.side_marks_component()
  return string.format("%%#StatuslineSidemark#▊")
end

--- Renders the statusline.
---@return string
function M.render()
  ---@param components string[]
  ---@return string
  local function concat_components(components)
    return vim.iter(components):skip(1):fold(components[1], function(acc, component)
      return #component > 0 and string.format("%s  %s", acc, component) or acc
    end)
  end

  return table.concat({
    concat_components({
      M.side_marks_component(),
      M.mode_component(),
      M.filename_component(),
      M.git_component(),
      M.noice_keys(),
      M.noice_macro(),
      M.lazy_updates(),
      "%#Statusline#%=",
    }),
    concat_components({
      M.dap_component(),
      --[[ M.lsp_progress_component() ]]
      M.diagnostics_component(),
    }),
    concat_components({
      "%#Statusline#%=",
      M.formatter_component(),
      M.lsp_component(),
      M.filetype_component(),
      M.position_component(),
      -- M.current_time(),
      M.side_marks_component(),
    }),
    "",
  })
end

vim.o.statusline = "%!v:lua.require'core.statusline'.render()"
return M
