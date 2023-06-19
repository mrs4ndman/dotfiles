local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

local sources = {
    -- Formatters
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.cbfmt.with({ extra_args = { "--best-effort" } }),
    formatting.eslint_d,
    formatting.prettierd.with({
        extra_filetypes = { "toml" },
    }),
    formatting.rustfmt,
    formatting.shfmt,
    -- formatting.luaformatter,
    formatting.stylua,

    -- Diagnostics
    diagnostics.eslint_d,
    diagnostics.shellcheck,

    -- Code actions
    code_actions.eslint_d,
    code_actions.shellcheck,
    code_actions.flake8,
}

null_ls.setup({ sources = sources })
