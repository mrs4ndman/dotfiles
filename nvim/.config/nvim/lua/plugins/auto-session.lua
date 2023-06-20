-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>sd"] = { "<cmd>SessionDelete<CR>", "Delete current session", { silent = true } },
    ["<leader>sr"] = { "<cmd>SessionRestore<CR>", "Restore session for CWD", { silent = true } },
    ["<leader>ss"] = { "<cmd>SessionSave<CR>", "Save current session", { silent = true } },
})

-- Session manager + session file config
require("auto-session").setup {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/install", "~/Downloads" },
    auto_session_create_enabled = false,
    auto_restore_enabled = false,
    auto_save_enabled = true,
}
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
