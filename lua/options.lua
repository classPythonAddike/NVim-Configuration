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
vim.opt.smartindent = true
vim.opt.cindent = false

vim.g.NERDTreeHijackNetrw = 0
vim.g.ranger_replace_netrw = 1

vim.cmd("set omnifunc=syntaxcomplete#Complete")
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

require('lualine').setup{
	options = {
		theme = 'nord'
	}
}

vim.g.UltiSnipsExpandTrigger = "<tab>"


