require("notify").setup({
    timeout = 3000,
    stages = "fade",
    icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "✎",
    },
    background_colour = "#282A36"
})
