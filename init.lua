local home_dir = os.getenv("HOME")
local config_path = home_dir .. "/.config/nvim/"
local debug = true

local config_files = {
	"disable-builtins",
	"plugins",
	"keybinds",
	"autocomplete",
	"lsp-config",
	"colorscheme",
	"options",
	"nvimtree",
	"treesitter-config",
	"toggleterm-config",
	"dashboard-config"
}

vim.cmd("source " .. config_path .. "commands.vim")

local notifier = require"notify"

for i = 1, #config_files, 1
do
	local status_ok, err = pcall(
		require, config_files[i]
	)

	if not status_ok then
		notifier(
			"Error in " .. config_files[i] .. ".lua",
			vim.lsp.log_levels.ERROR,
			{title="Error in configuration!"}
		)
		if debug then print(err) end
	end
end
