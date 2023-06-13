" MrSandman's simple VIM config for config file editing
"
" Packstrap plugin manager
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
      silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
  
" Run PlugInstall if there are missing plugins
 autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
   \| PlugInstall --sync | source $MYVIMRC
\| endif

" Enable syntax highlighting | Habilita marcado de texto en colorines
syntax on

" Enable filetype detection | Habilita la detección de formato de archivos
filetype plugin indent on

" Zona donde colocas los plugins (Este gestor de plug-ins es vim-plug / Plug
call plug#begin('~/.vim/plugged')
"

" UI
Plug 'itchyny/lightline.vim'
Plug 'rose-pine/vim'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'

" UX
Plug 'farmergreg/vim-lastplace'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'airblade/vim-matchquote'

" Tools
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

call plug#end()

" SET ZONE "
set nocompatible

set laststatus=2
if !has('gui_running')
    set t_Co=256
endif

" Update time
set updatetime=50

" Use system clipboard by default
set clipboard=unnamedplus

" No burrito wrapping
set nowrap

" Search config
set nohlsearch
set incsearch
set showmatch

" Cursor config
set guicursor=a:block

" Custom column and numbers
set colorcolumn=81
set cursorline
set cursorlineopt=number

" Porting the scrolloff from Neovim
set scrolloff=8
set signcolumn=auto

" Configuración cambio modo y línea de modos
set noshowmode
set timeoutlen=2000

" Encoding | Codificación
set encoding=UTF-8

" Enable line numbers | Habilita números de línea en el lateral
set number relativenumber

" Enable mouse support | Habilita interacción del ratón con el cursor en modo Insert
set mouse=nvi

" Use the system clipboard | Usa el portapapeles del sistema, en vez del
" propio
set clipboard=unnamedplus

" Enable auto-completion | Habilita una forma sencilla de autocompletado
set completeopt=menuone,longest,preview
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Set the default tab width to 4 spaces | Define el tabulado como 4 espacios
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Enable folding | Permite recoger código para una mejor vista
set foldmethod=indent
set foldlevel=99


" Netrw config | Configuración de netrw
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_silent = 1

set noswapfile
set nobackup

" KEYBINDINGS "

let mapleader=" " 

" Source current file
nnoremap <silent> <leader><leader> :source %<CR>

" Open up Ex
silent nmap <leader>e :Ex<CR>

" Quick exit
silent nmap <leader><Esc> :qa<CR>

" Buffer management
silent nmap <leader>bn :bnext<CR>
silent nmap <leader>bp :bprev<CR>
silent nmap <leader>bc :bd<CR>
silent nmap <leader>bd :bd!<CR>

" Set files to executable inside Neovim
silent map <leader>cx :!chmod +x %<CR>

" Delete without yanking
silent nmap <leader>dd [["_d]]

" TODO: Check the syntax for some of these to work

" When appending line, keep the cursor centered
silent nmap J mzJ'z

" Center search movement 1
silent nmap n nzzzv

" Center search movement 2
silent nmap N Nzzzv

" Create new lines above or below the cursor position
silent nmap <leader>o O<Esc>
silent nmap <leader>O O<Esc>

" Plugin management
silent nmap <leader>ps :PlugUpdate<CR>

" Allows you to replace current selection with paste buffer
silent xmap <leader>p "\"_dP"

" Unmapping Q
silent nmap Q <nop>

" Select whole buffer
silent nmap <leader>sa ggVG

" Yank whole buffer
silent nmap <leader>ya ggVG\"+y

" Keep cursor centered when navigating with Ctrl-D / Ctrl-U
silent nmap <C-d> <C-d>zz
silent nmap <C-u> <C-u>zz

" Invoke tmux-sessionizer from within neovim
silent nmap <C-f> :silent !tmux neww tmux-sessionizer<CR>

" Moving around text on visual
vnoremap <silent> <expr> J ":m '>+1<CR>gv-gv"
vnoremap <silent> <expr> K ":m '<-2<CR>gv-gv"

" PLUGIN CONFIG MANAGEMENT "

" Lightline config
let g:lightline = {
    \ 'colorscheme': 'rosepine',
    \ 'active': {
    \   'left': [ [ 'mode', 'filename', 'modified' ],
    \             [ 'gitbranch', 'filetype' ] ],
    \   'right': [ [ 'lineinfo', 'percent', 'fileencoding' ],
    \             [ 'readonly' ] ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'FugitiveHead'
    \ },
    \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>" : 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>" : 'SB',
        \ 't' : 'T',
        \ },
    \ }

" Set the color scheme | Lugar definido para esquemas de colores custom
set background=dark
colorscheme rosepine
