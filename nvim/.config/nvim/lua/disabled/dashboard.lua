-- local home = os.getenv('HOME')
-- local status, db = pcall(require, 'dashboard')
-- if (not status) then return end

-- local LEADER = vim.g.mapleader
-- if LEADER == ' ' then
--     LEADER = 'SPC'
-- end
-- require('dashboard').comfig {



-- db.default_banner = {
-- '',
-- '',
-- '███╗   ███╗██████╗ ███████╗ █████╗ ███╗   ██╗██████╗ ███╗   ███╗ █████╗ ███╗   ██╗',
-- '████╗ ████║██╔══██╗██╔════╝██╔══██╗████╗  ██║██╔══██╗████╗ ████║██╔══██╗████╗  ██║',
-- '██╔████╔██║██████╔╝███████╗███████║██╔██╗ ██║██║  ██║██╔████╔██║███████║██╔██╗ ██║',
-- '██║╚██╔╝██║██╔══██╗╚════██║██╔══██║██║╚██╗██║██║  ██║██║╚██╔╝██║██╔══██║██║╚██╗██║',
-- '██║ ╚═╝ ██║██║  ██║███████║██║  ██║██║ ╚████║██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║',
-- '╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝',
-- '',
-- '',
-- }

-- db.custom_header = nil
-- db.custom_footer = {'', 'The phone is ringing, the world is spinning', 'Just let me out' }
-- db.custom_center = {
--     { icon = ' ', desc = 'MrSandman | <github.com/mrs4ndman', action = ''},
--     { icon = '', desc = '__________', action = '' },
--     { icon = ' ', desc = ' Recent files', shortcut = LEADER .. ' tf',
--     action = 'Telescope oldfiles'},
--     { icon = ',', desc = 'Repo search' }
-- }
-- db.preview_file_path = nil
-- db.preview_file_height = 0
-- db.preview_file_width = 0
-- db.preview_command = ''
-- db.image_width_pixel = 0
-- db.image_height_pixel = 0
-- db.hide_statusline = true
-- db.hide_tabline = ture
-- db.hide_winbar = true
-- db.session_directory = ''
-- db.session_auto_save_on_exit = false
-- db.session_verbose = true
-- db.header_pad = 1
-- db.center_pad = 1
-- db.footer_pad = 1
-- db.disable_at_vimenter = true
-- }