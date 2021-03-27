call plug#begin(stdpath('data')) " Plugins

" Syntax Support
Plug 'sheerun/vim-polyglot'

" File Explorer
Plug 'scrooloose/NERDTree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Highlight files in the explorer based on extension
Plug 'Xuyuanp/nerdtree-git-plugin' " Highlight git plugins

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Themes
Plug 'sainnhe/gruvbox-material'
Plug 'joshdick/onedark.vim'

" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Go Support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" ------------------------------ ColorScheme -----------------------------

" Remove background in terminal
if (has("autocmd") && !has("gui_running"))
	augroup colorset
		autocmd!
		let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7"  }
		autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white  })
	augroup END
endif

if $term == 'vtpcon'
	colorscheme onedark " ColorScheme for terminal
else
	colorscheme gruvbox-material " ColorScheme for nvim-qt
endif

" Comments in italic
hi Comment cterm=italic
let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

syntax on

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
	set termguicolors
	hi LineNr ctermbg=NONE guibg=NONE
	" Don't draw a bg colour, let the image show
endif

" Allow plugins to load based on filetypes
filetype plugin on
" Display line numbers
set nu
" Set tabsize to 4
set tabstop=4

" ----------------------------- File Explorer --------------------------

" Change the icons for folders
let g:NERDTreeDirArrowExpandable = ' ▸'
let g:NERDTreeDirArrowCollapsible = ' ▾'
let NERDTreeShowHidden=1 " Show hidden files

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif


" -------------------------- Highlight FileNames -------------------------

" Required in case vim-devicons plugin is not installed
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" let g:NERDTreeLimitedSyntax = 1
" Use this in case of lags in the file explorer

let g:NERDTreeSyntaxDisableDefaultExtensions = 1
let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeSyntaxEnabledDefaultExactMatches = ['.git', '.gitignore']

let s:brown = "905532"
let s:aqua =  "0099CC"
let s:blue = "689FB6"
let s:lightPurple = "834F79"
let s:yellow = "FFCC00"
let s:orange = "D4843E"
let s:pink = "CB6F6F"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid errors
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['py'] = s:yellow
let g:NERDTreeExtensionHighlightColor['go'] = s:aqua
let g:NERDTreeExtensionHighlightColor['html'] = s:lightPurple
let g:NERDTreeExtensionHighlightColor['js'] = s:blue
let g:NERDTreeExtensionHighlightColor['md'] = s:orange
let g:NERDTreeExtensionHighlightColor['yml'] = s:brown
let g:NERDTreeExtensionHighlightColor['yaml'] = s:brown
let g:NERDTreeExtensionHighlightColor['gitignore'] = s:lightGreen
let g:NERDTreeExtensionHighlightColor['mod'] = s:green
let g:NERDTreeExtensionHighlightColor['sum'] = s:green

let g:NERDTreeExactMatchHighlightColor = {}
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:lightGreen " sets the color for .gitignore files


" -----------------------  Git Status in File Explorer ---------------------


" Map for files in the explorer
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusUseNerdFonts = 0 " Don't use nerd fonts
let g:NERDTreeGitStatusConcealBrackets = 1 " Don't show the `[]` around characters

" --------------------------- Airline ----------------------------

let g:airline#extensions#tabline#enabled = 1 " Show airline tabs
nnoremap <TAB> :bnext<CR>
" Cycle tabs forward


" --------------------------- Vim - Go ----------------------------

let g:go_highlight_functions = 1 " Highlight function declarations
let g:go_highlight_types = 1 " Highlight struct and interface declarations
let g:go_highlight_function_parameters = 1 " Highlight parameters
let g:go_highlight_fields = 1 " Highlight struct and interface fields
