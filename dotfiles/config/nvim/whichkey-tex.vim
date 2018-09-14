nmap <silent> <leader>vCl :VimtexClean<CR>
nmap <leader>vco :VimtexCompileOutput<CR>
nmap <leader>vs :VimtexStatus<CR>
nmap <leader>ve :VimtexErrors<CR>
nmap <leader>vv :VimtexView<CR>
nmap <leader>vt :VimtexTocOpen<CR>
let g:which_key_map.v = {
      \ 'name' : '+vimtex',
      \ 'Cl' : 'VimtexClean',
      \ 'co' : "VimtexCompileOutput",
      \ 's' : 'VimtexStatus',
      \ 'e' : 'VimtexErrors',
      \ 'v' : 'VimtexView',
      \ 't' : 'VimtexTocOpen',
      \ }
