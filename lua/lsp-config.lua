local function setup_servers()
	require'lspinstall'.setup()
	local servers = require'lspinstall'.installed_servers()
	for _, server in pairs(servers) do
		require'lspconfig'[server].setup{
			settings = {
				Lua = {
					diagnostics = {
						globals = {'vim'}
					}
				}
			}
		}
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

require("formatter").setup({
	filetype = {
		vue = {
			function()
				return {
					exe = "prettier",
					args = { "--write", "--use-tabs", vim.api.nvim_buf_get_name(0) },
					stdin = false
				}
			end
		},
		svelte = {
			function()
				return {
					exe = "prettier",
					args = { "--write", "--use-tabs", vim.api.nvim_buf_get_name(0) },
					stdin = false
				}
			end
		},
		python = {
			function()
				return {
					exe = "black",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = false
				}
			end
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = { vim.api.nvim_buf_get_name(0) },
					stdin = false
				}
			end
		}
	}
})

vim.api.nvim_exec([[
	augroup FormatAutogroup
		autocmd!
		autocmd BufWritePost *.py,*.vue,*.svelte,*.lua FormatWrite
	augroup END
]], true)
