" Configure Vundle and add plugins.
" See https://github.com/VundleVim/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required
" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle.
Plugin 'VundleVim/Vundle.vim'
" Awesome git plugin.
Plugin 'tpope/vim-fugitive'
" Fast fuzzy search. Start with <leader>t
Plugin 'wincent/command-t.git'
" Add C++ manual eg from cppreference.com
Plugin 'skywind3000/vim-cppman'
" View and search LSP symbols and tags.
Plugin 'liuchengxu/vista.vim'
" Add enhanced C++ syntax highlighting.
Plugin 'octol/vim-cpp-enhanced-highlight'
" Add git gutter marks.
Plugin 'airblade/vim-gitgutter'
" Get nerdtree file and directory plugin.
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
" Get devicons for nerdtree and enable additional highlighting.
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" Add vim-airline for a nicer status line.
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Add neovim LSP plugin.
Plugin 'neovim/nvim-lspconfig'
" Add deoplete auto completion plugin(s)
Plugin 'shougo/deoplete.nvim'
Plugin 'deoplete-plugins/deoplete-lsp'
" Get EditorConfig plugin.
Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Put your non-Plugin stuff after this line

" ------------------------------------------------------------------------------
" Configure shortcuts for vim-fugitive plugin.
" Default <leader> key is \ and can be easily remapped to eg Space like this:
" :let mapleader = "\<Space>"
map <leader>gb :Git blame<CR>
map <leader>gc :Git commit<CR>
map <leader>gd :Gdiff<CR>
map <leader>gl :Gclog<CR>
map <leader>gp :Git push<CR>
map <leader>gs :Git<CR>
noremap <F2> :Gvdiffsplit <CR>

" ------------------------------------------------------------------------------
" Configure vim-cppman to show help for the word under the cursor when pressing K
" You will need to install and configure the cppman package for that, eg on Ubuntu:
" sudo apt install cppman
" cppman --source=cppreference.com
" cppman --cache-all --force-update (takes a looong time, only needed when working offline)
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Cppman ' . str
    " execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()
au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

" ------------------------------------------------------------------------------
" Configure vista plugin to open when F12 is pressed.
noremap <F12> :Vista!! <CR>

" ------------------------------------------------------------------------------
" Configure nerdtree plugin.
map <c-l> :tabn<CR>
map <c-h> :tabp<CR>
" map <c-n> :tabnew<CR>
noremap <F1> :NERDTreeToggle <CR>

" let g:NERDTreeSyntaxDisableDefaultExtensions = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
" let g:NERDTreeSyntaxEnabledExtensions = ['c', 'h', 'cc', 'pl', 'p6', 'sh']

" ------------------------------------------------------------------------------
" Configure airline statusbar.
set laststatus=2
set ttimeoutlen=50
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='luna'
"let g:airline_theme='badwolf'
"let g:airline_theme='dark'
let g:airline_theme='bubblegum'
"In order to see the powerline fonts, adapt the font of your terminal
"In Gnome Terminal: “use custom font” in the profile. See eg nerdfonts.com
let g:airline_powerline_fonts = 1

" ------------------------------------------------------------------------------
" Configure deoplete auto completion engine.
let g:deoplete#enable_at_startup = 1
let g:deoplete#lsp#handler_enabled = v:true
let g:deoplete#lsp#use_icons_for_candidates = v:true

" ------------------------------------------------------------------------------
" Configure C/C++ LSP server.
" For cmake based projects, run "cmake .. -D CMAKE_EXPORT_COMPILE_COMMANDS=TRUE"
" and copy the resulting compile_commands.json to the project root.
lua require'lspconfig'.clangd.setup{}

" ------------------------------------------------------------------------------
" Configure D LSP server.
lua require'lspconfig'.serve_d.setup{}

" ------------------------------------------------------------------------------
" Let EditorConfig and Fugitive play nice together.
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

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

" Nicer LSP error/warning/hint markers.
:highlight LspDiagnosticsDefaultError guifg=red
:highlight LspDiagnosticsDefaultWarning guifg=orange
:highlight LspDiagnosticsDefaultHint guifg=lightyellow

" Show list of wildcard matches.
:set wildmode=list:longest

" Map file types I commonly use to the appropriate suffixes.
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
augroup END

" Some handy mappings.
:map Y :.,'ay<CR>
:map D :.,'ad<CR>
:map + mb:.,'a><CR>'b
:map - mb:.,'a<<CR>'b

" Set auto-indent, line numbers, 4 char tab, no error bell, no wrap scan,
" error file, uncomment expandtab if you rather like spaces than tabs.
:se ai nu ts=4 sw=4 noeb nows errorfile=c.err "expandtab

" Enable mouse in (n)ormal and (v)isual mode.
:se mouse=nv
