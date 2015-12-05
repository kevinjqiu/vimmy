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

nnoremap <c-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nmap <Leader>w :set list!<CR>   |" toggle show whitespace

" the shift key is a bit sticky on Mac...
map :W :w
map :Q :q
map :Wq :wq

" traverse buffers
map <Leader>, :bn<CR>
map <Leader>. :bp<CR>

" redraw the screen
nnoremap U :syntax sync fromstart<CR>:redraw!<CR>

" visual shifting
vnoremap < <gv
vnoremap > >gv

" sudo!!
cmap w!! w !sudo tee % > /dev/null
