command! W :w " Sometimes I type :W instead of :w
command! Q :q

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
