
-- CMP completions config:
local cmp = require("cmp")
local luasnip = require("luasnip")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local ts_utils = require("nvim-treesitter.ts_utils")
local kind_icons = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Folder = "󰉋",
    Reference = "",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
}

vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })

cmp.setup({
    preselect = "item",
    completion = {
        completeopt = "menu,menuone,noinsert",
    },
    config = {
        context = {
            in_treesitter_capture = true,
        }
    },
    window = {
        completion = cmp.config.window.bordered({
            border = "single",
            side_padding = 1,
            col_offset = -3,
            max_width = 80,
        }),
        documentation = cmp.config.window.bordered({
            max_width = 50,
        }),
    },
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    formatting = {
        -- changing the order of fields so the icon is the first
        fields = { "menu", "abbr", "kind" },

        -- here is where the change happens
        format = function(entry, vim_item)
            vim_item.menu = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

            vim_item.menu = ({
                buffer = "󰦨",
                path = "/",
                nvim_lsp = "λ",
                luasnip = "⋗",
                vsnip = "V",
                nvim_lua = "Π",
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
    },
    sorting = {
        comparators = {
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            cmp.config.compare.length,
            function(entry1, entry2)
                local result = vim.stricmp(entry1.completion_item.label, entry2.completion_item.label)
                if result < 0 then
                    return true
                end
            end
        },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-c>"] = cmp.mapping.abort(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<Tab>"] = vim.NIL,
        ["<S-Tab>"] = vim.NIL,
    }),
    sources = {
        { name = "path" },
        { name = "crates" }, -- crates.nvim plugin
        { name = "nvim_lua" },
        { name = "luasnip" },
        { name = "vsnip" },
        { name = "treesitter" }, -- treesitter integration
        -- { name = 'cmdline' },
        {
            name = "buffer",
            options = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end,
            },
        },
        { name = "nvim_lsp" },
    },
    experimental = {
        ghost_text = {
            hl_group = "CmpGhostText",
        },
    },
})
