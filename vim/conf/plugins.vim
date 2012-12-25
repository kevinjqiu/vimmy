" Plugin config {
    " solarized {
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
    " }"
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
        let g:neocomplcache_enable_at_startup=1
    " }
    "
    " PIV {
        let g:DisableAutoPHPFolding = 1
    " }
    "
    " syntastic {
        let g:syntastic_mode_map = { 'mode' : 'passive' }
    " }
    "
    " Vimux {
        " Prompt for a command to run
        map <Leader>xp :VimuxPromptCommand<CR>

        " If text is selected, save it in the v buffer and send that buffer it to tmux
        vmap <Leader>xx "vy :call VimuxRunCommand(@v . "\n", 0)<CR>

        " Select current paragraph and send it to tmux
        nmap <Leader>xx vap<Leader>vs<CR>
    " }
    " PyMode {
        let g:pymode_doc = 0
    " }
" }
