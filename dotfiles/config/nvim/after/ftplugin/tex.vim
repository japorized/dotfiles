" linters
let b:ale_fixers = {'latex' : ['chktex', 'proselint']}

" which-keys
nmap <silent> <leader>vn :VimtexClean<CR>
nmap <leader>vco :VimtexCompileOutput<CR>
nmap <leader>vcc :VimtexCompile<CR>
nmap <leader>vcs :VimtexCompileSS<CR>
nmap <leader>vs :VimtexStatus<CR>
nmap <leader>ve :VimtexErrors<CR>
nmap <silent> <leader>vv :VimtexView<CR>
nmap <leader>vt :VimtexTocOpen<CR>
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
  \ 'c' : 'VimtexCompile',
  \ 'o' : 'VimtexCompileOutput',
  \ 's' : 'VimtexCompileSS',
  \ }