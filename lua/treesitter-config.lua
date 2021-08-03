require'nvim-treesitter.configs'.setup {
	ensure_installed = { "python", "vue", "svelte", "go", "html", "javascript", "lua" },
	ignore_install = {},
	highlight = {
		enable = { "python", "vue", "svelte", "go", "html", "javascript", "css", "lua" },
		disable = {},
		additional_vim_regex_highlighting = false
	},
	indent = {
		enable = true
	}
}
