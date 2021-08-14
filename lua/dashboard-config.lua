function first_word(str)
	for i in string.gmatch(string.reverse(str), "%S+") do
		return string.reverse(i)
	end
end

function GetDashboardDisplay(str, padding)
	local line_length = (2 * padding) + string.len(str)

	first_line = string.format("╭%s╮", string.rep("─", line_length))
	last_line = string.format("╰%s╯", string.rep("─", line_length))

	padding_line = string.format("│%s│", string.rep(" ", line_length))

	middle_line = string.format(
		"│%s%s%s│",
		string.rep(" ", padding),
		str,
		string.rep(" ", padding)
	)

	return {first_line, padding_line, middle_line, padding_line, last_line}
end

vim.cmd("let g:startup_time = readfile('/home/pythonaddict/profile.log', '', 4)[-1]")
vim.g.startup_time = tonumber(first_word(vim.g.startup_time)) * 1000

vim.cmd [[
	let g:len_plug = len(globpath('/home/pythonaddict/.local/share/nvim/site/pack/packer/start/', '*', 0, 1))
	let g:len_unloaded = len(globpath('/home/pythonaddict/.local/share/nvim/site/pack/packer/opt/', '*', 0, 1))
]]

vim.g.dashboard_default_executive ='telescope'
vim.g.dashboard_custom_header = GetDashboardDisplay(
	string.format("NeoVim Startup Time - %.2f ms", vim.g.startup_time),
	15
)
vim.g.dashboard_custom_footer = {
	"Found " .. vim.g.len_plug + vim.g.len_unloaded .. " installed plugins"
}
