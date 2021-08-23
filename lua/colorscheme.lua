vim.g.dracula_colorterm = 1
vim.g.onedark_terminal_italics = 1

vim.opt.termguicolors = true
vim.g.doom_one_terminal_colors = true

vim.g.enable_bold_font = 1
vim.g.enable_italic_font = 1
vim.g.hybrid_transparent_background = 1

vim.cmd("colorscheme onedark")

vim.cmd [[
	let g:cursorword_highlight = 0
	hi CursorWord cterm=bold ctermbg=red guibg=#464646
]]
