"basic configs for neovim/vim
set relativenumber

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set cursorline

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

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
	let $vimrc = 'C:\Users\'.$USERNAME.'\AppData\Local\nvim\init.vim' "alacritty config location
	let $alacritty = 'C:\Users\'.$USERNAME.'\AppData\Roaming\alacritty\alacritty.yml'
else
	"vimrc location
	let $vimrc = '/home/'.$USER.'/.config/nvim/init.vim'
	"alacritty config location
	let $alacritty = '/home/'.$USER.'/.config/alacritty/alacritty.yml'
	
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
	Plug 'junegunn/fzf.vim'
	Plug 'Raimondi/delimitMate'
	Plug 'sheerun/vim-polyglot'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'ghifarit53/tokyonight-vim'
	Plug 'morhetz/gruvbox'
	Plug 'vimwiki/vimwiki'
	Plug 'shime/vim-livedown'
	Plug 'mhinz/vim-startify'

call plug#end()

"plugin related config

command! -nargs=0 Prettier :CocCommand prettier.formatFile

"plugin related keybindings
"fzf
nnoremap <C-p> :FZF<CR>

"taboo rename tab
nnoremap <Leader>r :TabooRename 

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

""""""""""""""""""""""""""""""color stuff
set termguicolors

""""tokyonight
""colorscheme
"let g:tokyonight_style = 'storm'
"let g:tokyonight_enable_italic = 1
"colorscheme tokyonight
""airline
"let g:airline_theme={'colorscheme':'tokyonight'}
"let g:airline_theme='tokyonight'

""""gruvbox
colorscheme gruvbox
set background=light
let g:airline_theme={'colorscheme':'gruvbox'}
let g:airline_theme='gruvbox'
let g:gruvbox_contrast_light='soft'

""""""""""""""""""""""""""""""end color stuff

"for neovide // nvim-qt
set guifont=Iosevka\ Term:h24

"allow indentguides on startup
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']

"vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

""""""""""""
"Startify  "
""""""""""""
function! s:center(lines) abort
  let longest_line   = max(map(copy(a:lines), 'strwidth(v:val)'))
  let centered_lines = map(copy(a:lines),
        \ 'repeat(" ", (&columns / 2) - (longest_line / 2)) . v:val')
  return centered_lines
endfunction
let s:header= [
			\" ▄▀▀▄ ▀▄  ▄▀▀▀▀▄   ▄▀▀▀▀▄    ▄▀▀▀▀▄      ▄▀▀▄ ▀▄  ▄▀▀█▄▄▄▄  ▄▀▀▀▀▄   ▄▀▀▄ ▄▀▀▄  ▄▀▀█▀▄    ▄▀▀▄ ▄▀▄ ",
			\"█  █ █ █ █      █ █         █ █   ▐     █  █ █ █ ▐  ▄▀   ▐ █      █ █   █    █ █   █  █  █  █ ▀  █ ",
			\"▐  █  ▀█ █      █ █    ▀▄▄     ▀▄       ▐  █  ▀█   █▄▄▄▄▄  █      █ ▐  █    █  ▐   █  ▐  ▐  █    █ ",
			\"  █   █  ▀▄    ▄▀ █     █ █ ▀▄   █        █   █    █    ▌  ▀▄    ▄▀    █   ▄▀      █       █    █  ",
			\"▄▀   █     ▀▀▀▀   ▐▀▄▄▄▄▀ ▐  █▀▀▀       ▄▀   █    ▄▀▄▄▄▄     ▀▀▀▀       ▀▄▀     ▄▀▀▀▀▀▄  ▄▀   ▄▀   ",
			\"█    ▐            ▐          ▐          █    ▐    █    ▐                       █       █ █    █    ",
			\"▐                                       ▐         ▐                            ▐       ▐ ▐    ▐    ",
			\]

let g:startify_change_to_dir = 1
let g:startify_custom_header = s:center(s:header)
" Optionally create and use footer
"let s:header= []
"let g:startify_custom_footer = s:center(s:footer)

augroup TerminalStuff
  au! 
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END
