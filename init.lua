local debug = true

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

local config_files = {
	"plugins",
	"disable-builtins",
	"keybinds",
	"lsp-config",
	"colorscheme",
	"options",
	"nvimtree",
	"treesitter-config",
	"dashboard-config",
}

for i = 1, #config_files, 1 do
	local status_ok, err = pcall(require, config_files[i])

	local notifier = require("notify")

	if not status_ok then
		notifier(
			"Error in " .. config_files[i] .. ".lua",
			vim.lsp.log_levels.ERROR,
			{ title = "Error in configuration!" }
		)
		if debug then
			print(err)
		end
	end
end
