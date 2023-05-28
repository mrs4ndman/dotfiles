local options
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

if (vim.api.nvim_exec('echo argc()', true) == "0")
then

-- Header section config
dashboard.section.header.val = {

"                                                                                    ",
" ███╗   ███╗██████╗ ███████╗ █████╗ ███╗   ██╗██████╗ ███╗   ███╗ █████╗ ███╗   ██╗ ",
" ████╗ ████║██╔══██╗██╔════╝██╔══██╗████╗  ██║██╔══██╗████╗ ████║██╔══██╗████╗  ██║ ",
" ██╔████╔██║██████╔╝███████╗███████║██╔██╗ ██║██║  ██║██╔████╔██║███████║██╔██╗ ██║ ",
" ██║╚██╔╝██║██╔══██╗╚════██║██╔══██║██║╚██╗██║██║  ██║██║╚██╔╝██║██╔══██║██║╚██╗██║ ",
" ██║ ╚═╝ ██║██║  ██║███████║██║  ██║██║ ╚████║██████╔╝██║ ╚═╝ ██║██║  ██║██║ ╚████║ ",
" ╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝ ",
"                                                                                    ",
"                                   N E O V I M                                      ",
"                                                                                    ",
"                                      ／|__                                         ",
"                                     (o o /                                         ",
"                                      |.   ~.                                       ",
"                                      じしf_,)ノ                                    ",

}

dashboard.section.buttons.val = {
    dashboard.button( "n", "    New file" ,             ":tabnew<CR>"),
    dashboard.button( "e", "󰝰    Ex",                    ":Ex<CR>"),
    dashboard.button( "f", "    Find project file",     ":Telescope find_files<CR>"),
    dashboard.button( "h", "󱂵    Home dir find",         ":cd $HOME | Telescope find_files<CR>"),
    dashboard.button( "r", "    Recent"   ,             ":Telescope oldfiles<CR>"),
    dashboard.button( "g", "    Grep word",             ":Telescope live_grep<CR>"),
    dashboard.button( "l", "󰒲    Lazy",                  ":Lazy<CR>"),
    dashboard.button( "s", "    Main settings",         ":e $NVIMRC<CR>"),
    dashboard.button( "q", "󰿅    Quit",                  ":qa<CR>"),
}

alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd Filetype alpha setlocal nofoldenable signcolumn=no nonumber norelativenumber
]])

end

