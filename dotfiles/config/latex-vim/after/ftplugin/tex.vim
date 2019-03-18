function! AddMathToVimtex(lhs, rhs) abort
  call vimtex#imaps#add_map({
        \ 'lhs' : a:lhs,
        \ 'rhs' : a:rhs,
        \ 'wrapper' : 'vimtex#imaps#wrap_math'
        \ })
endfunction
for c in ['C', 'R', 'Q', 'Z', 'N', 'F', 'H', '1']
  call AddMathToVimtex('b' . c, '\mathbb{' . c . '}')
endfor
call AddMathToVimtex('hd', '\hdots')
call AddMathToVimtex('cd', '\cdots')
call AddMathToVimtex('dd', '\ddots')
call AddMathToVimtex('vd', '\vdots')

nmap <silent> <leader>vn :VimtexClean<CR>
nmap <leader>vco :VimtexCompileOutput<CR>
nmap <leader>vcc :VimtexCompile<CR>
nmap <leader>vcn :call NeoTexToggle()<CR>
nmap <leader>vcs :VimtexCompileSS<CR>
nmap <leader>vll :VimtexLog<CR>
nmap <leader>vli :VimtexImapsList<CR>
nmap <leader>vs :VimtexStatus<CR>
nmap <leader>ve :VimtexErrors<CR>
nmap <silent> <leader>vv :VimtexView<CR>
nmap <leader>vt :Denite vimtex<CR>
nmap <leader>vd :VimtexDocPackage<Space>
nmap <silent> <leader>vfb :call EditBibliography()<CR>

let g:which_key_map.v = {
  \ 'name' : '+vimtex',
  \ 's' : 'VimtexStatus',
  \ 'n' : 'VimtexClean',
  \ 'e' : 'VimtexErrors',
  \ 'l' : {
  \   'name' : '+logs & lists',
  \   'l' : 'VimtexLog',
  \   'i' : 'VimtexImapsList'
  \   },
  \ 'v' : 'VimtexView',
  \ 't' : 'VimtexTocOpen',
  \ 'd' : 'VimtexDocPackage',
  \ 'c' : {
    \ 'name' : '+compile',
    \ 'c' : 'VimtexCompile',
    \ 'n' : 'NeotexLive',
    \ 'o' : 'VimtexCompileOutput',
    \ 's' : 'VimtexCompileSS',
  \   },
  \ 'f' : {
    \ 'name' : '+file',
    \ 'b' : 'edit bibliography'
  \   },
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

function! EditBibliography() abort
  let referencefile = expand("%:h") . "/references.bib"
  silent execute "tabnew " referencefile
endfunction

augroup gitshortcuts
  autocmd!
  nmap <leader>gcC :call GitCommitTeXfileAndPDF()<CR>
  nmap <leader>gcR :call GitResetTeXfileAndPDF()<CR>
  let g:which_key_map.g.c.C = "stage and commit tex and pdf files"
  let g:which_key_map.g.c.R = "unstage tex and pdf files"
  
  function! GitCommitTeXfileAndPDF() abort
    silent execute "!git add " expand("%:h")
    :Gcommit
  endfunction
  function! GitResetTeXfileAndPDF() abort
    silent execute "!git reset " expand("%:h")
  endfunction
augroup END
