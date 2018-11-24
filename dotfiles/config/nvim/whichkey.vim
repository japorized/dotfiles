" vim-which-key
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>
let g:which_key_map = {
      \ 'M' : 'Magit',
      \ }
  " Document Related
nmap <Leader>di :IndentLinesToggle<CR>
nmap <silent> <leader>dt :call TypeWriterToggle()<CR>
nmap <silent> <leader>dln :call LineNumberToggle()<CR>
nmap <silent> <leader>dlr :call RelNumberToggle()<CR>
nmap <silent> <leader>dT :Tabularize /
vmap <leader>dcch :CamelToHyphenSel<CR>
vmap <leader>dccs :CamelToSnakeSel<CR>
vmap <leader>dchc :HyphenToCamelSel<CR>
vmap <leader>dchs :HyphenToSnakeSel<CR>
vmap <leader>dcsh :SnakeToHyphenSel<CR>
vmap <leader>dcsc :SnakeToCamelSel<CR>
let g:which_key_map.d = {
      \ 'name' : '+document',
      \ 'i' : 'toggle-indentline',
      \ 't' : 'toggle-typewriter-mode',
      \ 'T' : 'Tabularize',
      \ 'l' : {
        \ 'name' : '+line-number',
        \ 'n': 'line-number-toggle',
        \ 'r': 'relative-number-toggle'
      \   },
      \ 'c' : {
        \ 'name' : '+case-convert',
        \ 'c' : {
          \ 'name' : '+from-camel',
          \ 'h' : 'camel-to-hyphen',
          \ 's' : 'camel-to-snake',
        \   },
        \ 'h' : {
          \ 'name' : '+from-hyphen',
          \ 'c' : 'hyphen-to-camel',
          \ 's' : 'hyphen-to-snake',
        \   },
        \ 's' : {
          \ 'name' : '+from-snake',
          \ 'c' : 'snake-to-camel',
          \ 'h' : 'snake-to-hyphen',
        \   },
      \   },
      \ }
let g:typewriter_mode = 0
let g:linenumber_mode = 0
let g:relnumber_mode = 0
function! TypeWriterToggle()
  if g:typewriter_mode
    set so=0
    let g:typewriter_mode = 0
  else
    set so=999
    let g:typewriter_mode = 1
  endif
endfunction
function! LineNumberToggle()
  if g:linenumber_mode
    set nonu
    let g:linenumber_mode = 0
  else
    set nu
    let g:linenumber_mode = 1
  endif
endfunction
function! RelNumberToggle()
  if g:relnumber_mode
    set nonu
    let g:relnumber_mode = 0
  else
    set nu
    let g:relnumber_mode = 1
  endif
endfunction

  " Window related
nmap <silent> <leader>wsc :split<CR>
nmap <silent> <leader>wse :split<Space>
nmap <silent> <leader>wvc :vsplit<CR>
nmap <silent> <leader>wve :vsplit<Space>
nmap <silent> <leader>wte :tabnew<Space>
nmap <silent> <leader>wtn :tabnew<CR>
let g:which_key_map.w = { 
      \'name' : '+window',
      \ 's' : {
        \ 'name' : '+split-options',
        \ 'c' : 'split-current-buffer',
        \ 'e' : 'split-buffer-by-file',
      \   },
      \ 'v' : {
        \ 'name' : '+vsplit-options',
        \ 'c' : 'vsplit-current-buffer',
        \ 'e' : 'vsplit-buffer-by-file',
      \   },
      \ 't' : {
        \ 'name' : '+tabnew-options',
        \ 'e' : 'open-in-new-tab',
        \ 'n' : 'blank-new-tab',
      \   },
      \ }

  " in-house terminal
nmap <silent> <leader>Tt :tabnew term://zsh<CR>
nmap <silent> <leader>Th :terminal<CR>
nmap <silent> <leader>Ts :split term://zsh<CR>
nmap <silent> <leader>Tv :vsplit term://zsh<CR>
let g:which_key_map.T = {
      \ 'name' : '+terminal',
      \ 'h' : 'terminal-here',
      \ 's' : 'terminal-split',
      \ 't' : 'terminal-tab',
      \ 'v' : 'terminal-vsplit',
      \ }

  " configs
nnoremap <silent> <leader>ce :tabnew ~/.vimrc<CR>
nnoremap <silent> <leader>cs :source ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>ct :tabnew ~/.tmux.conf<CR>
nnoremap <silent> <leader>cd :digraphs<CR>
let g:which_key_map.c = {
      \ 'name' : '+vim',
      \ 'e' : 'edit-vimrc',
      \ 's' : 'source-vimrc',
      \ 'd' : 'show-digraphs',
      \ 't' : 'edit-tmux-conf',
      \ }

  " ale linting
nmap <silent> <Leader>dal :ALELint<cr>
nmap <silent> <Leader>dap <Plug>(ale_previous_wrap)
nmap <silent> <Leader>dan <Plug>(ale_next_wrap)
let g:which_key_map.d.a = {
      \ 'name' : '+ale-lint',
      \ 'l' : 'ale-lint',
      \ 'n' : 'ale-next',
      \ 'p' : 'ale-prev',
      \ }

  " Startify related
nmap <Leader>st :Startify<CR>
nmap <Leader>ss :SSave<CR>
nmap <Leader>sd :SDelete<CR>
nmap <Leader>sc :SClose<CR>
let g:which_key_map.s = {
      \ 'name' : '+startify',
      \ 't' : 'Startify',
      \ 's' : 'SSave',
      \ 'd' : 'SDelete',
      \ 'c' : 'SClose',
      \ }

  " buffer controls
nmap <Leader>bb :Thumbnail -here<CR>
nmap <Leader>bl :ls<CR>
nmap <Leader>bp :bl<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bsl :sbl<CR>
nmap <Leader>bsf :sbf<CR>
nmap <Leader>bsn :sbn<CR>
nmap <Leader>bsp :sbp<CR>
nmap <Leader>bd :bdelete<Space>
nmap <Leader>btt :Thumbnail<CR>
nmap <Leader>bts :Thumbnail -horizontal<CR>
nmap <Leader>btv :Thumbnail -vertical<CR>
let g:which_key_map.b = {
      \ 'name' : '+buffer',
      \ 'b' : 'buffer-goto',
      \ 'l' : 'buffer-list',
      \ 'd' : 'buffer-delete',
      \ 'n' : 'buffer-next',
      \ 'p' : 'buffer-prev',
      \ 's' : {
        \ 'name' : '+split',
        \ 'l' : 'buffer-split-last',
        \ 'f' : 'buffer-split-first',
        \ 'n' : 'buffer-split-next',
        \ 'p' : 'buffer-split-prev',
      \   },
      \ 't' : {
        \ 'name' : '+buffer-thumbnail',
        \ 't' : 'buffer-new-tab',
        \ 's' : 'buffer-split',
        \ 'v' : 'buffer-vsplit',
      \   },
      \ }

" Simplenote
nmap <silent> <leader>Sl :SimplenoteList<CR>
nmap <silent> <leader>Sn :SimplenoteNew<CR>
nmap <silent> <leader>Sd :SimplenoteDelete<CR>
nmap <silent> <leader>St :SimplenoteTag<CR>
nmap <silent> <leader>Sp :SimplenotePin<CR>
nmap <silent> <leader>SP :SimplenoteUnpin<CR>
let g:which_key_map.S = {
      \ 'name' : '+Simplenote',
      \ 'd' : 'simplenote-delete',
      \ 'l' : 'simplenote-list',
      \ 'n' : 'simplenote-new',
      \ 'p' : 'simplenote-pin',
      \ 'P' : 'simplenote-unpin',
      \ 't' : 'simplenote-tag',
      \ }
