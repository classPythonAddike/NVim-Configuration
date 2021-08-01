local home_dir = os.getenv("HOME")
local config_path = home_dir .. "/.config/nvim/"
local debug = true

local config_files = {
	"plugins",
	"keybinds",
	"autocomplete",
	"colorscheme",
	"options",
	"nvimtree"
}

vim.cmd("source " .. config_path .. "commands.vim")

for i = 1, #config_files, 1
do
	local status_ok, error = pcall(
		vim.cmd, "luafile " .. config_path .. "lua/" .. config_files[i] .. ".lua"
	)

	if not status_ok then
		print("Something is wrong with " .. config_files[i] .. ".lua")

		if debug then
			print(error)
		end
	end
end
