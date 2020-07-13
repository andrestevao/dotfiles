syntax on
packloadall
set tabstop=4
set shiftwidth=4
set expandtab

" hi Pmenu ctermbg=darkgray
set number
set relativenumber
set cursorline

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sainnhe/edge'
Plug 'edkolev/tmuxline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'

" Initialize plugin system
call plug#end()

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

syntax enable
set background=dark
let g:edge_style = 'neon'
colorscheme edge
let g:airline_theme='edge'
hi Normal ctermbg=NONE guibg=NONE
hi CursorLine ctermbg=NONE guibg=NONE

map <C-n> :NERDTreeToggle<CR>
nnoremap <c-p> :Files<cr>
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_enabled = 0
set backspace=2
