require'compe'.setup {
	enabled = true;
	autocomplete = true;
	debug = false;
	min_length = 1;
	preselect = 'enable';
	throttle_time = 80;
	source_timeout = 200;
	resolve_timeout = 800;
	incomplete_delay = 400;
	max_abbr_width = 100;
	max_kind_width = 100;
	max_menu_width = 100;
	documentation = true;

	source = {
		path = true;
		buffer = true;
		calc = true;
		nvim_lsp = true;
		nvim_lua = true;
		vsnip = true;
	};
}

local function setup_servers()
	require'lspinstall'.setup()
	local servers = require'lspinstall'.installed_servers()
	for _, server in pairs(servers) do
		require'lspconfig'[server].setup{}
	end
end

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

setup_servers()
