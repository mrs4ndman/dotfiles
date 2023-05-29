require("auto-session").setup {
    log_level = "error",
    auto_session_suppress_dirs = { "~/", "~/install", "~/Downloads" },
    auto_session_create_enabled = false,
    auto_restore_enabled = false,
    auto_save_enabled = true,
}
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
