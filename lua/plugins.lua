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
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

return require("packer").startup(function(use)
	-- Packer can manage itself as an optional plugin
	use "wbthomason/packer.nvim"

	use 'glepnir/dashboard-nvim'

	use 'kyazdani42/nvim-web-devicons'
	use 'romgrk/barbar.nvim'
	use 'hoob3rt/lualine.nvim'

	use 'rcarriga/nvim-notify'
	use 'justinmk/vim-sneak'

	use 'neovim/nvim-lspconfig'

	use 'joshdick/onedark.vim'
	use 'dracula/vim'
	use 'shaunsingh/nord.nvim'


	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
	use {
		'gelguy/wilder.nvim',
		run = ':UpdateRemotePlugins'
	}


	use {
		'kyazdani42/nvim-tree.lua',
		cmd = "NvimTreeFindFile"
	}
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'}
		},
		cmd = 'Telescope'
	}
	use {
		'tpope/vim-fugitive',
		cmd = 'Git'
	}
	use {
		'francoiscabrol/ranger.vim',
		requires = {
			'rbgrouleff/bclose.vim'
		},
		cmd = {"Ranger", "RangerCurrentDirectory"}
	}


	use {
		'jiangmiao/auto-pairs',
		ft = {'python', 'lua', 'vue', 'svelte', 'go', 'vim', 'css'},
	}
	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		ft = 'markdown'
	}
	use {
		'fatih/vim-go',
		run = ':GoUpdateBinaries',
		ft = 'go'
	}


	use {
		'lewis6991/gitsigns.nvim',
		requires = {'nvim-lua/plenary.nvim'},
		event = "InsertEnter",
		config = function() require('gitsigns').setup() end
	}
	use {
		'ms-jpq/coq_nvim',
		branch = 'coq',
		event = "VimEnter",
		config = function() vim.cmd(":COQnow") end,
		requires = {
			'ms-jpq/coq.artifacts',
			branch = 'artifacts'
		}
	}
	use {
		"terrortylor/nvim-comment",
		event = "InsertEnter",
		config = function()
			require('nvim_comment').setup{
				marker_padding = true,
				comment_empty = false,
			}
		end
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
end)
