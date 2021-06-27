command TestGoProject :!go test .
command CleanGoProject :!go clean -x

command W :w " Sometimes I type :W instead of :w
command Q :q

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

hi FloatermBorder guifg=grey
command NewFloatTerm :FloatermNew --height=0.7 --width=0.9
