" Don't expand tab for PHP. 
set noexpandtab 

function! VarDump()
python << EOP
import vim, re, string

identifier = string.letters + "_"

line = vim.current.line
_, col = vim.current.window.cursor

before = line[:col]
after = line[col:]

start = col - 1 - before[::-1].index('$')
end = col - 1 + re.search(r"\W", after).start()

varname = line[start:end+1]
vim.current.line = line[:start] + "var_dump(%s)"%varname + line[end+1:]
EOP
endfunction

nmap <Leader>vd :call VarDump()<CR>
vmap <Leader>vd :call VarDump()<CR>
