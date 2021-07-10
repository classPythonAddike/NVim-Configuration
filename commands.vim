command TestGoProject :!go test .
command CleanGoProject :!go clean -x

command W :w " Sometimes I type :W instead of :w
command Q :q

hi FloatermBorder guifg=grey
command NewFloatTerm :FloatermNew --height=0.7 --width=0.9
