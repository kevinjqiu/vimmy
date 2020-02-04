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
"NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Konfekt/FastFold'

NeoBundle 'hashivim/vim-terraform'

" Color
NeoBundle 'flazz/vim-colorschemes'

" Python
NeoBundle 'neoclide/coc.nvim', 'release', { 'build': { 'others': 'git checkout release' } }
NeoBundle 'neoclide/coc-python'

" Golang
NeoBundle 'fatih/vim-go'

" Javascript
NeoBundle 'pangloss/vim-javascript'

" Ruby
NeoBundle 'vim-ruby/vim-ruby'

" Rust
NeoBundle 'rust-lang/rust.vim'

NeoBundle 'stephpy/vim-yaml'

call neobundle#end()

NeoBundleCheck
