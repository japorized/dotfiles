let g:vimtex_fold_enabled=1
let g:vimtex_view_general_viewer = '/home/japorized/.bin/tabbed-zathura'
let g:vimtex_view_general_options = '-f @pdf'
let g:vimtex_compiler_progname='nvr'
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'font' : 0,
      \ 'packages' : {
      \   'natbib' : 0,
      \ },
      \}
let g:vimtex_compiler_latexmk = {
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape'
    \ ],
    \}
let g:vimtex_quickfix_mode=0
let g:vimtex_imaps_leader=";"
let g:vimtex_imaps_disabled = ['.']
