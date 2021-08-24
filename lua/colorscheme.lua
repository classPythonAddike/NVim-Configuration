vim.opt.termguicolors = true

vim.g.material_style = 'palenight'
vim.g.material_italic_comments = true
vim.g.material_italic_keywords = true
vim.g.material_italic_functions = true
vim.g.material_italic_variables = false
vim.g.material_contrast = false
vim.g.material_lighter_contrast = true
vim.g.material_borders = true
vim.g.material_disable_background = false

vim.g.tokyonight_style = "night"

-- require('material').set()
vim.cmd [[ colorscheme tokyonight ]]

require('lualine').setup{
	options = {
		theme = 'tokyonight'
	}
}
