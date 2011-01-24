set nocompatible

set ruler
syntax on
filetype plugin indent on

" Cursor line
set cursorline
" TODO: find a nice colour for the cursorline
" highlight CursorLine guibg=Xxx ctermbg=Xxx

" Set encoding
set encoding=utf-8

" Whitespace stuff
set tabstop=4
set smartindent
set shiftwidth=4
set softtabstop=4
set expandtab " Not for PHP at work
set autoindent

" Color stuff and font
colorscheme desert 
set guifont=Monaco\ 11

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Status bar
set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]

" Remember last location in file
if has("autocmd")
	au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
	  \| exe "normal g'\"" | endif
endif

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Bubble single line up/down
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines up/down
vmap <C-Up> [egv
vmap <C-Down> ]egv

map :Q :q

"Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup

" Plugin specific settings
let vimclojure#HighlightBuiltins = 1
let vimclojure#ParenRainbow = 1

" Ctrl+F2 to toggle menu/toolbar under GUI
map <silent> <C-F2> :if &guioptions =~# 'T' <Bar> set guioptions-=T  <Bar> set guioptions-=m  <Bar> else <Bar> set guioptions+=T <Bar> set guioptions+=m <Bar> endif <CR>
" initially remove toolbar and menu
set guioptions-=T
set guioptions-=m

