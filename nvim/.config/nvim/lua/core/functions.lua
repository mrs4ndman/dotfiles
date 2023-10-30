local M = {}

--- Go to or create the *`n`*th tab
---@param n integer 
function M.tabnm(n)
  return function()
    local tabs = vim.api.nvim_list_tabpages()
    if n > #tabs then
      vim.cmd("$tabnew")
    else
      local tabpage = tabs[n]
      vim.api.nvim_set_current_tabpage(tabpage)
    end
  end
end

---@param chars string
function M.put_at_end(chars)
  local pos = vim.api.nvim_win_get_cursor(0)
  local row = pos[1] - 1
  local current_line = vim.api.nvim_get_current_line()
  local col = #current_line

  vim.api.nvim_buf_set_text(0, row, col, row, col, { chars })
end

---@param chars string
function M.put_at_beginning(chars)
  local pos = vim.api.nvim_win_get_cursor(0)
  local row = pos[1] - 1
  local col = 0
  vim.api.nvim_buf_set_text(0, row, col, row, col, { chars })
end

return M
