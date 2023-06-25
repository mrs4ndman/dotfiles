-- Mr Sandman's .lua config for NVIM lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "

require("lazy").setup({
    spec = {
        { import = "plugins" },
    },
    defaults = {
        -- lazy = true,
        -- version = "*",
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = {
        enabled = true,
        notify = true,
        frequency = 10800,
    },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
            disabled_plugins = {
                "gzip",
                "tarPlugin",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
-- eof --
