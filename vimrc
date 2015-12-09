" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:


" Load neobundle and plugin config {
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=$HOME/.vim/bundle/neobundle.vim/
endif

for file in split(glob("$HOME/.vim/*.vim"), '\n')
	exec 'source' file
endfor
" }

" General {
    syntax on
    filetype plugin indent on

    set cursorline " highlight the current line
    set encoding=utf-8
    set ff=unix
    set nobackup
    set noswapfile
    set background=dark
    set relativenumber
" }

" Whitespace {
    set autoindent
    set tabstop=4
    set smartindent
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set backspace=indent,eol,start  | " Allow backspacing over everything in insert mode
" }

" Searching {
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
" }

" Tab completion {
    set wildmode=list:longest,list:full
    set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc
" }

" { Overwrite with local config
if filereadable(expand("$HOME/.vimrc.local"))
    source $HOME/.vimrc.local
endif
" }
