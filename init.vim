call plug#begin(stdpath('data')) " Plugins

" File Explorer
Plug 'scrooloose/NERDTree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlight files in the explorer based on extension
Plug 'ryanoasis/vim-devicons' " Show icons in front of files

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Themes
Plug 'joshdick/onedark.vim'
Plug 'arcticicestudio/nord-vim'

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

call plug#end()

" ------------------------------ ColorScheme -----------------------------

let g:vue_pre_processors = 'detect_on_enter' "Syntax highlighting for vue files

if $term == 'vtpcon'
  colorscheme onedark " ColorScheme for terminal
  let g:onedark_hide_endofbuffer=1
  let g:onedark_terminal_italics=1
  let g:onedark_termcolors=256

  " checks if your terminal has 24-bit color support
  if (has("termguicolors"))
  	set termguicolors
	  hi LineNr ctermbg=NONE guibg=NONE
	" Don't draw a bg colour, let the image show
  endif
  
  " Remove background in terminal
  if (has("autocmd") && !has("gui_running"))
    augroup colorset
	    autocmd!
	    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7"  }
	    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white  })
    augroup END
  endif

else
  if &ft == "python"
    colorscheme slate
  else
    colorscheme nord " ColorScheme for nvim-qt
  endif
endif

" Comments in italic
" hi Comment cterm=italic

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

" --------------------- Nord ColorScheme ------------------------

let g:nord_bold_vertical_split_line = 1
let g:nord_italic = 1
let g:nord_bold = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1

" Unfortunately I couldn't find a way to not draw the background color with
" nord. So my way around it was to first use onedark, which would not draw a
" background, and then change to nord after that
:command NordTheme :colorscheme nord
