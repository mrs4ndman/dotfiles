require('overlength').setup({
    enabled = true,

    ctermdb = 'darkred',
    bg = '#8B0000',

    textwidth_mode = 2,

    default_overlenght = 80,
    highlight_to_eol = true,
    grace_length = 3,

    disable_ft = { 'qf', 'help', 'man', 'packer', 'Telescope' },


})
-- :lua require('overlength').set_overlength(markdown, 0)
