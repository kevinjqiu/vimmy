Bundle 'gmarik/vundle'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'mileszs/ack.vim'
Bundle 'aghareza/vim-gitgrep'

" General
Bundle 'scrooloose/nerdtree'
Bundle 'kevinjqiu/vim-colors'
Bundle 'romainl/Apprentice'
Bundle 'tpope/vim-surround'
" Bundle 'AutoClose'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/sessionman.vim'
Bundle 'matchit.zip'
Bundle 'bling/vim-airline'
Bundle 'godlygeek/csapprox'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'corntrace/bufexplorer'
Bundle 'ZoomWin'
Bundle 'WebAPI.vim'

"General Programming
Bundle 'scrooloose/syntastic'
Bundle 'kevinjqiu/vim-snipmate'
Bundle 'kevinjqiu/snipmate-snippets'
" Source support_function.vim to support snipmate-snippets.
if filereadable(expand("~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim"))
    source ~/.vim/bundle/snipmate-snippets/snippets/support_functions.vim
endif

Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdcommenter'
" Bundle 'godlygeek/tabular'
if executable('ctags')
    Bundle 'majutsushi/tagbar'
endif
Bundle 'Shougo/neocomplcache'

" Python
Bundle 'klen/python-mode'
Bundle 'python_match.vim'

" Javascript
Bundle 'leshill/vim-json'
Bundle 'groenewege/vim-less'
Bundle 'taxilian/vim-web-indent'

" HTML
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'ChrisYip/Better-CSS-Syntax-for-Vim'
Bundle 'Handlebars'

" Ruby
" Bundle 'tpope/vim-rails'
Bundle 'Puppet-Syntax-Highlighting'

" Clojure
Bundle "VimClojure"

" Rust
Plugin 'rust-lang/rust.vim'

" Misc
Bundle 'tpope/vim-markdown'
Bundle 'kevinjqiu/vimux'
Bundle 'fatih/vim-go'
Bundle 'kchmck/vim-coffee-script'
Bundle 'handlebars'
