" My config for NVim, single-file power - Mrs4ndman :)
" Copy and distribute freely at your own risk - In Spanish and English

" Enable syntax highlighting | Habilita marcado de texto en colorines
syntax on

" Enable filetype detection | Habilita la detección de formato de archivos
filetype plugin indent on

" Plugins go here | Plugins van aquí (Manager: vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'farmergreg/vim-lastplace'
Plug 'preservim/nerdtree'
Plug 'kevinhwang91/rnvimr'
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'vim-python/python-syntax'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-commentary'
Plug 'ThePrimeagen/vim-be-good'
call plug#end()

" Configuración cambio modo y línea de modos
set ttimeoutlen=10
set noshowmode

" Encoding | Codificación

set encoding=UTF-8

" Enable line numbers | Habilita números de línea en el lateral
set number relativenumber

" Enable mouse support | Habilita interacción del ratón con el cursor en modo Insert
set mouse=i

" Use the system clipboard | Usa el portapapeles del sistema, en vez del propio
set clipboard=unnamedplus

" Enable auto-completion | Habilita una forma sencilla de autocompletado
set completeopt=menuone,longest,preview
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"

" Set the default tab width to 4 spaces | Define el tabulado como 4 espacios
set tabstop=4
set shiftwidth=4
set expandtab

" Enable folding | Permite recoger código para una mejor vista
set foldmethod=indent
set foldlevel=99

" Highlight search results | Resalta los resultados de búsqueda
set hlsearch
set incsearch

" NVim-commentary fix for $USER
let g:commentary_user = $USER

" Various keybindings | Keybinds variadas:

" Quick exit without saving | Salida rápida sin guardar
    nnoremap <C-q> :q!<CR>
    nnoremap <C-X> :wq<CR> 

" Terminal autohide numbers | Automatización esconder números en terminal

autocmd TermOpen * setlocal nonumber


" NERDTree config (keyboard shortcuts and UI) | Configuración NERDTree (keybinds y UI)

nnoremap <silent> <M-r> :RnvimrToggle<CR>
silent nnoremap <C-n> :NERDTreeToggle<CR>
let  NERDTreeShowHidden=1

" Disabling TS indentation from typescript-vim plugin | Desabilitamos
" indentado de Typescript del plugin typescript-vim

let g:typescript_indent_disable = 1

" Powerline optimizations on fonts and cache | Habilitamos las fuentes de Powerline y cacheado rápido

let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1

" Set the color scheme for airline plugin | Ajustes color plugin airline

let g:airline_theme='dark'

