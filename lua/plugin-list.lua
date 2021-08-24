local M = {}

function M.PluginList()
	return {
		"wbthomason/packer.nvim",

		'glepnir/dashboard-nvim',

		{'akinsho/nvim-bufferline.lua', requires = 'kyazdani42/nvim-web-devicons'},
		'hoob3rt/lualine.nvim',
		'rcarriga/nvim-notify',
		'justinmk/vim-sneak',
		-- For dev purposes
		-- '/home/pythonaddict/AllFolders/LuaProjects/formatter/',

		'neovim/nvim-lspconfig',
		'kabouzeid/nvim-lspinstall',

		'shaunsingh/nord.nvim',
		'folke/tokyonight.nvim',
		'marko-cerovac/material.nvim',


		{
			'nvim-treesitter/nvim-treesitter',
			run = ':TSUpdate'
		},
		{
			'gelguy/wilder.nvim',
			run = ':UpdateRemotePlugins'
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
			'lewis6991/gitsigns.nvim',
			requires = {'nvim-lua/plenary.nvim'},
			event = "InsertEnter",
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
