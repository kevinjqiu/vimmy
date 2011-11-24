let g:fb_nose_options = "--rednose --verbosity=1"
let g:fb_test_runner = "nosetests " . g:fb_nose_options . " "

function! _GetWordUnderCursor()
    let register_backup = @"
    normal yiw
    let retval = @"
    let @" = register_backup
    return retval
endfunction

function! _GetPythonClassName()
    let register_backup = @"
    normal mzggVGy`z
    let content = @"
    let @" = register_backup

    let matched = matchlist(split(content, "\n"), 'class \([a-zA-Z0-9_]\+\)')
    if empty(matched)
        return ""
    else
        return matched[1]
    end
endfunction

function! _FixPath(path)
    return join(split(a:path, "/")[1:], "/")
endfunction

function! Nose_RunTestUnderCursor()
    let test_name = _GetWordUnderCursor()
    echom test_name
    let path = _FixPath(@%)
    let class_name = _GetPythonClassName()
    let cmd = g:fb_test_runner . " " . path . ":" . class_name . "." . test_name
    echom cmd
    call SlimeSend(cmd . "\n")
endfunction

function! Nose_RunCurrentFile()
    let cmd = g:fb_test_runner . " " . _FixPath(@%)
    echom cmd
    call SlimeSend(cmd . "\n")
endfunction

nnoremap <C-c>t :call Nose_RunCurrentFile()<CR>
nnoremap <C-c>T :call Nose_RunTestUnderCursor()<CR>
