-- Cokeline custom config:

local get_hl_attr = require("cokeline.hlgroups").get_hl_attr
local mappings = require("cokeline.mappings")

local comments_fg = get_hl_attr("Comment", "fg")
local errors_fg = get_hl_attr("DiagnosticError", "fg")
local warnings_fg = get_hl_attr("DiagnosticWarn", "fg")

local red = vim.g.terminal_color_1
local yellow = vim.g.terminal_color_3

-- Custom buffer sorting function
local function harpoon_sorter()
  local harpoon = require("harpoon.mark")
  local cache = {}

  local function marknum(buf, force)
    local b = cache[buf.number]
    if b == nil or force then
      b = harpoon.get_index_of(buf.path)
      cache[buf.number] = b
    end
    return b
  end

  harpoon.on("changed", function()
    for _, buf in ipairs(require("cokeline.buffers").get_visible()) do
      cache[buf.number] = marknum(buf, true)
    end
  end)

  return function(a, b)
    local ma = marknum(a)
    local mb = marknum(b)
    if ma and not mb then
      return true
    elseif mb and not ma then
      return false
    elseif ma == nil and mb == nil then
      ma = a.index
      mb = b.index
    end
    return ma < mb
  end
end

-- Start of components table
local components = {
  space = { text = " ", truncation = { priority = 1 } },
  two_spaces = { text = "  ", truncation = { priority = 1 } },
  separator = {
    text = function(buffer) return buffer.index ~= 1 and "▏" or "" end,
    truncation = { priority = 1 },
  },
  devicon = {
    text = function(buffer)
      return (mappings.is_picking_focus() or mappings.is_picking_close()) and buffer.pick_letter .. " "
        or buffer.devicon.icon
    end,
    fg = function(buffer)
      return (mappings.is_picking_focus() and yellow) or (mappings.is_picking_close() and red) or buffer.devicon.color
    end,
    style = function(_)
      return (mappings.is_picking_focus() or mappings.is_picking_close()) and "italic,bold" or nil
    end,
    truncation = { priority = 1 },
  },

  index = {
    text = function(buffer) return buffer.index .. " 󰁎 " end,
    truncation = { priority = 1 },
  },

  unique_prefix = {
    text = function(buffer)
      return buffer.unique_prefix
    end,
    fg = comments_fg,
    style = "italic",
    truncation = { priority = 3, direction = "left" },
  },

  filename = {
    text = function(buffer)
      return buffer.filename
    end,
    style = function(buffer)
      return ((buffer.is_focused and buffer.diagnostics.errors ~= 0) and "bold,underline")
        or (buffer.is_focused and "bold")
        or (buffer.diagnostics.errors ~= 0 and "underline")
        or nil
    end,
    truncation = { priority = 2, direction = "left" },
  },

  diagnostics = {
    text = function(buffer)
      return (buffer.diagnostics.errors ~= 0 and " 󰅚 " .. buffer.diagnostics.errors)
        or (buffer.diagnostics.warnings ~= 0 and "  " .. buffer.diagnostics.warnings)
        or ""
    end,
    fg = function(buffer)
      return (buffer.diagnostics.errors ~= 0 and errors_fg) or (buffer.diagnostics.warnings ~= 0 and warnings_fg) or nil
    end,
    truncation = { priority = 1 },
  },

  close_or_unsaved = {
    text = function(buffer)
      return buffer.is_modified and "●" or "󰅖"
    end,
    fg = function(buffer)
---@diagnostic disable-next-line: undefined-global
      return buffer.is_modified and green or nil
    end,
    delete_buffer_on_left_click = true,
    truncation = { priority = 1 },
  },
}

require("cokeline").setup({
  show_if_buffers_are_at_least = 5,
  buffers = {
    focus_on_delete = "next",
    filter_valid = function(buffer) return buffer.filetype ~= "netrw" or "oil" end,
    filter_visible = function(buffer) return buffer.filename ~= "netrw" or "oil" end,
    new_buffers_position = harpoon_sorter()
  },

  rendering = { max_buffer_width = 30 },

  pick = { use_filename = false },

  default_hl = {
    fg = function(buffer)
      return buffer.is_focused and get_hl_attr("Normal", "fg") or get_hl_attr("Comment", "fg")
    end,
    bg = get_hl_attr("Background", "bg"),
  },

  -- We join the whole table and pass it on
  components = {
    components.space,
    components.separator,
    components.space,
    components.unique_prefix,
    components.index,
    components.devicon,
    components.filename,
    components.diagnostics,
    components.two_spaces,
    components.close_or_unsaved,
    components.space,
  },
})