return {
    -- 3.- Theme plugins config
    -- Remember previous colorscheme
    { 'raddari/last-color.nvim',          priority = 1000 },
    {
        'rose-pine/neovim', -- the coolest color scheme B)
        lazy = true,
        name = 'rose-pine',
        priority = 1000,
        opts = {
            variant = 'main',
            dark_variant = 'main',
            bold_vert_split = true,
            disable_background = true,
            disable_float_background = true,
        },
    },

    {
        'folke/tokyonight.nvim',
        event = "VimEnter",
        priority = 1000,
        opts = {
            style = "night",
            light_style = "day",
            transparent = false,
            styles = {
                comments = { italic = true },
                keywords = { italic = true },
                functions = {},
                variables = {},
                sidebars = "dark",
                floats = "dark",
            },
            hide_inactive_statusline = false,
            dim_inactive = true,
            lualine_bold = false,
        },
    },
    {
        'catppuccin/nvim',
        lazy = true,
        name = "catppuccin",
        priority = 1000,
        opts = {
            flavour = "mocha",
            background = { light = "latte", dark = "mocha" },
            transparent_background = false,
            show_end_of_buffer = false,
            dim_inactive = { enabled = false, shade = "dark", percentage = 0.2 },
            integrations = {
                aerial = true,
                alpha = true,
                cmp = true,
                fidget = true,
                gitsigns = true,
                harpoon = true,
                indent_blankline = { enabled = true, colored_indent_levels = false },
                illuminate = true,
                lsp_trouble = true,
                mason = true,
                navic = { enabled = true },
                noice = true,
                notify = true,
                nvimtree = true,
                telescope = true,
                treesitter_context = true,
                treesitter = true,
                which_key = true,
            }

        }
    },
    {
        'EdenEast/nightfox.nvim',
        lazy = true,
        priority = 1000,
        opts = {
            options = {
                transparent = false,
                dim_inactive = true,
                module_default = true,
            },
        },
    },
    {
        'olimorris/onedarkpro.nvim',
        lazy = true,
        priority = 1000,
        opts = {
            plugins = {
                all = true,
            },
            options = {
                highlight_inactive_windows = true,
                transparency = false,
            },
        }
    },
    {
        'Mofiqul/dracula.nvim',
        lazy = true,
        opts = {
            show_end_of_buffer = false,
            transparent_bg = false,
            italic_comment = true,
        },
    },
    {
        'rmehri01/onenord.nvim',
        lazy = true,
        opts = {
            theme = "dark",
            borders = true,
            fade_nc = false,
            disable = {
                cursorline = true,
                eob_lines = true,
            },
        },
    },
    {
        'shaunsingh/nord.nvim',
        lazy = true,
    },
    {
        'rafamadriz/neon',
        lazy = true,
    },
    {
        'nyoom-engineering/oxocarbon.nvim',
        lazy = true,
        priority = 1000,
    },
    {
        'AlexvZyl/nordic.nvim',
        lazy = true,
        priority = 1000,
    },

}
