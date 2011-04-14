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
" Cursor line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline
" TODO: find a nice colour for the cursorline
" highlight CursorLine guibg=Xxx ctermbg=Xxx

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set encoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set ff=unix

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colours and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if system("uname") =~ 'Darwin'
    set gfn=Monaco:h12
else
    set gfn=Monaco\ 10
endif

set background=dark
if has("gui_running")
	set guioptions-=T
	set t_Co=256
    colorscheme up 
else
    colorscheme ir_black 
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
set wildignore+=*.o,*.obj,.git,*.rbc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]

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
" Bubble single line up/down
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <C-Up> [e
nmap <C-Down> ]e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bubble multiple lines up/down
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO: Doesn't work...
vmap <C-Up> [egv
vmap <C-Down> ]egv


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
inoremap jj <ESC>
map :tn :tabnew<CR>
map :tt :tabn<CR>
map t1 1gt
map t2 2gt
map t3 3gt
map t4 4gt
map t5 5gt
map t6 6gt
map t7 7gt
map t8 8gt
map t9 9gt

nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>
" the shift key is a bit sticky on Mac...
map :W :w
map :Q :q
map :Wq :wq

" traverse buffers
map <Leader>, :bn<CR>
map <Leader>. :bp<CR>

nmap <C-A> ggVG
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter,BufRead *.py source $HOME/.vim/conf/lang/python.vim
au BufEnter,BufRead *.rb source $HOME/.vim/conf/lang/ruby.vim
au BufEnter,BufRead *.php source $HOME/.vim/conf/lang/php.vim

source $HOME/.vim/conf/NERDTree.vim
source $HOME/.vim/conf/VimClojure.vim
source $HOME/.vim/conf/ConqueTerm.vim
source $HOME/.vim/conf/tcomment.vim
source $HOME/.vim/conf/Ack.vim
source $HOME/.vim/conf/ZoomWin.vim
source $HOME/.vim/conf/CommandT.vim
