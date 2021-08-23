local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

return require("packer").startup{
	require("plugin-list").InstallPlugins,
	config = {
		display = {
			open_fn = function() return require('packer.util').float({border = 'single'}) end,
		}
	},
	compile_on_sync = true,
	auto_clean = true
}
