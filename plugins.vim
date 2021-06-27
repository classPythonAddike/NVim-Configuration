call plug#begin(stdpath('data'))

" File Explorer
Plug 'scrooloose/NERDTree'
" Highlight files in the explorer based on extension
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Show icons in front of files
Plug 'ryanoasis/vim-devicons' 

" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Status Line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" Autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Colors
Plug 'ap/vim-css-color'
Plug 'bfrg/vim-cpp-modern'
" Plug 'posva/vim-vue'

" Color schemes
Plug 'joshdick/onedark.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'voldikss/vim-floaterm'

call plug#end()

