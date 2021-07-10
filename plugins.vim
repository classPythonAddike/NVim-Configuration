call plug#begin(stdpath('data'))

Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/gitsigns.nvim'

Plug 'jiangmiao/auto-pairs'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'romgrk/barbar.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

Plug 'ap/vim-css-color'
Plug 'storyn26383/vim-vue'
Plug 'joshdick/onedark.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npm install' }
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

Plug 'liuchengxu/vim-clap'
Plug 'glepnir/dashboard-nvim'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

cal plug#end()
