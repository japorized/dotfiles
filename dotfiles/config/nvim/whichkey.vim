" vim-which-key
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:which_key_map = {
      \ 'M' : 'Magit',
      \ }
  " Document Related
nmap <Leader>di :IndentLinesToggle<CR>
nmap <silent> <leader>dt :call TypeWriterToggle()<CR>
nmap <silent> <leader>dln :call LineNumberToggle()<CR>
nmap <silent> <leader>dlr :call RelNumberToggle()<CR>
nnoremap <silent> <leader>dT :Tabularize /
let g:which_key_map.d = {
      \ 'name' : '+document',
      \ 'i' : 'toggle-indentline',
      \ 't' : 'toggle-typewriter-mode',
      \ 'T' : 'Tabularize',
      \ }
let g:which_key_map.d.l = {
      \ 'name' : '+line-number',
      \ 'n': 'line-number-toggle',
      \ 'r': 'relative-number-toggle'
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
nnoremap <silent> <leader>wsc  :split<CR>
nnoremap <silent> <leader>wse  :split<Space>
nnoremap <silent> <leader>wvc  :vsplit<CR>
nnoremap <silent> <leader>wve  :vsplit<Space>
nnoremap <silent> <leader>wte  :tabnew<Space>
nnoremap <silent> <leader>wtn  :tabnew<CR>
let g:which_key_map.w = { 'name' : '+window' }
let g:which_key_map.w.s = {
      \ 'name' : '+split-options',
      \ 'c' : 'split-current-buffer',
      \ 'e' : 'split-buffer-by-file',
      \ }
let g:which_key_map.w.v = {
      \ 'name' : '+vsplit-options',
      \ 'c' : 'vsplit-current-buffer',
      \ 'e' : 'vsplit-buffer-by-file',
      \ }
let g:which_key_map.w.t = {
      \ 'name' : '+tabnew-options',
      \ 'e' : 'open-in-new-tab',
      \ 'n' : 'blank-new-tab',
      \ }

nnoremap <silent> <leader>ce  :tabnew ~/.vimrc<CR>
nnoremap <silent> <leader>cs  :source ~/.vimrc<CR>
let g:which_key_map.c = {
      \ 'name' : '+config',
      \ 'e' : 'edit-vimrc',
      \ 's' : 'source-vimrc',
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

nmap <Leader>bb :buffer<Space>
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
      \ }
let g:which_key_map.b.s = {
      \ 'name' : '+split',
      \ 'l' : 'buffer-split-last',
      \ 'f' : 'buffer-split-first',
      \ 'n' : 'buffer-split-next',
      \ 'p' : 'buffer-split-prev',
      \ }
