"basic configs for neovim/vim
set number
set relativenumber

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

let mapleader = ","

"netrw stuff
let	g:netrw_banner = 0
let	g:netrw_liststyle = 3
let	g:netrw_browse_split = 4
let	g:netrw_altv = 1
let	g:netrw_winsize = 25

"set windows stuff and create useful variables
if has('win32')
	source $VIMRUNTIME/mswin.vim

	"vimrc location
	let $vimrc = 'C:\Users\'.$USER.'\AppData\Local\nvim\init.vim'
	"alacritty config location
	let $alacritty = 'C:\Users\'.$USER.'\AppData\Roaming\alacritty\alacritty.yml'
else
	"vimrc location
	let $vimrc = '/home/'.$USER.'/.config/nvim/init.vim'
	"alacritty config location
	let $alacritty = '/home/'.$USER.'/.config/alacritty/alacritty.yml'
	"copy/paste from system clipboard
	vnoremap <Leader>y "+y
	nnoremap <Leader>Y "+yg_
	nnoremap <Leader>y "+y
	nnoremap <Leader>yy "+yy

	nnoremap <Leader>p "+p
	nnoremap <Leader>P "+P
	vnoremap <Leader>p "+p
	vnoremap <Leader>P "+P
	
endif

"basic keybindings
""terminal close with esc
tnoremap <Esc> <C-\><C-n>

""new tab
nnoremap <Leader>t :tabnew<CR>

""netrw
nnoremap <F2> :Lexplore<CR>

""""""""plugin stuff
call plug#begin('~/.vim/plugged')

	Plug 'junegunn/fzf'
	Plug 'Raimondi/delimitMate'
	Plug 'sheerun/vim-polyglot'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'gcmt/taboo.vim'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'vimwiki/vimwiki'

call plug#end()


"plugin related config

let g:airline_theme={'colorscheme':'tokyonight'}
let g:airline_theme='tokyonight'
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"plugin related keybindings
"fzf
nnoremap <C-p> :FZF<CR>

"taboo rename tab
nnoremap <Leader>r :TabooRename 

"tokyonight colorscheme
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

"for neovide 
set guifont=Iosevka:h20
let g:neovide_fullscreen=v:true

"vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
