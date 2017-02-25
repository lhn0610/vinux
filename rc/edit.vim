Plug 'terryma/vim-multiple-cursors'
Plug 'terryma/vim-expand-region'
Plug 'Raimondi/delimitMate'
Plug 'SirVer/ultisnips', { 'on': [] } | Plug 'tracyone/snippets'
Plug 'thinca/vim-qfreplace'
Plug 'vim-scripts/The-NERD-Commenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat' "repeat enhance
Plug 'junegunn/vim-easy-align',{'on': [ '<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)' ]}
Plug 'osyo-manga/vim-over'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/vim-asterisk'
Plug 'mbbill/undotree',  { 'on': 'UndotreeToggle'   }
Plug 'tracyone/YankRing.vim'

" DelimitMate ---------------------{{{
let delimitMate_nesting_quotes = ['"','`']
let delimitMate_expand_cr = 0
let delimitMate_expand_space = 0
"}}}

" UltiSnips -----------------------{{{
if  te#env#SupportPy()
    let g:UltiSnipsUsePythonVersion = 2
else
    let g:UltiSnipsUsePythonVersion = 3 
endif
let g:UltiSnipsExpandTrigger='<c-j>'
let g:UltiSnipsListSnippets ='<c-tab>'
let g:UltiSnipsJumpForwardTrigge='<c-j>'
let g:UltiSnipsJumpBackwardTrigge='<c-k>'
let g:UltiSnipsSnippetDirectories=['bundle/snippets']
let g:UltiSnipsSnippetsDir=$VIMFILES.'/bundle/snippets'
"}}}
" Algin ---------------------------{{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
xmap <leader>al <Plug>(LiveEasyAlign)
" Live easy align
nmap <leader>al <Plug>(LiveEasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['#'] = { 'pattern': '#', 'ignore_groups': ['String'] }
" }}}
" Incsearch -----------------------{{{
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)zz
map N  <Plug>(incsearch-nohl-N)zz
map *   <Plug>(incsearch-nohl)<Plug>(asterisk-*)
map g*  <Plug>(incsearch-nohl)<Plug>(asterisk-g*)
map #   <Plug>(incsearch-nohl)<Plug>(asterisk-#)
map g#  <Plug>(incsearch-nohl)<Plug>(asterisk-g#)
" }}}
" Nerdcommander -------------------{{{
let g:NERDMenuMode=0
let NERD_c_alt_style=1
"}}}
"replace
nnoremap <c-h> :OverCommandLine<cr>:%s/<C-R>=expand("<cword>")<cr>/
vnoremap <c-h> :OverCommandLine<cr>:<c-u>%s/<C-R>=getline("'<")[getpos("'<")[2]-1:getpos("'>")[2]-1]<cr>/
" undo tree window toggle
nnoremap <leader>tu :UndotreeToggle<cr>
" yankring ------------------------{{{
nnoremap <c-y> :YRGetElem<CR>
inoremap <c-y> <esc>:YRGetElem<CR>
" Open yankring window
nnoremap <Leader>yy :YRGetElem<CR>
let yankring_history_dir = $VIMFILES
let g:yankring_history_file = '.yank_history'
let g:yankring_default_menu_mode = 0
let g:yankring_replace_n_pkey = '<m-p>'
let g:yankring_replace_n_nkey = '<m-n>'
"}}}
" vim: set fdm=marker foldlevel=0 foldmarker& filetype=vim: 