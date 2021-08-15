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

vim.cmd [[
	let g:len_plug = len(globpath('/home/pythonaddict/.local/share/nvim/site/pack/packer/start/', '*', 0, 1))
	let g:len_unloaded = len(globpath('/home/pythonaddict/.local/share/nvim/site/pack/packer/opt/', '*', 0, 1))
]]

vim.g.dashboard_default_executive ='telescope'
vim.g.dashboard_custom_header = GetDashboardDisplay(
	"Sometimes it pays to stay in bed on Monday, rather than spending the rest of the week debugging Monday's code.",
	10
)
vim.g.dashboard_custom_footer = {
	"Found " .. vim.g.len_plug + vim.g.len_unloaded .. " installed plugins"
}
