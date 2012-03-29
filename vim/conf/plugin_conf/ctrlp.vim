let g:ctrlp_map = '<LEADER>t'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_open_new_file = 'h'

let g:ctrlp_custom_ignore = {
    \ 'dir': '\.git$\|\.hg$\|\.svn$\|.*\.egg$\|build$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$'
    \ }
nmap <Leader>t :CtrlP<CR>

" remap g:ctrlp_map to CtrlP, because plugins/* is loaded after
" ctrlp.vim, which already did the mapping, and since my g:ctrlp_map
" wasn't present at that time, it used the default.
exe 'nn <silent>' g:ctrlp_map ':<c-u>CtrlP<cr>'
