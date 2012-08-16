" Plugin config {
    " Ack.vim {
        map <LEADER>f :Ack 
    " }
    " nerdtree {
        let NERDTreeIgnore=['\.pyc$']
        nmap <F2> <Esc>:NERDTreeToggle<CR>
        nmap <Leader>r <Esc>:NERDTreeFind<CR>
        " NERDTree bookmark
        map :bm :Bookmark
    " }
    " AutoClose {
        au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
        nmap <Leader>ac <Plug>ToggleAutoCloseMappings
    " }
    " ctrlp.vim {
        let g:ctrlp_map = '<LEADER>t'
        let g:ctrlp_extensions = ['tag']
        let g:ctrlp_open_new_file = 'h'

        let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|\.hg$\|\.svn$\|.*\.egg$\|build$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$'
            \ }
    " }
    " powerline.vim {
        let g:Powerline_symbols = 'unicode'
    " }
    " ZoomWin.vim {
        map <Leader>z :ZoomWin<CR>
    " }
    " NERDCommenter {
        let NERDSpaceDelims = 1
    " }
    " neocomplcache {
        nnoremap <Leader>ncc :NeoComplCacheToggle<CR>
        let neocomplcache_enable_at_startup=1
    " }
    "
" }
