syntax on
packloadall
set tabstop=4
set shiftwidth=4
set expandtab
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 14
let g:NetrwIsOpen=0
function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
"   nnoremap <silent> \\ :call ToggleNetrw()<CR>
let g:NetrwIsOpen=0

" FIX: wsl starting with REPLACE mode
" https://stackoverflow.com/a/11940894
if $TERM =~ 'xterm-256color'
  set noek
endif
