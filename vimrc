" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=$HOME/.nvim/bundle/neobundle.vim/
endif

filetype plugin indent on

for file in split(glob("$HOME/.nvim/*.vim"), '\n')
	exec 'source' file
endfor

set cursorline " highlight the current line

" General {
    syntax on
    filetype plugin indent on

    set encoding=utf-8
    set ff=unix
    set nobackup
    set noswapfile
    set background=dark
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
