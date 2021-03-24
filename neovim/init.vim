" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

call plug#begin('~/.vim/plugged')

	Plug 'junegunn/fzf'

	Plug 'Raimondi/delimitMate'

	Plug 'sheerun/vim-polyglot'

	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	Plug 'vim-airline/vim-airline'

	Plug 'vim-airline/vim-airline-themes'

	Plug 'gcmt/taboo.vim'

	Plug 'nathanaelkane/vim-indent-guides'

call plug#end()

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
endif

"basic config
set number
set relativenumber

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"plugin related config

let g:airline_theme='simple'
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"basic keybindings
""terminal close with esc
tnoremap <Esc> <C-\><C-n>

""new tab
nnoremap ,t :tabnew<CR>

"plugin related keybindings
"fzf
nnoremap <C-p> :FZF<CR>

"taboo rename tab
nnoremap ,r :TabooRename 
