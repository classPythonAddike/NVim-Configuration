local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --  print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --  print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

	use 'kyazdani42/nvim-tree.lua'

	use {
		'lewis6991/gitsigns.nvim',
		requires = {'nvim-lua/plenary.nvim'},
	}

	use {
		'jiangmiao/auto-pairs',
		ft = {'python', 'lua', 'vue', 'svelte', 'go', 'javascript', 'vim', 'css', 'html'},
		after = "nvim-compe"
	}

	use 'kyazdani42/nvim-web-devicons'
	use 'romgrk/barbar.nvim'
	use 'hoob3rt/lualine.nvim'

	use 'neovim/nvim-lspconfig'
	use {
		'hrsh7th/nvim-compe',
		event = "InsertEnter",
		config = function()
			require'compe'.setup {
				enabled = true;
				autocomplete = true;
				documentation = true;

				source = {
					path = true;
					buffer = true;
					calc = true;
					nvim_lsp = true;
					nvim_lua = true;
					vsnip = false;
					ultisnip = true;
				};

				documentation = {
					border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'};
				}
			}
		end
	}
	use {
		"terrortylor/nvim-comment",
		after = "nvim-compe",
		config = function()
			require('nvim_comment').setup{
				marker_padding = true,
				comment_empty = false,
			}
		end
	}

	use {
		'honza/vim-snippets',
		ft = {'python', 'lua', 'vue', 'svelte', 'go', 'javascript', 'vim', 'css', 'html'}
	}
	use {
		'SirVer/ultisnips',
		ft = {'python', 'lua', 'vue', 'svelte', 'go', 'javascript', 'vim', 'css', 'html'}
	}

	use {
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
	}
	
	use {
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
	use 'joshdick/onedark.vim'
	use {
		'dracula/vim',
		cmd = "colorscheme"
	}
	use {
		'shaunsingh/nord.nvim',
		cmd = "colorscheme"
	}

	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		ft = 'markdown'
	}

	use 'glepnir/dashboard-nvim'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'}
		},
		cmd = 'Telescope'
	}

	use {
		'fatih/vim-go',
		run = ':GoUpdateBinaries',
		ft = 'go'
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use 'rbgrouleff/bclose.vim'
	use 'francoiscabrol/ranger.vim'
	use 'rcarriga/nvim-notify'

	use {
		'gelguy/wilder.nvim',
		run = ':UpdateRemotePlugins'
	}

	use 'justinmk/vim-sneak'
	use {
		'tpope/vim-fugitive',
		cmd = 'Git'
	}
end)
