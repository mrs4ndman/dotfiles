return function(_, opts)
  local plugin = "nvim-cmp"
  if Use_Defaults(plugin) then
    opts = opts
  else
    -- CMP completions config:
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
    local kind_icons = {
      Class = "󰠱",
      Color = "󰸌",
      Constant = "󰏿",
      Constructor = "",
      Enum = "",
      EnumMember = "",
      Event = "",
      Field = "󰜢",
      File = "󰈙",
      Folder = "󰉋",
      Function = "󰊕",
      Interface = "",
      Keyword = "󰌋",
      Method = "󰆧",
      Module = "",
      Operator = "󰆕",
      Property = "",
      Reference = "",
      Snippet = " ",
      Struct = "",
      Text = "",
      TypeParameter = "󰅲",
      Unit = "",
      Value = "󰎠",
      Variable = "󰀫",
      buffer = "󰦨",
      path = "/",
      nvim_lsp = "λ",
      luasnip = "⋗",
      vsnip = "V",
      nvim_lua = "Π",
      Codeium = "C",
      Tabnine = "T",
    }

    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

    -- cmp.setup({
    local preselect = "item"
    local completion = {
      completeopt = "menu,menuone,noinsert",
    }
    local config = {
      context = {
        in_treesitter_capture = true,
      },
    }

    local window = {
      completion = cmp.config.window.bordered({
        border = "single",
        side_padding = 1,
        col_offset = -3,
        max_width = 80,
      }),
      documentation = cmp.config.window.bordered({
        max_width = 50,
      }),
    }
    local snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    }
    local formatting = {
      -- changing the order of fields so the icon is the first
      fields = { "menu", "abbr", "kind" },

      -- here is where the change happens
      format = function(entry, vim_item)
        vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
        vim_item.menu = ({
          nvim_lsp = "λ",
          luasnip = "⋗",
          nvim_lua = "Π",
          codeium = "󱍋",
          cmp_tabnine = "󱍋",
          buffer = "󰦨",
          path = "/",
          vsnip = "V",
        })[entry.source.name]

        if entry.source.name == "text" then
          vim_item.dup = 0
        end
        if entry.source.name == "nvim_lsp" then
          vim_item.dup = 0
        end

        function Trim(text)
          local max = 40
          if text and text:len() > max then
            text = text:sub(1, max) .. "···"
          end
          return text
        end

        return vim_item
      end,
    }
    local sorting = {
      comparators = {
        cmp.config.compare.locality,
        cmp.config.compare.offset,
        cmp.config.compare.kind,
        cmp.config.compare.recently_used,
        cmp.config.compare.exact,
        cmp.config.compare.length,
        cmp.config.compare.order,
        function(entry1, entry2)
          local result = vim.stricmp(entry1.completion_item.label, entry2.completion_item.label)
          if result < 0 then
            return true
          end
        end,
      },
    }
    local has_words_before = function()
      unpack = unpack or table.unpack
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end
    local mapping = cmp.mapping.preset.insert({
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),
      ["<C-y>"] = cmp.mapping.confirm({ select = true }),
      ["<C-f>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_locally_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-b>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-c>"] = cmp.mapping.abort(),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<Tab>"] = vim.NIL,
      ["<S-Tab>"] = vim.NIL,
    })
    local sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer", options = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      } },
      { name = "codeium" },
      { name = "cmp_tabnine" },
      { name = "emoji" },
      { name = "path" },
      { name = "nvim_lua" },
      -- { name = "buffer-lines" },
      { name = "crates" }, -- crates.nvim plugin
      { name = "vsnip" },
      -- { name = "treesitter" }, -- treesitter integration
    }
    local experimental = {
      ghost_text = {
        hl_group = "CmpGhostText",
      },
    }
    -- CMDLINE SETUP
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      enabled = function()
        local disabled = {
          IncRename = true,
        }
        local cmd = vim.fn.getcmdline():match("%S+")
        return not disabled[cmd] or cmp.close()
      end,
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = { "Man", "!" },
          },
        },
      }),
    })
    --
    -- PASSING VALUES TO THE ORIGINAL OPTS TABLE
    opts.formatting = formatting
    opts.mapping = mapping
    opts.sorting = sorting
    opts.sources = sources
    opts.snippet = snippet
    opts.preselect = preselect
    opts.completion = completion
    opts.config = config
    opts.window = window
    opts.experimental = experimental
  end
end
