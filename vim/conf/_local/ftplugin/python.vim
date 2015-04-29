" vim: foldmethod=marker
" Section: RopeVim config {{{1
"
let g:pymode=1

let g:pymode_doc=0
let g:pymode_rope_extended_complete=0
let g:pymode_rope_completion=1
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_goto_definition_bind = "<C-]>"
let g:pymode_rope_codeassist_maxfiexes=10
let g:pymode_rope_goto_definition_bind='<Leader>gd'
let g:pymode_rope_autoimport = 1

nmap <Leader>gf :RopeFindOccurrences<CR>
nmap <Leader>ai :PymodeRopeAutoImport<CR>
" 1}}}

" Section: Pyflakes config {{{1
" Tell pyflake not to mess with quickfix window
let g:pyflakes_use_quickfix=0
" 1}}}

setlocal textwidth=79
setlocal tabstop=4
setlocal shiftwidth=4 
setlocal softtabstop=4 
setlocal autoindent
let python_highlight_all = 1
" Smart indent
setlocal smartindent
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
