Customize = require("mrsandman.customize")
local M = {}

local function _is_enabled(plugin)
  return Customize.plugins[plugin].enabled
end

local function _error_handler(err)
  require("notify")(err)
end

function M.is_enabled(plugin)
  local status, enabled = xpcall(_is_enabled, _error_handler, plugin)
  if not status then
    require("notify")("is_enabled could not find " .. plugin)
  end
  return status and enabled
end

function M.in_tmux()
  return os.getenv("TMUX") ~= nil
end

function M.use_plugin_defaults(plugin)
  return Customize.plugins[plugin].defaults or false
end

return M
