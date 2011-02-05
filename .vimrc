set nocompatible
set ruler
set scrolloff=3 " keep cusion space when scrolling up/down
set showcmd
set ttyfast
set relativenumber  " only available in 7.3
set showmatch " briefly jump to the matching bracket

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
set gfn=Monaco:h16
" set gfn=Andale\ Mono:h16
" set gfn=Anonymous\ Pro:h16
" set gfn=Menlo:h16
set background=dark
if has("gui_running")
	set guioptions-=T
	set t_Co=256
    " colorscheme railscasts
    " colorscheme mustang
    colorscheme molokai
    " colorscheme clouds
else
    " colorscheme wombat
    " colorscheme zellner
    colorscheme peaksea 
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

au BufRead *.php set noexpandtab " Don't expand tab for PHP

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
map <A-DOWN> gj
map <A-UP> gk
imap <A-DOWN> <Esc>gji
imap <A-UP> gki


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

" the shift key is a bit sticky on Mac...
map :W :w
map :Q :q
map :Wq :wq


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/conf/FuzzyFinder.vim
source $HOME/.vim/conf/NERDTree.vim
source $HOME/.vim/conf/VimClojure.vim
source $HOME/.vim/conf/ConqueTerm.vim
source $HOME/.vim/conf/tcomment.vim

