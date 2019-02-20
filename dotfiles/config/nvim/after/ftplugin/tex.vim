source $HOME/.config/nvim/commontypos.vim

" linters
" let b:ale_fixers = {'latex' : ['proselint']}

" which-keys
nmap <silent> <leader>vn :VimtexClean<CR>
nmap <leader>vco :VimtexCompileOutput<CR>
nmap <leader>vcc :call NeoTexToggle()<CR>
nmap <leader>vcs :VimtexCompileSS<CR>
nmap <leader>vs :VimtexStatus<CR>
nmap <leader>ve :VimtexErrors<CR>
nmap <silent> <leader>vv :VimtexView<CR>
nmap <leader>vt :Denite vimtex<CR>
nmap <leader>vd :VimtexDocPackage<Space>
let g:which_key_map.v = {
   \ 'name' : '+vimtex',
   \ 's' : 'VimtexStatus',
   \ 'n' : 'VimtexClean',
   \ 'e' : 'VimtexErrors',
   \ 'v' : 'VimtexView',
   \ 't' : 'VimtexTocOpen',
   \ 'd' : 'VimtexDocPackage',
   \ }
let g:which_key_map.v.c = {
  \ 'name' : '+compile',
  \ 'c' : 'NeotexLive',
  \ 'o' : 'VimtexCompileOutput',
  \ 's' : 'VimtexCompileSS',
  \ }
let g:neotex_status = 0
function! NeoTexToggle()
  if g:neotex_status
    :NeoTexOff
    echom "Turning off NeoTex live compilation"
    let g:neotex_status = 0
  else
    :NeoTexOn
    echom "Turning on NeoTex live compilation"
    let g:neotex_status = 1
  endif
endfunction
