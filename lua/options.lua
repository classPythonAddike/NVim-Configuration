vim.cmd("filetype plugin on")
vim.cmd("syntax on")
vim.cmd("filetype indent off")
vim.cmd("set omnifunc=syntaxcomplete#Complete")
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

vim.opt.clipboard = "unnamedplus"
vim.completeopt = {"menuone", "noselect"}
vim.opt.nu = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.shiftwidth = 4
vim.opt.smarttab = false
vim.opt.smartindent = true
vim.opt.cindent = false
vim.opt.cursorline = true
vim.opt.title = true
vim.opt.cmdheight = 1
vim.opt.termguicolors = true

vim.cmd [[
	command! W :w " Sometimes I type :W instead of :w
	command! Q :q
]]
