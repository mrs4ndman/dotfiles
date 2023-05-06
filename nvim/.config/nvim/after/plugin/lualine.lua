-- Eviline config for lualine, modified by MrSandman
-- Author: shadmansaleh
-- Credit: glepnir
--
-- Slightly modified GeoMetro
-- (if you get it, you get it)
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
    bg          = '#202328',
    fg          = '#bbc2cf',
    yellow      = '#ECBE7B',
    cyan        = '#008080',
    pink        = '#FF00FF',
    darkblue    = '#0037AA',
    turquoise   = '#00CCCC',
    green       = '#98be65',
    lime        = '#00CC00',
    orange      = '#FF8800',
    sorange     = '#FF6600',
    violet      = '#a9a1e1',
    magenta     = '#c678dd',
    blue        = '#51afef',
    red         = '#FF0000',
    ultraviolet = '#CC0099',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

-- Config
local config = {
    options = {
        -- Disable sections and component separators
        component_separators = '',
        section_separators = '',
        theme = {
            -- We are going to use lualine_c an lualine_x as left and
            -- right section. Both are highlighted by c theme .  So we
            -- are just setting default looks o statusline
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        -- These will be filled later
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        -- these are to remove the defaults
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    function()
        return ''
    end,
    color = { fg = colors.lime }, -- Sets highlighting of component
    padding = { left = 1, right = 1 }, -- We don't need space before this
}

ins_left {
    -- mode component
    function()
        return ''
    end,
    color = function()
        -- auto change color according to neovims mode
        local mode_color = {
            n = colors.pink,
            i = colors.turquoise,
            v = colors.orange,
            [''] = colors.blue,
            V = colors.sorange,
            c = colors.green,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [''] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ['r?'] = colors.cyan,
            ['!'] = colors.red,
            t = colors.red,
        }
        return { fg = mode_color[vim.fn.mode()] }
    end,
    padding = { left = 0, right = 1 },
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.red, gui = 'bold' },
    path = 0,
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}

ins_left {
    -- git branch icon & name
    'branch',
    icon = '',
    color = { fg = colors.orange, gui = 'bold' },
}

ins_left {
    -- filesize component
    'filesize',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.cyan },
    padding = { left = 0, right = 0}
}

ins_left {
    -- filetype / language component
    'filetype',
    colored = true,
    icon_only = false,
    icon = { align = 'left' },
    color = { fg = 'cyan', gui = 'bold' },
    padding = { left = 1, right = 0}
}

ins_left {
    function()
        return '%='
    end,
}

ins_left {
    -- cursor location in file component
    'location',
    color = { fg = colors.lime, gui = 'bold' },
    padding = { left = 1, right = 0 }
}

ins_left {
    -- same as location but in % form
    'progress',
    color = { fg = colors.ultraviolet, gui = 'bold' },
    padding = { left = 1, right = 0 }
}

-- Add components to right sections
ins_right {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}


ins_right {
    -- Lsp server name .
    function()
        local msg = 'None'

        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
            return msg
        end
        for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                return client.name
            end
        end
        return msg
    end,
    icon = ' LSP:',
    color = { fg = 'cyan', gui = 'bold' },
    cond = conditions.hide_in_width,
}

ins_right {
    'o:encoding', -- option component same as &encoding in viml
    fmt = string.lower, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.red },
    padding = { left = 0, right = 0},
}

ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = true,
    color = { fg = colors.white, gui = 'bold' },
    padding = { left = 1, right = 2}
}

ins_right {
    'diff',
    -- Is it me or the symbol for modified us really weird
    symbols = { added = ' ', modified = '柳 ', removed = ' ' },
    diff_color = {
        added = { fg = colors.lime },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}
--
--
-- Now don't forget to initialize lualine
lualine.setup(config)
