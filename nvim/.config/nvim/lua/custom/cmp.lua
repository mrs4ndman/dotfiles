-- Very custom CMP setup
return function(_, opts)
  local plugin = "nvim-cmp"
  if Use_Defaults(plugin) then
    opts = opts
  else
    -- CMP completions config:
    -- Local variables
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    local preselect = cmp.PreselectMode.Item

    local completion = {
      completeopt = "menu,menuone,noinsert",
    }

    local config = {
      context = {
        in_treesitter_capture = true,
      },
    }

    local performance = {
      max_view_entries = 50,
    }

    local matching = {
      disallow_fuzzy_matching = false,
      disallow_fullfuzzy_matching = false,
      disallow_partial_fuzzy_matching = false,
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
      format = require("lspkind").cmp_format({
        with_text = true,
        menu = {
          buffer = "󰦨",
          path = "/",
          nvim_lsp = "λ",
          luasnip = "⋗",
          vsnip = "V",
          nvim_lua = "Π",
          Codeium = "C",
          Tabnine = "T",
          codeium = "󱍋",
          cmp_tabnine = "󱍋",
        },
      }),
      -- Tailwind CSS cmp icons
      require("tailwindcss-colorizer-cmp").formatter,
    }

    local sorting = {
      comparators = {
        cmp.config.compare.locality,
        cmp.config.compare.offset,
        cmp.config.compare.recently_used,
        cmp.config.compare.exact,
        cmp.config.compare.order,
        cmp.config.compare.length,
        function(entry1, entry2)
          local _, entry1_under = entry1.completion_item.label:find("^_+")
          local _, entry2_under = entry2.completion_item.label:find("^_+")
          entry1_under = entry1_under or 0
          entry2_under = entry2_under or 0
          if entry1_under > entry2_under then
            return false
          elseif entry1_under < entry2_under then
            return true
          end
        end,
        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
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
      ["<C-u>"] = cmp.mapping.scroll_docs(-2),
      ["<C-d>"] = cmp.mapping.scroll_docs(2),
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
      { name = "cmp_tabnine" },
      { name = "codeium", keyword_length = 4 },
      {
        name = "buffer",
        options = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
        },
        keyword_length = 5,
        -- priority = 6,
      },
      { name = "luasnip", keyword_length = 2 },
      { name = "path" },
      { name = "emoji" },
      { name = "crates" }, -- crates.nvim plugin
      { name = "nvim_lua" },
      -- { name = "buffer-lines" },
      -- { name = "treesitter" }, -- treesitter integration
    }

    local experimental = {
      ghost_text = {
        hl_group = "CmpGhostText",
      },
    }

    vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

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

    -- PASSING VALUES TO THE ORIGINAL OPTS TABLE
    opts.formatting = formatting
    opts.mapping = mapping
    opts.matching = matching
    opts.performance = performance
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
