require("toggleterm").setup{
	hide_numbers = false,
	shade_filetypes = { "lua", "vim", "python", "go" },
	shade_terminals = true,
	shading_factor = '3',
	start_in_insert = true,
	persist_size = true,
	direction = 'float',
	close_on_exit = true,

	float_opts = {
		border = 'curved',
		width = 110,
		height = 20,
		winblend = 3
	}
}
