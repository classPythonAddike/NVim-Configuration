vim.cmd("filetype plugin on")
vim.cmd("syntax on")
vim.cmd("filetype indent off")

vim.completeopt = {"menuone", "noselect"}
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = false
vim.opt.smartindent = false
vim.opt.cindent = false

vim.g.NERDTreeWinSize = 28
vim.g.NERDTreeSyntaxEnabledDefaultExactMatches = {'.gitignore'}
vim.g["airline#extensions#tabline#enabled"] = 1
vim.g.airline_powerline_fonts = 1
vim.g.cpp_member_highlight = 1
vim.g.cpp_attributes_highlight = 1

vim.cmd("set omnifunc=syntaxcomplete#Complete")
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")
