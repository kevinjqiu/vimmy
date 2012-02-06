set nocompatible
" Vundle needs to be sourced first 
source $HOME/.vim/conf/vundle.vim

set ruler
" keep cusion space when scrolling up/down
set scrolloff=3 
set showcmd
set ttyfast
" only available in 7.3
set relativenumber  
" briefly jump to the matching bracket
set showmatch 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

syntax on
filetype plugin indent on

" Ctrl+N twice to toggle show line number
nmap <C-N><C-N> :set invnumber<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set ff=unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if system("uname") =~ 'Darwin'
    set gfn=Monaco:h13
else
    set gfn=Monaco\ 9
endif

set background=dark
if has("gui_running")
	set guioptions-=T
	set t_Co=256
    colorscheme molokai 
    set cursorline " cursor line only when in GUI mode
else
    colorscheme nour 
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set tabstop=4
set smartindent
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set ignorecase
set smartcase

" highlight the word under cursor (with hlsearch on)
nnoremap <Leader>g *N
nnoremap / /\v
vnoremap / /\v
nnoremap <leader><space> :noh<cr>
" use tab to find matching pairs
nnoremap <tab> % 
vnoremap <tab> %
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remember last location in file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	  \| exe "normal g'\"" | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Allow backspacing over everything in insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Directories for swp files
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=~/.vim/backup
set directory=~/.vim/backup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl+F2 to toggle menu/toolbar under GUI
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar> set guioptions-=T  <Bar> set guioptions-=m  <Bar> else <Bar> set guioptions+=T <Bar> set guioptions+=m <Bar> endif <CR>
" initially remove toolbar and menu
set guioptions-=T
set guioptions-=m

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alt-Up/Down: Don't skip wrapped lines when navigating
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: Alt key doesn't work on my Linux console...gvim works 
map <A-j> gj
map <A-k> gk
imap <A-j> <Esc>gji
imap <A-k> gki

" fix typos for me please
abbreviate slef self

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Alt-Up/Down: Don't skip wrapped lines when navigating
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if bufwinnr(1)
    nnoremap + <C-W>+
    nnoremap - <C-W>-
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keymaps 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-Space> <C-x><C-o> 
inoremap jj <ESC>
map :tn :tabnew<CR>
map :tt :tabn<CR>
map <Leader>T :tabnew<CR>
map t1 1gt
map t2 2gt
map t3 3gt
map t4 4gt
map t5 5gt
map t6 6gt
map t7 7gt
map t8 8gt
map t9 9gt
map <F3> :Tlist<CR>
map <Leader>B :!ctags -R .<CR>
map <Leader>v :tabnew ~/.vimrc<CR>
map <Leader>V :tabnew ~/.vimrc.local<CR>
nnoremap <Leader>q :q<CR>

nnoremap Q :tabc<CR>

nnoremap <C-s-h> :tabp<CR>
nnoremap <C-s-l> :tabn<CR>
" Ctrl-j = page down
nnoremap <C-s-j> <C-d>
" Ctrl-k = page up
nnoremap <C-s-k> <C-b>
imap <C-Space> <C-x><C-o>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" toggle show whitespace
nmap <Leader>w :set list!<CR>
set listchars=tab:▸\ ,eol:¬ 
" the shift key is a bit sticky on Mac...
map :W :w
map :Q :q
map :Wq :wq

" traverse buffers
map <Leader>, :bn<CR>
map <Leader>. :bp<CR>

nmap <C-A> ggVG

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Full screen mode (only works in MacVim)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if system("uname") =~ 'Darwin'
    set fuopt+=maxhorz                      " grow to maximum horizontal width on entering fullscreen mode
    nmap <C-f> :set invfu<CR>                " toggle fullscreen mode
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter,BufRead,BufNewFile,FileReadPost *.py source $HOME/.vim/conf/lang/python.vim
au BufEnter,BufRead,BufNewFile,FileReadPost *.php source $HOME/.vim/conf/lang/php.vim
au BufEnter,BufRead,BufNewFile,FileReadPost *.rb,Gemfile,Rakefile source $HOME/.vim/conf/lang/ruby.vim
au BufEnter,BufRead,BufNewFile,FileReadPost *.clj source $HOME/.vim/conf/VimClojure.vim
au BufEnter,BufRead,BufNewFile,FileReadPost *.scala set ft=scala

source $HOME/.vim/conf/NERDTree.vim
source $HOME/.vim/conf/ctrlp.vim
source $HOME/.vim/conf/tcomment.vim
source $HOME/.vim/conf/Ack.vim
source $HOME/.vim/conf/ZoomWin.vim
source $HOME/.vim/conf/spectrum.vim
source $HOME/.vim/conf/pyflakes.vim
source $HOME/.vim/conf/FreshBooks.vim
source $HOME/.vim/conf/powerline.vim

" overwrite with local settings if .vimrc.local exists
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
