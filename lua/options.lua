vim.cmd("filetype plugin on")
vim.cmd("syntax on")
vim.cmd("filetype indent off")

-- Synchronize the system clipboard with neovim's
vim.opt.clipboard = "unnamedplus"

vim.completeopt = {"menuone", "noselect"}
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.smarttab = false
vim.opt.smartindent = false
vim.opt.cindent = false

vim.g["airline#extensions#tabline#enabled"] = 1
vim.g.airline_powerline_fonts = 1
vim.g.cpp_member_highlight = 1
vim.g.cpp_attributes_highlight = 1

vim.g.dashboard_custom_header = {
   '        ▄▄▄▄▄███████████████████▄▄▄▄▄     ',
   '      ▄██████████▀▀▀▀▀▀▀▀▀▀██████▀████▄   ',
   '     █▀████████▄             ▀▀████ ▀██▄  ',
   '    █▄▄██████████████████▄▄▄         ▄██▀ ',
   '     ▀█████████████████████████▄    ▄██▀  ',
   '       ▀████▀▀▀▀▀▀▀▀▀▀▀▀█████████▄▄██▀    ',
   '         ▀███▄              ▀██████▀      ',
   '           ▀██████▄        ▄████▀         ',
   '              ▀█████▄▄▄▄▄▄▄███▀           ',
   '                ▀████▀▀▀████▀             ',
   '                  ▀███▄███▀                ',
   '                     ▀█▀                   ' }

vim.cmd("set omnifunc=syntaxcomplete#Complete")
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")
