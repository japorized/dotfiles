nmap <leader>Ccc :call CompileFile()<CR>
nmap <leader>Crr :call RunBinary()<CR>
nmap <leader>Crs :call SilentRunBinary()<CR>

let g:which_key_map.C = {
  \ 'name' : '+c',
  \ 'c' : {
  \   'name' : '+compile',
  \   'c' : 'compile',
  \   },
  \ 'r' : {
  \   'name' : '+run',
  \   'r' : 'run',
  \   's' : 'silent'
  \   },
  \ }

function! CompileFile()
  execute "!make"
endfunction

function! RunBinary()
  let s:binname = expand('%:r')
  execute "!./" . s:binname
endfunction

function! SilentRunBinary()
  let s:binname = expand('%:r')
  execute "silent!./" . s:binname
endfunction
