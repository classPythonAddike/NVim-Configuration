call plug#begin(stdpath('data')) " Plugins

" Syntax Support
Plug 'sheerun/vim-polyglot'

" File Explorer
Plug 'scrooloose/NERDTree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlight files in the explorer based on extension
Plug 'Xuyuanp/nerdtree-git-plugin' " Highlight git plugins
Plug 'ryanoasis/vim-devicons' " Show icons in front of files

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Themes
Plug 'sainnhe/gruvbox-material'
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

" Autoclose HTML Tags
Plug 'alvan/vim-closetag'

call plug#end()

" ------------------------------ ColorScheme -----------------------------

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
  colorscheme nord " ColorScheme for nvim-qt
endif

" Comments in italic
hi Comment cterm=italic

" -------------------------- General ---------------------------

syntax on

" Allow plugins to load based on filetypes
filetype plugin on
" Display line numbers
set nu
" Set tabsize to 4
set tabstop=4

" ----------------------- Commands -------------------------

command BuildGoProject :!go build .
command RunGoProject :!go run .
command TestGoProject :!go test .

command CleanGoProjectVerbose :!go clean -x
command CleanGoProject :!go clean

command GolangDependencies :!go list .
command GolangVersion :!go version

command BuildVueApp :!npm run build

" --------------------------------- Remaps -----------------------------

nnoremap <F2> :w<CR> :bprevious<CR>
nnoremap <F3> :w<CR> :bnext<CR>
nnoremap <F4> :w<CR> :blast<CR>
nnoremap <C-Q> :w<CR> :bdelete<CR>

function Build()
  if &ft == "go"
    :BuildGoProject
  elseif &ft == "vue"
    :BuildVueApp
  endif
endfunction

nnoremap <F5> :w<CR> :call Build()<CR>

nnoremap <F8> :w<CR> :NERDTreeFocus<CR>
nnoremap <F9> :w<CR> :NERDTreeRefreshRoot<CR>

inoremap <C-A> <Esc> ggVG
nnoremap <C-A> ggVG

" ----------------------------- File Explorer --------------------------

let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '~'
let NERDTreeShowHidden=1 " Show hidden files

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" -------------------------- Highlight FileNames -------------------------

" let g:NERDTreeLimitedSyntax = 1
" Use this in case of lags in the file explorer

let g:NERDTreeSyntaxEnabledDefaultExactMatches = ['.git', '.gitignore']

" -----------------------  Git Status in File Explorer ---------------------

let g:NERDTreeGitStatusUseNerdFonts = 1 " Use nerd fonts along with a predefined map

" --------------------------- Airline ----------------------------

let g:airline#extensions#tabline#enabled = 1 " Show airline tabs

" --------------------------- Vim - Go ----------------------------

let g:go_highlight_functions = 1 " Highlight function declarations
let g:go_highlight_types = 1 " Highlight struct and interface declarations
let g:go_highlight_function_parameters = 1 " Highlight parameters
let g:go_highlight_fields = 1 " Highlight struct and interface fields
let g:go_highlight_function_calls = 1 " Highlight function calls

set completeopt-=preview " Close preview window when autocompleting

 " ------------------------ vim-devicon ---------------------------
 
let g:airline_powerline_fonts = 1

" ------------------- vim-closetag ------------------

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue'
" Set filetypes for HTML tag completion

" ------------------- Vim-Vue Syntax Highlighting ------------------------

let g:vue_pre_processors = 'detect_on_enter'
" Don't load all processors, only the required ones

" --------------------- Nord ColorScheme ------------------------

let g:nord_cursor_line_number_background = 1 " Doesnt work tho
let g:nord_bold_vertical_split_line = 1
let g:nord_italic = 1
let g:nord_bold = 1
let g:nord_underline = 1

let g:nord_italic_comments = 1

" Unfortunately I couldn't find a way to not draw the background color with
" nord. So my way around it was to first use onedark, which would not draw a
" background, and then change to nord after that
:command NordTheme :colorscheme nord
