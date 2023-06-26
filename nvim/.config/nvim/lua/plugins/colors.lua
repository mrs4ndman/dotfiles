local functions = require("mrsandman.functions")
Is_Enabled = functions.is_enabled
Use_Defaults = functions.use_plugin_defaults

return {
    -- 3.- Theme plugins config
    -- Remember previous colorscheme
    {
        'raddari/last-color.nvim',
        enabled = Is_Enabled("last-color.nvim"),
        priority = 1000,
    },
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
        enabled = Is_Enabled("tokyonight.nvim"),
        event = "VimEnter",
        priority = 1000,
        opts = function(_, opts)
            if Use_Defaults("tokyonight.nvim") then
                opts = opts
            else opts = {
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
            }
        end
    end,
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
    enabled = Is_Enabled("nightfox.nvim"),
    lazy = true,
    priority = 1000,
    opts = function(_, opts)
        if Use_Defaults("nightfox.nvim") then
            opts = opts
        else opts = {
            options = {
                transparent = false,
                dim_inactive = true,
                module_default = true,
            }
        }
    end
end
},
{
    'olimorris/onedarkpro.nvim',
    enabled = Is_Enabled("onedarkpro.nvim"),
    lazy = true,
    priority = 1000,
    opts = function(_, opts)
        if Use_Defaults("onedarkpro.nvim") then
            opts = opts
        else opts = {
            plugins = { all = true },
            options = { highlight_inactive_windows = true, transparency = false }, }
        end
    end
},
{
    'Mofiqul/dracula.nvim',
    enabled = Is_Enabled("dracula.nvim"),
    lazy = true,
    opts = function(_, opts)
        if Use_Defaults("dracula.nvim") then
            opts = opts
        else opts = {
            show_end_of_buffer = false,
            transparent_bg = false,
            italic_comment = true,
        }
    end
end
    },
    {
        'rmehri01/onenord.nvim',
        enabled = Is_Enabled("onenord.nvim"),
        lazy = true,
        opts = function(_, opts)
            if Use_Defaults("onenord.nvim") then
                opts = opts
            else
                opts = {
            theme = "dark",
            borders = true,
            fade_nc = false,
            disable = { cursorline = true, eob_lines = true },
        }
    end
end
    },
    {
        'shaunsingh/nord.nvim',
        enabled = Is_Enabled("nord.nvim"),
        lazy = true,
    },
    {
        'rafamadriz/neon',
        enabled = Is_Enabled("neon"),
        lazy = true,
    },
    {
        'nyoom-engineering/oxocarbon.nvim',
        enabled = Is_Enabled("oxocarbon.nvim"),
        lazy = true,
        priority = 1000,
    },
    {
        'AlexvZyl/nordic.nvim',
        enabled = Is_Enabled("nordic.nvim"),
        lazy = true,
        priority = 1000,
    },
}
