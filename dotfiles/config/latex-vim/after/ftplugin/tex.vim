" Simplified function to add new imaps
" include leader key to set leader
" otherwise use empty string
function! VimtexAddMath(lhs, rhs, lead) abort
  if a:lead == ''
    call vimtex#imaps#add_map({
          \ 'lhs' : a:lhs,
          \ 'rhs' : a:rhs,
          \ 'wrapper' : 'vimtex#imaps#wrap_math'
          \ })
  else
    call vimtex#imaps#add_map({
          \ 'lhs' : a:lhs,
          \ 'rhs' : a:rhs,
          \ 'leader' : a:lead,
          \ 'wrapper' : 'vimtex#imaps#wrap_math'
          \ })
  endif
endfunction
function! VimtexAddCmdToEnv(lhs, rhs, context, lead) abort
  if a:lead == ''
    call vimtex#imaps#add_map({
          \ 'lhs' : a:lhs,
          \ 'rhs' : a:rhs,
          \ 'wrapper' : 'vimtex#imaps#wrap_environment',
          \ 'context' : a:context
          \ })
  else
    call vimtex#imaps#add_map({
          \ 'lhs' : a:lhs,
          \ 'rhs' : a:rhs,
          \ 'leader' : a:lead,
          \ 'wrapper' : 'vimtex#imaps#wrap_environment',
          \ 'context' : a:context
          \ })
  endif
endfunction
call VimtexAddMath('hd', '\hdots', '')
call VimtexAddMath('cd', '\cdot', '')
call VimtexAddMath('dd', '\ddots', '')
call VimtexAddMath('vd', '\vdots', '')
for i in [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
  call VimtexAddCmdToEnv(i . '.', '\item', ['enumerate', 'itemize'], '>')
endfor

nmap <silent> <leader>vn :VimtexClean<CR>
nmap <leader>vco :VimtexCompileOutput<CR>
nmap <leader>vcc :VimtexCompile<CR>
nmap <leader>vcs :VimtexCompileSS<CR>
nmap <leader>vll :VimtexLog<CR>
nmap <leader>vli :VimtexImapsList<CR>
nmap <leader>vs :VimtexStatus<CR>
nmap <leader>ve :VimtexErrors<CR>
nmap <leader>vEc :tabnew ~/Documents/TeX_Notes/tex-common/latex-classnotes-preamble.tex<CR>
nmap <leader>vEh :tabnew ~/Documents/TeX_Notes/tex-common/latex-classnotes-header.tex<CR>
nmap <leader>vEa :tabnew ~/Documents/TeX_Notes/tex-common/latex-assignments-preamble.tex<CR>
nmap <silent> <leader>vv :VimtexView<CR>
nmap <leader>vt :Denite vimtex<CR>
nmap <leader>vd :VimtexDocPackage<Space>
nmap <silent> <leader>vfb :call EditBibliography()<CR>
nmap <silent> <leader>vfm :call EditLatexmkrc()<CR>

let g:which_key_map.v = {
  \ 'name' : '+vimtex',
  \ 's' : 'VimtexStatus',
  \ 'n' : 'VimtexClean',
  \ 'e' : 'VimtexErrors',
  \ 'E' : {
  \   'name' : '+edit-common-files',
  \   'a' : 'assignments-preamble',
  \   'c' : 'classnotes-preamble',
  \   'h' : 'classnotes-header',
  \   },
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
    \ 'o' : 'VimtexCompileOutput',
    \ 's' : 'VimtexCompileSS',
  \   },
  \ 'f' : {
    \ 'name' : '+file',
    \ 'b' : 'edit bibliography',
    \ 'm' : 'edit latexmkrc'
  \   },
  \ }

function! EditBibliography() abort
  let referencefile = expand("%:h") . "/references.bib"
  silent execute "copen"
  silent execute "e " referencefile
endfunction

function! EditLatexmkrc() abort
  let latexmkrc_file = expand("%:h") . "/latexmkrc"
  silent execute "copen"
  silent execute "e " latexmkrc_file
endfunction

function! GoToLabelInFloatingWin() abort
  call nvim_open_win(0, 1, {"relative": "cursor", "width": 80, "height": 20, "row": 1, "col": 1})
  redraw!
  silent execute ':tag ' . shellescape(s:get_visual_selection(), 1)
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

" credits to this post on SE
" https://stackoverflow.com/a/6271254
function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction
