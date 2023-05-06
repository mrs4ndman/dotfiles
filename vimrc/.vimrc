" Enable syntax highlighting | Habilita marcado de texto en colorines
syntax on

" Enable filetype detection | Habilita la detección de formato de archivos
filetype plugin indent on

" Zona donde colocas los plugins (Este gestor de plug-ins es vim-plug / Plug
call plug#begin('~/.vim/plugged')
" Code processing / debugging & alteration
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
" UX
Plug 'farmergreg/vim-lastplace'
Plug 'preservim/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
call plug#end()

" SET ZONE "

" Configuración cambio modo y línea de modos
set ttimeoutlen=10
set noshowmode
set timeoutlen=2000

" Netrw config | Configuración de netrw
let g:netrw_list_mode=1

" Encoding | Codificación

set encoding=UTF-8

" Enable line numbers | Habilita números de línea en el lateral
set number relativenumber

" Enable mouse support | Habilita interacción del ratón con el cursor en modo
" Insert
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
set expandtab

" Enable folding | Permite recoger código para una mejor vista
set foldmethod=indent
set foldlevel=99

" Highlight search results | Resalta los resultados de búsqueda
set hlsearch
set incsearch


" KEYBINDINGS "
" Configuración NERDTree (atajo de teclado)

silent nnoremap <C-n> :NERDTreeToggle<CR>
silent nnoremap <C-w> :w<CR>

" PLUGIN CONFIG MANAGEMENT "

" Enable code linting with Ale | Permite linting del código
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['eslint', 'prettier'],
      \ }
let g:ale_linters = {
      \ 'javascript': ['eslint'],
      \ }

" Configuración NERDTree (atajo de teclado)

silent nnoremap <C-n> :NERDTreeToggle<CR>

" Habilitamos las fuentes de Powerline (de mis otros scripts) y la caché.

let g:airline_powerline_fonts = 1
:let g:airline_highlighting_cache = 1

" Set the color scheme | Lugar definido para esquemas de colores custom

let g:airline_theme='onedark'

