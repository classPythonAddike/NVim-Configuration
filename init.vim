call plug#begin(stdpath('data')) " Plugins

" File Explorer
Plug 'scrooloose/NERDTree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlight files in the explorer based on extension
Plug 'ryanoasis/vim-devicons' " Show icons in front of files

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Themes
Plug 'kristijanhusak/vim-hybrid-material'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Go Support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Colors CSS
Plug 'ap/vim-css-color'

" Syntax Highlighting for Vue files
Plug 'posva/vim-vue'

Plug 'voldikss/vim-floaterm'

Plug 'bfrg/vim-cpp-modern'

call plug#end()

" ------------------------------ ColorScheme -----------------------------


let g:vue_pre_processors = 'detect_on_enter' "Syntax highlighting for vue files

if $term == 'vtpcon'
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif

  if (has("termguicolors"))
    set termguicolors
  endif

  let g:hybrid_transparent_background = 1
  let g:enable_italic_font = 1
  let g:enable_bold_font = 1
  colorscheme hybrid_reverse
  let g:airline_theme='deus'
else
  if &ft == "python"
    colorscheme slate
  else
    colorscheme nord " ColorScheme for nvim-qt
  endif
endif

" -------------------------- General ---------------------------

" Allow plugins to load based on filetypes
filetype plugin on
syntax on
" Display line numbers
set nu
" Set indentation to 2 spaces, and enable smart indentation
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" ----------------------- Commands -------------------------

command TestGoProject :!go test .
command CleanGoProject :!go clean -x

function InitialiseRustProject()
  :!cargo init
  :NERDTreeRefreshRoot
  :NERDTreeFocus
endfunction

command InitRustProject :call InitialiseRustProject()

command W :w " Sometimes I type :W instead of :w

" --------------------------------- Remaps -----------------------------

nnoremap <F2> :bprevious<CR>
nnoremap <F3> :bnext<CR>
nnoremap <F4> :blast<CR>
nnoremap <C-Q> :bdelete<CR>

function Run()
  if &ft == "python"
    :ter python %
  elseif &ft == "go"
    :ter go run .
  elseif &ft == "cpp"
    :call Build()
    :execute(':ter ' . expand('%:r') . '.exe')
  else
    :echom "No run configurations set for filetype '" . &ft . "'!"
  endif
endfunction

function Build()
  if &ft == "go"
    :!go build
  elseif &ft == "vue"
    :!npm run build
  elseif &ft == "rust"
    :!cargo build
  elseif &ft == "cpp"
    execute(':!g++ % -o ' . expand('%:r') . '.exe')
  else
    :echom "No build configurations set for filetype '" . &ft . "'!"
  endif
endfunction

nnoremap <F5> :call Build()<CR>
nnoremap <F6> :call Run()<CR>
nnoremap <F8> :NERDTreeFocus<CR>
nnoremap <F9> :NERDTreeRefreshRoot<CR>
inoremap <C-A> <Esc> ggVG
nnoremap <C-A> ggVG

" ----------------------------- File Explorer --------------------------

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" -------------------------- Highlight FileNames -------------------------

" let g:NERDTreeLimitedSyntax = 1
" Use this in case of lags in the file explorer

let g:NERDTreeSyntaxEnabledDefaultExactMatches = ['.gitignore']

" --------------------------- Airline ----------------------------

let g:airline#extensions#tabline#enabled = 1 " Show airline tabs

" --------------------------- Vim - Go ----------------------------

let g:go_highlight_functions = 1 " Highlight function declarations
let g:go_highlight_types = 1 " Highlight struct and interface declarations
let g:go_highlight_function_parameters = 1 " Highlight parameters
let g:go_highlight_fields = 1 " Highlight struct and interface fields
let g:go_highlight_function_calls = 1 " Highlight function calls

 " ------------------------ vim-devicon ---------------------------
 
let g:airline_powerline_fonts = 1

" -------------------------- FloatTerm -----------------------------

hi FloatermBorder guifg=grey
command NewFloatTerm :FloatermNew --height=0.7 --width=0.9

" ---------------------------- vim-cpp-modern ------------------------

" Highlight struct/class member variables
let g:cpp_member_highlight = 1

" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1
