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
        { import = "plugins.telescope" },
        { import = "plugins.ui" },
        { import = "plugins.colorschemes" },
        { import = "plugins.treesitter" },
        { import = "plugins.external"},
        { import = "plugins.folke" },
        { import = "plugins.tpope" },
        { import = "plugins.primeagen" },
        { import = "plugins.debugging" },
        { import = "plugins.functions" },
        { import = "plugins.lsp" },
        { import = "plugins.pairs" },
        { import = "plugins.alpha" },
    },
    checker = {
        enabled = true,
        notify = true,
        frequency = 10800,
    },
    performance = {
        cache = {
            enabled = true,
        },
    }
})
-- eof --
