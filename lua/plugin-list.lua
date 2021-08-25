local M = {}

function M.PluginList()
	return {
		"wbthomason/packer.nvim",

		'glepnir/dashboard-nvim',

		'rcarriga/nvim-notify',
		'justinmk/vim-sneak',

		'neovim/nvim-lspconfig',
		'kabouzeid/nvim-lspinstall',

		{
			'mhartington/formatter.nvim',
		},

		'folke/tokyonight.nvim',

		{
			'romgrk/barbar.nvim',
			requires = 'kyazdani42/nvim-web-devicons'
		},
		{
			'hoob3rt/lualine.nvim',
			config = function()
				require('lualine').setup{
					options = {
						theme = 'tokyonight'
					}
				}
			end
		},

		-- Unused colorschemes, only delays startup
		{
			'marko-cerovac/material.nvim',
			cmd = "ABC", -- Dummy command
			config = function()
				vim.g.material_style = 'palenight'
				vim.g.material_italic_comments = true
				vim.g.material_italic_keywords = true
				vim.g.material_italic_functions = true
				vim.g.material_italic_variables = false
				vim.g.material_contrast = false
				vim.g.material_lighter_contrast = true
				vim.g.material_borders = true
				vim.g.material_disable_background = false

				-- require("material").set()
			end
		},
		{
			'shaunsingh/nord.nvim',
			cmd = "ABC" -- Dummy command
		},

		{
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		},
		{
			'gelguy/wilder.nvim',
			run = ':UpdateRemotePlugins',
			event = "VimEnter",
			config = function()
				vim.cmd [[
					call wilder#enable_cmdline_enter()
					set wildcharm=<Tab>
					cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
					cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

					" only / and ? are enabled by default
					call wilder#set_option('modes', ['/', '?', ':'])
				]]
			end
		},


		{
			'hrsh7th/nvim-compe',
			event = "InsertEnter",
			config = function()
				require'compe'.setup {
					enabled = true;
					autocomplete = true;

					source = {
						path = true;
						buffer = true;
						calc = true;
						nvim_lsp = true;
						nvim_lua = true;
						vsnip = false;
					};

					documentation = {
						border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'};
					}
				}
			end
		},
		{
			"onsails/lspkind-nvim",
			event = "InsertEnter",
			config = function() require("lspkind").init({with_text = false}) end
		},


		{
			'kyazdani42/nvim-tree.lua',
			cmd = "NvimTreeFindFile"
		},
		{
			"terrortylor/nvim-comment",
			cmd = "CommentToggle",
			config = function()
				require('nvim_comment').setup{
					marker_padding = true,
					comment_empty = false,
				}
			end
		},
		{
			'nvim-telescope/telescope.nvim',
			requires = {
				{'nvim-lua/popup.nvim'},
				{'nvim-lua/plenary.nvim'}
			},
			cmd = 'Telescope'
		},
		{
			'tpope/vim-fugitive',
			cmd = 'Git'
		},


		{
			'jiangmiao/auto-pairs',
			ft = {'python', 'lua', 'vue', 'svelte', 'go', 'vim', 'css'},
		},
		{
			'fatih/vim-go',
			ft = {'go'},
			run = ":GoUpdateBinaries"
		},


		{
			'lewis6991/gitsigns.nvim',
			requires = {'nvim-lua/plenary.nvim'},
			-- event = "InsertEnter",
			config = function() require('gitsigns').setup() end
		},


		{
			"akinsho/nvim-toggleterm.lua",
			cmd = {"TermExec", "ToggleTerm"},
			config = function()
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
			end
		},
		{
			'norcalli/nvim-colorizer.lua',
			ft = { "svelte", "vue", "html", "css", "javascript" },
			config = function()
				local color_options = {
					rgb_fn   = true;
					hsl_fn   = true;
					css      = true;
					css_fn   = true;
				}

				require("colorizer").setup {
					html = color_options;
					css = color_options;
					vue = color_options;
					svelte = color_options;
				}
			end
		}
	}
end

function M.InstallPlugins(use)
	for _, plugin in ipairs(M.PluginList()) do
		use(plugin)
	end
end

return M
