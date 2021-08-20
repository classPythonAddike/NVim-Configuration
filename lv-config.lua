--    ------------ LunarVim Config ------------
--
--    Configured specially for Golang and Vuejs
--    Ported over from my default configuration


-- General
lvim.format_on_save = true
lvim.lint_on_save = true
vim.g.nightfox_style = "nordfox"
lvim.colorscheme = "nightfox"

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- Keymappings
lvim.leader = "space"
lvim.keys.normal_mode['<C-X>'] = ':BufferClose<CR>'

lvim.keys.normal_mode['<C-S>'] = ':w<CR>'
lvim.keys.insert_mode['<C-S>'] = '<Esc>:w<CR>'
lvim.keys.normal_mode['<C-A>'] = 'ggVG'
lvim.keys.insert_mode['<C-A>'] = '<Esc> ggVG'
lvim.keys.normal_mode['<C-F>'] = ':Telescope file_browser<CR>'

function Build()
    local ft = vim.bo.filetype

    if ft == "go" then
        vim.cmd(":TermExec cmd='go build .'")
    elseif ft == "vue" then
        vim.cmd(":TermExec cmd='npm run build'")
    else
        vim.cmd(":echom \"No build configurations set for filetype '" .. ft .. "'!\"")
    end
end

function Run()
    local ft = vim.bo.filetype

    if ft == "go" then
        vim.cmd(":TermExec cmd='go run .'")
    elseif ft == "python" then
        vim.cmd(":TermExec cmd='python3 %'")
    else
        vim.cmd(":echom \"No run configurations set for filetype '" .. ft .. "'!\"")
    end
end

lvim.keys.normal_mode['<F2>'] = ':bprevious<CR>'
lvim.keys.normal_mode['<F3>'] = ':bnext<CR>'
lvim.keys.normal_mode['<F4>'] = ':blast<CR>'

lvim.keys.normal_mode['<F5>'] = ":lua Build()<CR>"
lvim.keys.normal_mode['<F6>'] = ":lua Run()<CR>"

lvim.keys.normal_mode['<F7>'] = ":CommentToggle<CR>"
lvim.keys.insert_mode['<F7>'] = "<Esc>:CommentToggle<CR>i"

lvim.keys.normal_mode['<F8>'] = ':NvimTreeFindFile<CR>'


-- GalaxyLine Colors


colors = {
  fg = "#ABB2BF",
  bg = "#3b4252",
  alt_bg = "#3b4252",
  dark = "#222222",
  accent = "#AAAAAA",
  popup_back = "#2D2D30",
  search_orange = "#613214",
  search_blue = "#5e81ac",
  white = "#D8DEE9",
  gray = "#9BA1AB",
  light_gray = "#c8c9c1",
  blue = "#5f8ccd",
  dark_blue = "#223E55",
  light_blue = "#8dc0d5",
  green = "#83ba8b",
  cyan = "#4EC9B0",
  light_green = "#B5CEA8",
  red = "#D16969",
  orange = "#D1866B",
  light_red = "#CA535F",
  yellow = "#ECCC8E",
  yellow_orange = "#D7BA7D",
  purple = "#BF82B4",
  magenta = "#D16D9E",
  cursor_fg = "#515052",
  cursor_bg = "#AEAFAD",
  sign_add = "#587c0c",
  sign_change = "#0c7d9d",
  sign_delete = "#94151b",
  error_red = "#F44747",
  warning_orange = "#ff8800",
  info_yellow = "#FFCC66",
  hint_blue = "#4FC1FF",
  purple_test = "#ff007c",
  cyan_test = "#00dfff",
  ui_blue = "#264F78",
}


-- Plugin Config
lvim.builtin.galaxyline.colors = colors
lvim.builtin.dashboard.active = true
lvim.builtin.rooter.active = false
lvim.builtin.rooter.silent_chdir = 0
lvim.builtin.rooter.manual_only = 1
lvim.builtin.which_key.active = false
lvim.builtin.telescope.active = true
lvim.builtin.bufferline.active = false


-- Treesitter Parsers
lvim.builtin.treesitter.ensure_installed = { "lua", "go", "vue", "html", "css", "javascript" }
lvim.builtin.treesitter.ignore_install = {}
lvim.builtin.treesitter.highlight.enabled = true

lvim.lang.go.formatters = {
    {
        exe = "gofmt",
        args = {}
    },
    {
        exe = "goimport",
        args = {}
    }
}



vim.cmd [[
    call wilder#enable_cmdline_enter()
    set wildcharm=<Tab>
    cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
    cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

    " only / and ? are enabled by default
    call wilder#set_option('modes', ['/', '?', ':'])

    command! W :w " Sometimes I type :W instead of :w
    command! Q :q

    let $NVIM_TUI_ENABLE_TRUE_COLOR=1

    function! FormatVueFiles()
    	:silent exec "!prettier --write --use-tabs %"
	    :e!
    endfunction

    autocmd BufWritePost *.vue :call FormatVueFiles()
    autocmd BufWritePost * :colorscheme nightfox

]]

    -- autocmd Colorscheme * ++once colorscheme nightfox
vim.g.python3_host_prog = '/bin/python3'
vim.g.loaded_python_provider = 0

function SetupBufferline()
    require('bufferline').setup {
	    options = {
		    numbers = "buffer_id",
    		number_style = "superscript",

    		indicator_icon = '▎',
	    	buffer_close_icon = '',
		    modified_icon = '●',
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
		    show_close_icon = false,
    		show_tab_indicators = true,
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
    	},
        highlights = {
            fill = {
                guibg = colors.bg
            }
        }
    }
end

-- Additional Plugins
lvim.plugins = {
	{
		'gelguy/wilder.nvim',
		run = ':UpdateRemotePlugins'
	},
    {
        'fatih/vim-go',
		run = ':GoUpdateBinaries',
		ft = 'go'
	},
    {'EdenEast/nightfox.nvim'},
    {'paulo-santana/onedarker.nvim'},
    {'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons', config=SetupBufferline}
}
