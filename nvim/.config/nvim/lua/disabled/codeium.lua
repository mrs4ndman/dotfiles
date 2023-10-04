return {
  "Exafunction/codeium.vim",
  enabled = false,
  event = "VimEnter",
  config = function()
    vim.g.codeium_disable_bindings = 1
    vim.keymap.set("i", "<C-s>", function() return vim.fn["codeium#Complete"]() end, { silent = true, expr = true })
    vim.keymap.set("i", "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
    vim.keymap.set("i", "<C-.>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
    vim.keymap.set("i", "<C-l>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
  end
}
