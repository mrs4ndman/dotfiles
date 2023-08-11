## 2 Formatters right now: 
- Native one `vim.lsp.buf.format()`: <kbd>Leader + F</kbd>
- `formatter.nvim`: <kbd>Leader + f + f</kbd>  


### ~~Need to figure this out / join them, because it is a nightmare~~
- You can just do it like this inside formatter.nvim:
```lua
require("formatter").setup({
  -- It can be any language that has default formatting from LSP
  javascript = { vim.lsp.buf.format({ async = true }) }
})
```
### Table of languages for each:

|  Language |              Native              | Formatter.nvim        |
| --------- | -------------------------------- | ---------------       |
|  Lua      | Not active                       | Stylua                |
|  TS / JS  | TSServer through formatter.nvim  | Rerouted from native  |
|  HTML     | Not active                       | Prettierd             |

