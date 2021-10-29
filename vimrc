" Configure Vundle and add plugins.
" See https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'wincent/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Put your non-Plugin stuff after this line





" Use all available colours.
:set termguicolors

" Remap switching between splits from <C-w> w to <TAB>.
:nnoremap <TAB> <C-w>w

" Set some nice whitespace listchars.
:set list listchars=nbsp:·,eol:¶,trail:·,tab:»\ 

" Use search highlighting and incremental search.
:set hlsearch
:set incsearch

" Use unlimited undo.
:set undodir=~/.vim/undodir
:set undofile

" Highlight cursor line.
set cursorline

" Set tag location(s).
:set tags=./.tags,~/.tags

" Get rid of annoying auto comments
:set formatoptions-=cro

" Use unicode encoding.
:set encoding=UTF-8

" Set window title to current file.
set title

" Enable file type plugin.
:filetype plugin on

" Use vsdark colour scheme with extra highlighting.
:colorscheme vsdark
let g:Vsd={'extra_highlight':1}

" Enable syntax highlighting.
:syntax on

" Show list of wildcard matches.
:set wildmode=list:longest

" Map file types I use often to the appropriate suffixes.
augroup filetype
	" au! BufRead,BufNewFile *.py let g:jedi#auto_initialization = 1
	au! BufRead,BufNewFile *.pc set filetype=esqlc
	au! BufRead,BufNewFile *.cp set filetype=esqlc
	au! BufRead,BufNewFile *.php.inc set filetype=php
	au! BufRead,BufNewFile *.ini set filetype=conf
	au! BufNewFile,BufRead *.cypher setfiletype cypher
	au! BufNewFile,BufRead *.cql setfiletype cypher
	au! BufNewFile,BufRead *.mq[h45] setfiletype mql4
	au! BufNewFile,BufRead *.gcov setfiletype gcov
	"""au! BufNewFile,BufRead *.d let g:deoplete#enable_at_startup = 1
augroup END

" Some handy mappings.
:map Y :.,'ay<CR>
:map D :.,'ad<CR>
:map + mb:.,'a><CR>'b
:map - mb:.,'a<<CR>'b

:se ai nu ts=4 sw=4 noeb nows errorfile=c.err "expandtab
