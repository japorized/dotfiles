" vim-which-key
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :WhichKeyVisual '<Space>'<CR>
let g:which_key_map = {}
  " Document Related
nmap <Leader>dsi :IndentLinesToggle<CR>
nmap <silent> <leader>dst :call TypeWriterToggle()<CR>
nmap <silent> <leader>dsc :call ConcealToggle()<CR>
nmap <silent> <leader>dsn :call LineNumberToggle()<CR>
nmap <silent> <leader>dsr :call RelNumberToggle()<CR>
nmap <silent> <leader>dl :set tw=
nmap <silent> <leader>dT :Tabularize /
vmap <leader>dcch :CamelToHyphenSel<CR>
vmap <leader>dccs :CamelToSnakeSel<CR>
vmap <leader>dchc :HyphenToCamelSel<CR>
vmap <leader>dchs :HyphenToSnakeSel<CR>
vmap <leader>dcsh :SnakeToHyphenSel<CR>
vmap <leader>dcsc :SnakeToCamelSel<CR>
nmap <leader>dtg :Denite gettemplates<CR>
nmap <leader>dte :Denite edittemplates<CR>
nnoremap <leader>ddw :%s/\s\+$//e<CR>
let g:which_key_map.d = {
      \ 'name' : '+document',
      \ 'l' : 'textwidth',
      \ 's' : {
      \   'name' : '+viewer-styling',
      \   'c' : 'toggle-conceal',
      \   'i' : 'toggle-indentline',
      \   't' : 'toggle-typewriter-mode',
      \   'n': 'line-number-toggle',
      \   'r': 'relative-number-toggle'
      \   },
      \ 'T' : 'Tabularize',
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
      \ 't' : {
      \   'name' : '+template',
      \   'g' : 'get-template',
      \   'e' : 'edit-template',
      \   },
      \ 'd' : {
      \   'name' : '+delete-actions',
      \   'w' : 'remove-trailing-whitespaces'
      \   }
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
function! ConcealToggle()
  if &conceallevel == 0
    set conceallevel=2
  else
    set conceallevel=0
  endif
endfunction
function! LineNumberToggle()
  set nornu
  let g:relnumber_mode = 0
  if g:linenumber_mode
    set nonu
    let g:linenumber_mode = 0
  else
    set nu
    let g:linenumber_mode = 1
  endif
endfunction
function! RelNumberToggle()
  set nonu
  let g:linenumber_mode = 0
  if g:relnumber_mode
    set nornu
    let g:relnumber_mode = 0
  else
    set rnu
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
nmap <silent> <leader>wtc :tabnew %<CR>
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
        \ 'c' : 'open-current-buffer-in-new-tab',
        \ 'e' : 'open-in-new-tab',
        \ 'n' : 'blank-new-tab',
      \   },
      \ }

  " in-house terminal
nmap <silent> <leader>Tt :tabnew term://zsh<CR>
nmap <silent> <leader>Ts :Nuake<CR>
let g:which_key_map.T = {
      \ 'name' : '+terminal',
      \ 's' : 'terminal-split',
      \ 't' : 'terminal-tab',
      \ }

  " configs
nnoremap <silent> <leader>cev :tabnew ~/.vimrc<CR>
nnoremap <silent> <leader>cei :tabnew ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>cet :tabnew ~/.tmux.conf<CR>
nnoremap <silent> <leader>ceb :tabnew ~/.config/nvim/whichkey.vim<CR>
nnoremap <silent> <leader>cey :tabnew ~/.config/nvim/commontypos.vim<CR>
nnoremap <silent> <leader>csi :source ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>csb :source ~/.config/nvim/whichkey.vim<CR>
nnoremap <silent> <leader>csy :source ~/.config/nvim/commontypos.vim<CR>
nnoremap <silent> <leader>cd :digraphs<CR>
nnoremap <silent> <leader>ccs :Denite colorscheme<CR>
nnoremap <silent> <leader>cce1 :tabnew ~/.vim/colors/chaos.vim<CR>
nnoremap <silent> <leader>cUec :UltiSnipsEdit<CR>
nnoremap <silent> <leader>cUee :UltiSnipsEdit<Space>
nnoremap <silent> <leader>cCd :CocList diagnostics<CR>
nnoremap <silent> <leader>cCe :CocList extensions<CR>
nnoremap <silent> <leader>cCl :CocList<CR>
nnoremap <silent> <leader>cCc :CocConfig<CR>
nnoremap <silent> <leader>cCE :CocEnable<CR>
nnoremap <silent> <leader>cCD :CocDisable<CR>
nnoremap <silent> <leader>cCR :CocRestart<CR>
nnoremap <silent> <leader>cCU :CocUpdate<CR>
nnoremap <silent> <leader>cCI :CocInstall<Space>
nnoremap <silent> <leader>cCX :CocUninstall<Space>
nnoremap <silent> <leader>cCf :call FindCocExtensions()<CR>
let g:which_key_map.c = {
  \ 'name' : '+configs',
  \ 'C' : {
  \   'name' : '+coc',
  \   'd' : 'diagnostics',
  \   'e' : 'manage-extensions',
  \   'l' : 'lists',
  \   'c' : 'edit-config',
  \   'E' : 'enable-coc',
  \   'D' : 'disable-coc',
  \   'U' : 'async-update-coc',
  \   'I' : 'install-extension',
  \   'f' : 'find-extensions'
  \   },
  \ 'c' : {
  \   'name' : '+colorscheme',
  \   's' : 'set-colorscheme',
  \   'e' : {
  \     'name' : '+edit-colorscheme',
  \     '1' : 'chaos',
  \     },
  \   },
  \ 'e' : {
  \   'name' : '+edit-configs',
  \   'b' : 'edit-keybindings',
  \   'v' : 'edit-vimrc',
  \   'i' : 'edit-nvim-init',
  \   't' : 'edit-tmux-conf',
  \   'y' : 'edit-commontypos'
  \   },
  \ 's' : {
  \   'name' : '+source-configs',
  \   'b' : 'source-keybindings',
  \   'i' : 'source-vimrc',
  \   'y' : 'source-commontypos'
  \   },
  \ 'd' : 'show-digraphs',
  \ 'U' : {
  \   'name' : '+Ultisnips',
  \   'e' : {
  \     'name' : '+edit-snippets',
  \     'c' : 'edit-current',
  \     'e' : 'edit-choice',
  \     },
  \   }
  \ }
function! FindCocExtensions() abort
  silent execute "!firefox 'https://www.npmjs.com/search?q=keywords:coc.nvim'"
endfunction

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
nmap <Leader>sS :SSave!<CR>
nmap <leader>ss :call LazySave()<CR>
nmap <Leader>sd :SDelete!<CR>
nmap <Leader>sc :SClose<CR>
let g:which_key_map.s = {
      \ 'name' : '+startify',
      \ 't' : 'Startify',
      \ 's' : 'quicksave session',
      \ 'd' : 'SDelete',
      \ 'c' : 'SClose',
      \ }
function! LazySave() abort
  if filereadable(v:this_session)
    execute "normal!:SSave!<CR><CR>"
    echo "Session saved"
  else
    :SSave
  endif
endfunction

  " buffer controls
call denite#custom#source ('buffer', 'sorters', ['sorter/sublime', 'sorter/rank'])
nmap <Leader>bb :Denite buffer<CR>
nmap <Leader>bl :ls<CR>
nmap <Leader>bp :bl<CR>
nmap <Leader>bn :bn<CR>
nmap <Leader>bp :bp<CR>
nmap <Leader>bsl :sbl<CR>
nmap <Leader>bsf :sbf<CR>
nmap <Leader>bsn :sbn<CR>
nmap <Leader>bsp :sbp<CR>
nmap <Leader>bd :bdelete<Space>
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

" git-fugitive
nmap <leader>gs :G<CR>
nmap <leader>gx :Git<Space>
nmap <leader>gcm :Gcommit<Space>
nmap <leader>gcM :Gcommit<CR>
nmap <leader>gru :Gpull<CR>
nmap <leader>grf :Gfetch<CR>
nmap <leader>grp :Gpush<CR>
nmap <leader>gw :Gwrite<CR>
nmap <leader>gm :Gmerge<CR>
nmap <leader>gds :Gsdiff<CR>
nmap <leader>gdv :Gvdiff<CR>
let g:which_key_map.g = {
  \ 'name' : '+fugitive',
  \ 's' : 'status',
  \ 'x' : '*arbitrary command',
  \ 'c' : {
    \ 'name' : '+commit',
    \ 'm' : 'commit with msg',
    \ 'M' : 'commit & edit msg'
  \   },
  \ 'r' : {
    \ 'name' : '+remote',
    \ 'u' : 'pull',
    \ 'f' : 'fetch',
    \ 'p' : 'push'
  \   },
  \ 'w' : 'write',
  \ 'm' : 'merge',
  \ 'd' : {
    \ 'name' : '+diff',
    \ 's' : 'split',
    \ 'v' : 'vsplit'
  \   }
  \ }
