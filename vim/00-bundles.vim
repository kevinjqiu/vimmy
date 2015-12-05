call neobundle#begin(expand('$HOME/.nvim/bundle'))

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
NeoBundle 'bling/vim-airline'
NeoBundle 'Shougo/neocomplete.vim'

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

" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

call neobundle#end()

NeoBundleCheck
