local home_dir = os.getenv("HOME")
local config_path = home_dir .. "/.config/nvim/"
local debug = true

local config_files = {
	"plugins",
	"keybinds",
	"autocomplete",
	"lsp-config",
	"colorscheme",
	"options",
	"nvimtree",
	"treesitter-config",
}

vim.cmd("source " .. config_path .. "commands.vim")

local notifier = require"notifier"

for i = 1, #config_files, 1
do
	local status_ok, err = pcall(
		vim.cmd, "luafile " .. config_path .. "lua/" .. config_files[i] .. ".lua"
	)

	if not status_ok then
		notifier.open(
			{"Error in " .. config_files[i] .. ".lua"}
		)

		if debug then print(err) end
	end
end

local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end
