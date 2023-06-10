" MrSandman's simple VIM config for config file editing
"
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
" Code processing / debugging & alteration
Plug 'dense-analysis/ale'

" UI
Plug 'itchyny/lightline.vim'
Plug 'rose-pine/vim'

Plug 'ryanoasis/vim-devicons'

" UX
Plug 'farmergreg/vim-lastplace'

Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'

Plug 'airblade/vim-matchquote'
Plug 'airblade/vim-gitgutter'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

call plug#end()

" SET ZONE "

set laststatus=2
if !has('gui_running')
    set t_Co=256
endif

" Update time
set updatetime=50

" No burrito wrapping
set nowrap

" Search config
set nohlsearch
set incsearch
set showmatch

" Cursor config
set guicursor=a:block

" Custom column
set colorcolumn=81

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
set mouse=i

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

" KEYBINDINGS "
let mapleader=" " 

" Open up Ex
silent map <leader>e :Ex<CR>

"
silent map <leader><Esc> :qa<CR>

"
silent map <leader>cx :!chmod +x %<CR>

"
silent xmap <leader>p "\"_dP"

"
silent nmap <leader>dd [["_d]]

"
silent vmap <leader>dd [["_d]]


" TODO: Check the syntax for some of these to work
"
silent nmap J mzJ'z

"
silent nmap n nzzzv

"
silent nmap N Nzzzv

"
silent nmap <leader>sa ggVG

"
silent nmap <leader>ya ggVG\"+y

"
silent nmap <leader>o O<Esc>
silent nmap <leader>O O<Esc>

" Buffer management
silent nmap <leader>bn :bnext<CR>
silent nmap <leader>bp :bprev<CR>
silent nmap <leader>bc :bd<CR>
silent nmap <leader>bd :bd!<CR>

"
silent nmap <C-d> <C-d>zz
silent nmap <C-u> <C-u>zz

"
silent nmap <C-f> :silent !tmux neww tmux-sessionizer<CR>

nmap Q <nop>


 
" Configuración NERDTree (atajo de teclado)

silent nnoremap <C-n> :NERDTreeToggle<CR>
silent nnoremap <C-w> :w<CR>

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

" Enable code linting with Ale | Permite linting del código
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint', 'prettier'],
      \ }
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ }


" Set the color scheme | Lugar definido para esquemas de colores custom
set background=dark
colorscheme rosepine
let g:disable_bg = 1
let g:disable_float_bg = 1
