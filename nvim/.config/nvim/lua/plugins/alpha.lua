-- Per-plugin which-key customization
local wk = require("which-key")

wk.register({
    ["<leader>sp"] = { "<cmd>Alpha<CR>", "Toggle Start Screen", { silent = true } },
})

local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")
-- It uses almost the same format as the "date" command in Linux (man date for info)
local time = os.date("%_k:%M ~ %a - %b %d")

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
"_____________________________________ |.   ~. _____________________________________ ",
"                                      じしf_,)ノ                                    ",
"                                                                                    ",

}

dashboard.section.buttons.val = {
    dashboard.button( "n", "    New file" ,             "<cmd>ene<CR>"),
    dashboard.button( "e", "󰝰    Ex",                    ":Ex<CR>"),
    dashboard.button( "v", "    Source session",        ":SessionRestore<CR>"),
    dashboard.button( "f", "    Find project file",     ":Telescope find_files<CR>"),
    dashboard.button( "h", "󱂵    Home dir find",         ":cd $HOME | Telescope find_files<CR>"),
    dashboard.button( "r", "    Recent"   ,             ":Telescope oldfiles<CR>"),
    dashboard.button( "g", "    Grep word",             ":Telescope live_grep<CR>"),
    dashboard.button( "l", "󰒲    Lazy",                  ":Lazy<CR>"),
    dashboard.button( "s", "    Main settings",         ":e $NVIMRC<CR>"),
    dashboard.button( "q", "󰿅    Quit",                  ":qa<CR>"),
}

dashboard.section.footer.val = {
"",
"",
"",
"                     " .. time .. "                       ",
"",
"",
"",
"  󰽰 I tuck you in, warm within, keep you free from sin ... 󰽰",
"                󰎈 'Til the Sandman, he comes 󰎈              ",
}


alpha.setup(dashboard.opts)

vim.cmd([[
    autocmd Filetype alpha setlocal nofoldenable signcolumn=no nonumber norelativenumber
]])

end

