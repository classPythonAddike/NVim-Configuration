local lspinstall = require"lspinstall"

local ensure_installed = { "go", "python", "svelte", "lua", "vue", "vim", "json" }
local ignore_filetypes = {
	".gitignore",
	"yaml",
	"yml",
	""
}

local installed = false

function Make_set(list)
    local set = {}
	for _, l in ipairs(list) do set[l] = true end
	return set
end

function InstallServers()

	if installed then return end

	local installed_servers = Make_set(lspinstall.installed_servers())
	for _, server in ipairs(ensure_installed)
	do
		if not installed_servers[server] then
			require"notifier".open({"Installing LSP Server for " .. server})
			lspinstall.install_server(server)
		end
	end

	installed = true
end

function InstallLSPServers()

	if not installed then return end

	local ft = vim.bo.filetype
	local installed_servers = lspinstall.installed_servers()

	for _, serv in ipairs(installed_servers) do
		if serv == ft then
			return
		end
	end

	for _, i in ipairs(ignore_filetypes) do
		if ft == i then
			return
		end
	end

	vim.cmd [[
		let g:install_choice = input('Install LSP Server [Y/n]: ')
	]]

	table.insert(ignore_filetypes, ft)

	if vim.g.install_choice == "n" then return end

	lspinstall.install_server(ft)
	setup_servers()
	require"notifier".open({"Installing Server for " .. ft})
end

vim.cmd [[
	autocmd BufWritePost * lua InstallLSPServers()
	autocmd BufWritePost * lua InstallServers()
]]
