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

	use 'kyazdani42/nvim-web-devicons'
	use {
		'kyazdani42/nvim-tree.lua',
		cmd = 'NvimTreeFindFile'
	}

	use {
		'lewis6991/gitsigns.nvim',
		requires = {'nvim-lua/plenary.nvim'}
	}

	use 'jiangmiao/auto-pairs'

	use {
		'hoob3rt/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	use 'romgrk/barbar.nvim'

	use 'neovim/nvim-lspconfig'
	use 'kabouzeid/nvim-lspinstall'
	use 'hrsh7th/nvim-compe'

	use {
		'ap/vim-css-color',
		ft = {'css', 'html', 'vue', 'svelte'}
	}

	use {
		'storyn26383/vim-vue',
		ft = {'vue'}
	}

	use 'joshdick/onedark.vim'
	use 'kristijanhusak/vim-hybrid-material'
	use 'dracula/vim'

	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && npm install',
		ft = 'markdown'
	}

	use 'hardcoreplayers/dashboard-nvim'
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'}
		},
		cmd = 'Telescope'
	}

	use {
		'rbgrouleff/bclose.vim',
		cmd = 'Ranger'
	}
	use {
		'francoiscabrol/ranger.vim',
		cmd = 'Ranger'
	}

	use 'airblade/vim-rooter'

	use {
		'fatih/vim-go',
		run = ':GoUpdateBinaries',
		ft = 'go'
	}

	use {
		'folke/twilight.nvim',
		cmd = 'Twilight'
	}
end)
