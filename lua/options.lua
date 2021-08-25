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

require("formatter").setup({
	filetype = {
		vue = {
			function()
				return {
					exe = "prettier",
					args = { "--write", "--use-tabs", vim.api.nvim_buf_get_name(0) },
					stdin = false
				}
			end
		},
		svelte = {
			function()
				return {
					exe = "prettier",
					args = { "--write", "--use-tabs", vim.api.nvim_buf_get_name(0) },
					stdin = false
				}
			end
		},
		python = {
			function()
				return {
					exe = "black",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = false
				}
			end
		}
	}
})

vim.api.nvim_exec([[
	augroup FormatAutogroup
		autocmd!
		autocmd BufWritePost * FormatWrite
	augroup END
]], true)
