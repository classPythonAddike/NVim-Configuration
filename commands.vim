command! W :w " Sometimes I type :W instead of :w
command! Q :q

call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" only / and ? are enabled by default
call wilder#set_option('modes', ['/', '?', ':'])

function FormatPyFiles()
	:silent exec "!black %"
	:e!
endfunction

function FormatSvelteFiles()
	:silent exec "!prettier --write --use-tabs %"
	:e!
endfunction

" autocmd BufWritePost *.py :call FormatPyFiles()
" autocmd BufWritePost *.svelte :call FormatSvelteFiles()

lua << EOF
require('formatter').setup(
	true,
	{
		python = {
			args = {"%"}
		}
	}
)
EOF

