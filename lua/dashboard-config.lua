function GetDashboardDisplay(str, padding)
	local line_length = (2 * padding) + string.len(str)

	local first_line = "╭" .. string.rep("─", line_length) .. "╮"
	local last_line = string.format("╰%s╯", string.rep("─", line_length))
	local padding_line = "│" .. string.rep(" ", line_length) .. "│"
	local middle_line = "│" .. string.rep(" ", padding) .. str .. string.rep(" ", padding) .. "│"

	return {first_line, padding_line, middle_line, padding_line, last_line}
end

vim.g.dashboard_default_executive ='telescope'
vim.g.dashboard_custom_header = GetDashboardDisplay(
	"Let us remember: One book, one pen, one child, and one teacher can change the world.",
	5
)
vim.g.dashboard_custom_footer = {"The best preparation for tomorrow is doing your best today."}
