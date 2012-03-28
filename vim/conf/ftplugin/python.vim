" vim: foldmethod=marker
" Section: RopeVim config {{{1
"
source $HOME/src/rope/ropevim/ropevim.vim
let ropevim_codeassist_maxfiexes=10
let ropevim_guess_project=1
let ropevim_vim_completion=1
let ropevim_enable_autoimport=1
let ropevim_extended_complete=1
nmap <Leader>gd :RopeGotoDefinition<CR>
nmap <Leader>gD :let ropevim_goto_def_newwin=1<CR>:RopeGotoDefinition<CR>:let ropevim_goto_def_newwin=0<CR>
nmap <Leader>gf :RopeFindOccurrences<CR>
nmap <Leader>ai :RopeAutoImport<CR>
" 1}}}

" Section: Pyflakes config {{{1
" Tell pyflake not to mess with quickfix window
let g:pyflakes_use_quickfix=0
" 1}}}

" Section: Google's coding standards {{{1
" Indent Python in the Google way.
" setlocal indentexpr=GetGooglePythonIndent(v:lnum)
setlocal foldmethod=indent
setlocal foldlevel=99

let s:maxoff = 50 " maximum number of lines to look backwards.

" function! GetGooglePythonIndent(lnum)
" 
"   " Indent inside parens.
"   " Align with the open paren unless it is at the end of the line.
"   " E.g.
"   "   open_paren_not_at_EOL(100,
"   "                         (200,
"   "                          300),
"   "                         400)
"   "   open_paren_at_EOL(
"   "       100, 200, 300, 400)
"   call cursor(a:lnum, 1)
"   let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
"         \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
"         \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
"         \ . " =~ '\\(Comment\\|String\\)$'")
"   if par_line > 0
"     call cursor(par_line, 1)
"     if par_col != col("$") - 1
"       return par_col
"     endif
"   endif
" 
"   " Delegate the rest to the original function.
"   return GetPythonIndent(a:lnum)
" 
" endfunction

let pyindent_nested_paren="&sw"
let pyindent_open_paren="&sw"
" 1}}}

setlocal textwidth=80 
setlocal tabstop=4
setlocal shiftwidth=4 
setlocal softtabstop=4 
setlocal autoindent
let python_highlight_all = 1
" Smart indent
setlocal smartindent
setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class
