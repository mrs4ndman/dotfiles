
```Lua
  require("typescript.extensions.null-ls.code-actions"),
  formatting.black.with({ extra_args = { "--fast" } }),
  formatting.cbfmt.with({ extra_args = { "--best-effort" } }),
  formatting.prettierd.with({
    extra_filetypes = { "toml" },
  }),
  formatting.rustfmt,
  formatting.shfmt,

  -- Formatters
  "cbfmt",
  "eslint",
  "luaformatter",
  "prettierd",
  "rustfmt",
  "shfmt",
  "stylua",
  -- Linters
  "ansible-lint",
  "flake8",
  "shellcheck",
  -- Python
  "black",
  "mypy",
  "pyright",
  "ruff",
```
