
-- TELESCOPE
local builtin = require('telescope.builtin')

-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>tf"] = { builtin.find_files, "Find files", { silent = true } },
    ["<leader>tg"] = { builtin.git_files, "Git files", { silent = true } },
    ["<leader>tb"] = { builtin.buffers, "List buffers", { silent = true } },
    ["<leader>tr"] = { builtin.oldfiles, "Recent files", { silent = true } },
    ["<leader>tl"] = { builtin.loclist, "Proyect loclist", { silent = true } },
    ["<leader>vh"] = { builtin.help_tags, "Help tags", { silent = true }},
    ["<leader>ts"] = { function() builtin.grep_string ({ search = vim.fn.input("Grep > ") }) ; end, "Grep through files", { silent = true } },
})


-- Extension invoking:

pcall(require('telescope').load_extension 'fzf')
pcall(require('telescope').load_extension 'neoclip')

