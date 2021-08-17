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
vim.opt.cursorline = true
vim.opt.title = true

vim.g.NERDTreeHijackNetrw = 0
vim.g.ranger_replace_netrw = 1

vim.cmd("set omnifunc=syntaxcomplete#Complete")
vim.cmd("let $NVIM_TUI_ENABLE_TRUE_COLOR=1")

require('lualine').setup{
	options = {
		theme = 'nord'
	},
}

vim.g.vimade = {
	enabletreesitter = 1
}

vim.opt.termguicolors = true

require('bufferline').setup {
	options = {
		numbers = "buffer_id",
		number_style = "superscript",

		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = "│",
		left_trunc_marker = '',
		right_trunc_marker = '',

		name_formatter = function(buf)  -- Show only name, not extension for markdown files
			if buf.name:match('%.md') then
				return vim.fn.fnamemodify(buf.name, ':t:r')
			end
		end,

		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 18,

		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, _, _, _)
			return "  "..count
		end,

		offsets = {{
			filetype = "NvimTree",
			text = function()
				local parent = vim.fn.fnamemodify(vim.fn.fnamemodify(vim.fn.getcwd(), ":h"), ":t")
				return parent .. "/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			end,
			text_align = "left"
		}},

		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		separator_style = "slant",
		enforce_regular_tabs = false,
		always_show_bufferline = true,
		sort_by = 'extension',

		custom_areas = {
			right = function()
				local result = {}
				local error = vim.lsp.diagnostic.get_count(0, [[Error]])
				local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
				local info = vim.lsp.diagnostic.get_count(0, [[Information]])
				local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

				table.insert(result, {text = "  " .. error, guifg = "#EC5241"})
				table.insert(result, {text = "  " .. warning, guifg = "#EFB839"})
				table.insert(result, {text = "  " .. hint, guifg = "#A3BA5E"})
				table.insert(result, {text = "  " .. info, guifg = "#7EA9A7"})
				table.insert(result, {text = " ", guifg = "#FFFFFF"})
				return result
			end,
		}
	}
}
