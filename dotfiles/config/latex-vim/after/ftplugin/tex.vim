let g:tex_conceal=""
let g:vimtex_fold_enabled=1
autocmd Filetype tex setl updatetime=1000
let g:vimtex_view_general_viewer = '/home/japorized/.bin/tabbed-zathura'
let g:vimtex_compiler_progname='nvr'
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'font' : 0,
      \ 'packages' : {
      \   'natbib' : 0,
      \ },
      \}
let g:vimtex_quickfix_mode=0
let g:neotex_delay = 1000

nmap <silent> <leader>vn :VimtexClean<CR>
nmap <leader>vco :VimtexCompileOutput<CR>
nmap <leader>vcc :VimtexCompile<CR>
nmap <leader>vcn :call NeoTexToggle()<CR>
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
  \ 'c' : 'VimtexCompile',
  \ 'n' : 'NeotexLive',
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

