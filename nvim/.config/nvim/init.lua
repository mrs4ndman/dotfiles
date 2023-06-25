-- require doesn't crash the config
local function safeRequire(module)
    local success, loadedModule = pcall(require, module)
    if success then return loadedModule end
    vim.notify_once("Error loading " .. module .. " module into Neovim")
end

-- Main config file
safeRequire("mrsandman")

-- Custom plugin configs that load after most things
safeRequire("custom")

-- Language-specific configs
safeRequire("langs")
