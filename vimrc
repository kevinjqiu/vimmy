" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:


" Load vim-plug and plugin config {
set nocompatible

for file in split(glob("$HOME/.vim/*.vim"), '\n')
	exec 'source' file
endfor
" }

" General {
    syntax on
    filetype plugin indent on

    set cursorline              " highlight the current line
    set encoding=utf-8
    set ff=unix
    set nobackup
    set noswapfile
    set background=dark
    set number                  " show absolute line number on current line
    set relativenumber          " show relative line numbers
    set hidden                  " allow switching buffers without saving
    set mouse=a                 " enable mouse support in all modes
    set updatetime=300          " faster completion (default is 4000ms)
    set timeoutlen=500          " time to wait for mapped sequence
    set clipboard=unnamed       " use system clipboard
    set signcolumn=yes          " always show sign column (for git/lsp)
    set scrolloff=8             " keep 8 lines above/below cursor
    set sidescrolloff=8         " keep 8 columns left/right of cursor
    set completeopt=menu,menuone,noselect  " better completion experience
    set shortmess+=c            " don't show redundant messages
    set splitbelow              " horizontal splits go below
    set splitright              " vertical splits go right
    set termguicolors           " enable true color support

    " Better backup/swap/undo directories if they are enabled
    if has('persistent_undo')
        set undofile
        set undodir=$HOME/.vim/undo
        silent !mkdir -p $HOME/.vim/undo
    endif
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
