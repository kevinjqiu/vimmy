Bundle 'gmarik/vundle'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'mileszs/ack.vim'
Bundle 'aghareza/vim-gitgrep'

" General
Bundle 'scrooloose/nerdtree'
Bundle 'kevinjqiu/vim-colors'
Bundle 'tpope/vim-surround'
" Bundle 'AutoClose'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/sessionman.vim'
Bundle 'matchit.zip'
" Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'
" Bundle 'Lokaltog/vim-easymotion'
Bundle 'godlygeek/csapprox'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'corntrace/bufexplorer'
Bundle 'ZoomWin'
Bundle 'Gist.vim'
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

" PHP
Bundle 'spf13/PIV'
Bundle 'joonty/vdebug'

" Python
Bundle 'klen/python-mode'
Bundle 'python.vim'
Bundle 'python_match.vim'
Bundle 'pythoncomplete'

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

" Misc
Bundle 'tpope/vim-markdown'
Bundle 'kevinjqiu/vimux'
Bundle 'fatih/vim-go'
Bundle 'kchmck/vim-coffee-script'
