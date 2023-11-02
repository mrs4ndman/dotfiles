local M = {}

M.winbar = function()

end
---@return string
function M.filename_component()

  local dirname = vim.fn.expand("%:p:h")

  if vim.bo.filetype == "oil" then
    dirname = tostring(dirname):sub(7)
  end

  return string.format("%%#WinbarTitle# %s", dirname)
end



--- Renders the winbar
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
      M.filename_component(),
      "%#Statusline#",
    }),
    ""
  })
end

vim.o.winbar = "%!v:lua.require'core.winbar'.render()"

return M
