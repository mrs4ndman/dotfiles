require("hbac").setup({
    autoclose = false,
    threshold = 10,
    close_command = function(bufnr)
        vim.api.nvim_buf_delete(bufnr, {})
    end,
    close_buffers_with_windows = false,
})

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>vp"] = { require("hbac").toggle_pin, "Toggle HBAC pin", { silent = true } },
    ["<leader>vo"] = { require("hbac").close_unpinned, "Close unpinned", { silent = true } },
})
