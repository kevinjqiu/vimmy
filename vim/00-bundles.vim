call neobundle#begin(expand('$HOME/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" General
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/vimproc.vim', {
			\ 'build': {
			\ 	'linux': 'make',
			\ 	},
			\ }
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Valloric/YouCompleteMe', {
"            \ 'build'      : {
"            \     'unix'    : './install.py',
"            \     }
"            \ }
NeoBundle 'hashivim/vim-terraform'

" Color
NeoBundle 'flazz/vim-colorschemes'

" Python
NeoBundle 'klen/python-mode'

" Golang
NeoBundle 'fatih/vim-go'

" Javascript
NeoBundle 'pangloss/vim-javascript'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'

call neobundle#end()

NeoBundleCheck
