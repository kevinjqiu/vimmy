source $HOME/src/ropevim/ropevim.vim
let ropevim_vim_completion=1
let ropevim_extended_complete=1
let ropevim_goto_def_newwin=1

nmap <Leader>gd :RopeGotoDefinition<CR>
" nmap <Leader>gD :let ropevim_goto_def_newwin=1<CR>:RopeGotoDefinition<CR>
nmap <Leader>gf :RopeFindOccurrences<CR>
