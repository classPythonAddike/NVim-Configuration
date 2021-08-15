local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}

require'lspconfig'.jedi_language_server.setup{
	capabilities = capabilities
}
require'lspconfig'.gopls.setup{
	capabilities = capabilities
}
require'lspconfig'.svelte.setup{
	capabilities = capabilities
}
require'lspconfig'.vimls.setup{
	capabilities = capabilities
}
require'lspconfig'.vuels.setup{
	capabilities = capabilities
}


