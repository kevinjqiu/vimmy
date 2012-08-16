" vim: set foldmarker={,} foldlevel=0 foldmethod=marker:
" Environment {
    " Basics {
        set nocompatible
        set background=dark
    " }
    "
    " Vundle {
        set rtp+=$HOME/.vim/bundle/vundle
        set rtp+=$HOME/.vim/_local
        call vundle#rc()

        source $HOME/.vim/bundles.vim
    " }
    "
    " UI {
        set ruler
        set scrolloff=3 " keep cusion space when scrolling up/down
        set showcmd
        set ttyfast
        " only available in 7.3
        set relativenumber  
        set showmatch " briefly jump to the matching bracket
        set listchars=tab:▸\ ,eol:¬ 

        if has("gui_running")
            set guioptions-=T
            set t_Co=256
            set cursorline " cursor line only when in GUI mode
            " Ctrl+F2 to toggle menu/toolbar under GUI
            map <silent> <C-F2> :if &guioptions =~# 'T' <Bar> set guioptions-=T  <Bar> set guioptions-=m  <Bar> else <Bar> set guioptions+=T <Bar> set guioptions+=m <Bar> endif <CR>
            " initially remove toolbar and menu
            set guioptions-=T
            set guioptions-=m
        endif

        set cursorline " highlight the current line

        " Remember last location in file
        if has("autocmd")
            au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
              \| exe "normal g'\"" | endif
        endif

        set laststatus=2
        if system("uname") =~ 'Darwin'
            " Full screen mode (only works in MacVim)
            set fuopt+=maxhorz " grow to maximum horizontal width on entering fullscreen mode
            " toggle fullscreen mode
            nmap <C-f> :set invfu<CR>
        endif
    " }
" }

" General {
    syntax on
    filetype plugin indent on

    set encoding=utf-8
    set ff=unix
    set backupdir=~/.vim/backup
    set directory=~/.vim/backup
" }

" Whitespace {
    set autoindent
    set tabstop=4
    set smartindent
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set backspace=indent,eol,start " Allow backspacing over everything in insert mode
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

" Key mapping {
    let mapleader = ","

    " Ctrl+N twice to toggle show line number
    nmap <C-N><C-N> :set invnumber<CR>

    " highlight the word under cursor (with hlsearch on)
    nnoremap <Leader>g *N
    nnoremap / /\v
    vnoremap / /\v
    nnoremap <leader><space> :noh<cr>

    inoremap <C-Space> <C-x><C-o> 
    inoremap jj <ESC>
    map <silent><Leader>T :tabnew<CR>
    map t1 1gt
    map t2 2gt
    map t3 3gt
    map t4 4gt
    map t5 5gt
    map t6 6gt
    map t7 7gt
    map t8 8gt
    map t9 9gt

    map <F3> :TagbarToggle<CR>
    map <Leader>B :!ctags -R .<CR>
    map <Leader>v :tabnew ~/.vimrc<CR>
    map <Leader>V :tabnew ~/.vimrc.local<CR>
    nnoremap <Leader>q :q<CR>

    nnoremap Q :tabc<CR>

    nnoremap <silent><C-u> :tabp<CR>
    nnoremap <silent><C-p> :tabn<CR>

    nnoremap <C-h> <C-w>h
    nnoremap <C-l> <C-w>l
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k

    " toggle show whitespace
    nmap <Leader>w :set list!<CR>

    " the shift key is a bit sticky on Mac...
    map :W :w
    map :Q :q
    map :Wq :wq

    " traverse buffers
    map <Leader>, :bn<CR>
    map <Leader>. :bp<CR>

    " redraw the screen
    nnoremap U :syntax sync fromstart<CR>:redraw!<CR>
" }

" TEMPORARY HACK
source ~/.vim/_local/plugin/ctrlp.vim

" overwrite with local settings if .vimrc.local exists
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
