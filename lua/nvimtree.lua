vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache', '__pycache__' }

vim.g.nvim_tree_width = 30
vim.g.nvim_tree_gitignore = 0
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_tab_open = 1
vim.g.nvim_tree_auto_resize = 1
vim.g.nvim_tree_disable_netrw = 0
vim.g.nvim_tree_hijack_netrw = 0
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_lsp_diagnostics = 1
vim.g.nvim_tree_disable_window_picker = 1
vim.g.nvim_tree_hijack_cursor = 1
vim.g.nvim_tree_icon_padding = ' '
vim.g.nvim_tree_update_cwd = 1

vim.g.nvim_tree_special_files = {
	['README.md'] = 1,
	['Makefile'] = 1,
	['MAKEFILE'] = 1
}

vim.g.nvim_tree_show_icons = {
	['git'] = 1,
	['folders'] = 1,
	['files'] = 1,
	['folder_arrows'] = 1,
}

vim.g.nvim_tree_icons = {
	['default'] = '🗎',
	['symlink'] = '',
	['folder'] = {
		['arrow_open'] = "↓",
		['arrow_closed'] = "→",
		['default'] = "",
		['open'] = "",
		['empty'] = "⇒",
		['empty_open'] = "⇓",
		['symlink'] = "",
		['symlink_open'] = "",
    },
    ['lsp'] = {
		['hint'] = "",
		['info'] = "",
		['warning'] = "",
		['error'] = "",
    },
	['git'] = {
		['unstaged'] = "★",
		['staged'] = "✓",
		['unmerged'] = "",
		['renamed'] = "➜",
		['untracked'] = "★",
		['deleted'] = "",
		['ignored'] = "◌",
	},
}

vim.opt.termguicolors = true -- this variable must be enabled for colors to be applied properly
