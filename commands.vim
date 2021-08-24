command! W :w " Sometimes I type :W instead of :w
command! Q :q

call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"

" only / and ? are enabled by default
call wilder#set_option('modes', ['/', '?', ':'])

" lua << EOF
" require('formatter').setup(
	" true,
	" {
		" python = {
			" args = {"%"}
		" }
	" }
" )
" EOF
