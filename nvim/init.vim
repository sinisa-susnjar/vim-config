set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
if has('nvim-gtk')
	source ~/.gvimrc 
endif
