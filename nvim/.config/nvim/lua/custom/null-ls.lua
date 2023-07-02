
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting
-- local hover = null_ls.builtins.hover
local completion = null_ls.builtins.completion

local sources = {
    -- Formatters
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.cbfmt.with({ extra_args = { "--best-effort" } }),
    formatting.prettierd.with({
        extra_filetypes = { "toml" },
    }),
    formatting.rustfmt,
    formatting.shfmt,
    -- formatting.eslint_d,
    -- formatting.ruff,
    -- formatting.lua_format,
    -- formatting.stylua,

    -- Diagnostics
    -- diagnostics.eslint_d,
    diagnostics.mypy,
    diagnostics.ruff,
    -- diagnostics.shellcheck,
    -- diagnostics.flake8,

    -- Code actions
    require("typescript.extensions.null-ls.code-actions"),
    -- code_actions.eslint_d,
    -- code_actions.shellcheck,
}


null_ls.setup({
    sources = sources,
    -- AUTO-FORMATTING FOR THOSE THAT NEED IT
    -- on_attach = function(client, bufnr)
    --     if client.supports_method("textDocument/formatting") then
    --         vim.api.nvim_clear_autocmds({
    --             group = augroup,
    --             buffer = bufnr,
    --         })
    --         vim.api.nvim_create_autocmd("BufWritePre", {
    --             group = augroup,
    --             buffer = bufnr,
    --             callback = function()
    --                 vim.lsp.buf.format({ bufnr = bufnr })
    --             end
    --         })
    --     end
    -- end
})
