source $HOME/src/rope/ropevim/ropevim.vim
let ropevim_vim_completion=1
let ropevim_extended_complete=1
" let ropevim_goto_def_newwin=1

nmap <Leader>gd :RopeGotoDefinition<CR>
nmap <Leader>gD :let ropevim_goto_def_newwin=1<CR>:RopeGotoDefinition<CR>:let ropevim_goto_def_newwin=0<CR>
nmap <Leader>gf :RopeFindOccurrences<CR>
