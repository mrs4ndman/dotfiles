vim.notify = require("notify")

local wk = require("which-key")
wk.register({
    ["<leader>Cn"] = { function()
        require("notify").dismiss({ silent = true, pending = true })
    end, "Dismiss all Notifications" }
})
