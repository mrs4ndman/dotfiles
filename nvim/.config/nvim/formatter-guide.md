## 2 Formatters right now: 
- ~~Native one `vim.lsp.buf.format()`: <kbd>Leader + F</kbd>~~
- ~~`formatter.nvim`: <kbd>Leader + f + f</kbd>~~

### ~~Need to figure this out / join them, because it is a nightmare~~
- You can just do it like this inside formatter.nvim:
```lua
-- It can be any language that has default formatting from LSP
require("formatter").setup({
  logging = false,
  filetype = {
    lua = {
      require("formatter.filetypes.lua").stylua,
    },
    html = {
      require("formatter.filetypes.html").prettierd,
    },
    javascript = { vim.lsp.buf.format({ async = true }) },
  },
}
```
### Table of languages for each:

|  Language |              Native              | Formatter.nvim        |
| --------- | -------------------------------- | ---------------       |
|  Lua      | Not active                       | Stylua                |
|  TS / JS  | TSServer through formatter.nvim  | Rerouted from native  |
|  HTML     | Not active                       | Prettierd             |

