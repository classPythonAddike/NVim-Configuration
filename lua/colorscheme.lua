local colorscheme = {}

vim.g.dracula_colorterm = 0
vim.g.airline_theme = "deus"

if vim.fn.has("termguicolors") then
    vim.opt.termguicolors = true
end

vim.g.enable_bold_font = 1
vim.g.enable_italic_font = 1
vim.g.hybrid_transparent_background = 1

vim.cmd("colorscheme hybrid_reverse")
