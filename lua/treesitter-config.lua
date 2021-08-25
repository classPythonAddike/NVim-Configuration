require("nvim-treesitter.configs").setup({
	ensure_installed = require("treesitter-parsers").parsers,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = {},
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
})
