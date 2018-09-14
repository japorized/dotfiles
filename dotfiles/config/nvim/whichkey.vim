" vim-which-key
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
let g:which_key_map = {
      \ 'M' : 'Magit',
      \ }
nmap <Leader>di :IndentLinesToggle<CR>
nmap <silent> <leader>dt :set so=999<CR>
nmap <silent> <leader>dT :set so=0<CR>
let g:which_key_map.d = {
      \ 'name' : '+document',
      \ 'i' : 'toggle-indentline',
      \ 't' : 'typewriter-mode',
      \ 'T' : 'notypewriter-mode',
      \ }
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

augroup texwhichkey
  au! BufRead,BufNewFile *.tex nmap <silent> <leader>vCl :VimtexClean<CR>
  au! BufRead,BufNewFile *.tex nmap <leader>vco :VimtexCompileOutput<CR>
  au! BufRead,BufNewFile *.tex nmap <leader>vs :VimtexStatus<CR>
  au! BufRead,BufNewFile *.tex nmap <leader>ve :VimtexErrors<CR>
  au! BufRead,BufNewFile *.tex nmap <leader>vv :VimtexView<CR>
  au! BufRead,BufNewFile *.tex nmap <leader>vt :VimtexTocOpen<CR>
  au! BufRead,BufNewFile *.tex let g:which_key_map.v = {
                                  \ 'name' : '+vimtex',
                                  \ 'Cl' : 'VimtexClean',
                                  \ 'co' : "VimtexCompileOutput",
                                  \ 's' : 'VimtexStatus',
                                  \ 'e' : 'VimtexErrors',
                                  \ 'v' : 'VimtexView',
                                  \ 't' : 'VimtexTocOpen',
                                  \ }
augroup END
