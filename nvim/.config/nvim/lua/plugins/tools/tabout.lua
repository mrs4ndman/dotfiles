Customize = require("mrsandman.customize")
local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

local plugin = "tabout.nvim"

-- Lua tabout finally working
return {
  "abecodes/" .. plugin,
  enabled = Is_Enabled(plugin),
  event = "InsertEnter",
  dependencies = { "nvim-treesitter/nvim-treesitter" }, -- parsing to the end of time
  config = function()
    require("tabout").setup({
      tabkey = "<Tab>",
      backwards_tabkey = "<S-Tab>",
      act_as_tab = true,
      act_as_shift_tab = false,
      enable_backwards = true,
      completion = true,
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
        { open = "<", close = ">" },
        -- {open = ':', close = ':'} -- Rust maybe?
      },
      ignore_beginning = true,
      exclude = {},
    })
  end,
}
