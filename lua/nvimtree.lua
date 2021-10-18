require'nvim-tree'.setup {
  
	disable_netrw       = true,
	hijack_netrw        = true,
	open_on_setup       = false,
	auto_close          = true,
	open_on_tab         = false,
  
	update_to_buf_dir   = {
		enable = true,
		auto_open = true,
	},

	hijack_cursor       = true,
	update_cwd          = true,
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		}
	},

	update_focused_file = {
		enable      = true,
		update_cwd  = true,
	},
	
	view = {
		width = 35,
		side = 'left',
	}
}
