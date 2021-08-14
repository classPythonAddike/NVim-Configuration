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

	use {
		'kyazdani42/nvim-tree.lua',
		event = 'VimEnter'
	}

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
	use {
		'romgrk/barbar.nvim',
		event = "VimEnter"
	}
	use {
		'hoob3rt/lualine.nvim',
	}

	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-compe'
	use "terrortylor/nvim-comment"

	use {
		'honza/vim-snippets',
		ft = {'python', 'lua', 'vue', 'svelte', 'go', 'javascript', 'vim', 'css', 'html'}
	}
	use {
		'SirVer/ultisnips',
		ft = {'python', 'lua', 'vue', 'svelte', 'go', 'javascript', 'vim', 'css', 'html'}
	}

	use "akinsho/nvim-toggleterm.lua"
	
	use 'norcalli/nvim-colorizer.lua'

	use 'joshdick/onedark.vim'
	use 'kristijanhusak/vim-hybrid-material'
	use 'dracula/vim'
	use 'shaunsingh/nord.nvim'

	use 'yamatsum/nvim-cursorline'

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

	use {
		'rbgrouleff/bclose.vim',
		event = "VimEnter"
	}
	use {
		'francoiscabrol/ranger.vim',
		event = "VimEnter"
	}

	use 'rcarriga/nvim-notify'

	use {
		'gelguy/wilder.nvim',
		run = ':UpdateRemotePlugins'
	}

	use {
		'justinmk/vim-sneak',
		event = "VimEnter"
	}

	use {
		'tpope/vim-fugitive',
		cmd = 'Git'
	}
end)
