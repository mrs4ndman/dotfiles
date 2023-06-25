require("notify").setup {
    stages = "fade",
    timeout = 1750,
    fps = 60,
    render = "compact",
    max_height = function()
        return math.floor(vim.o.lines * 0.75)
    end,
    max_width = function()
        return math.floor(vim.o.columns * 0.75)
    end,
}

-- Notify config
vim.notify = require("notify")

