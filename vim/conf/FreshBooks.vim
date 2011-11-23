let s:nose_options = "--rednose --verbosity=1"
let s:test_runner = "nosetests " . s:nose_options . " "

function! _GetWordUnderCursor()
    let register_backup = @"
    normal yiw
    let retval = @"
    let @" = register_backup
    return retval
endfunction

" function! _GetPythonClassName()
"     let register_backup = @"
"     normal ggVGy
"     let content = @"
"     echom content
"     let @" = register_backup
" endfunction

function! _FixPath(path)
    return join(split(a:path, "/")[1:], "/")
endfunction

function! Nose_RunTestUnderCursor()
    let test_name = _GetWordUnderCursor()
    let current_file = @%
    let cmd = s:test_runner . current_file . ":" . test_name
    echom cmd
    call SlimeSend(cmd)
endfunction

function! Nose_RunCurrentFile()
    let cmd = s:test_runner . _FixPath(@%)
    echom cmd
    call SlimeSend(cmd . "\n")
endfunction

nnoremap <C-c>t :call Nose_RunCurrentFile()<CR>
