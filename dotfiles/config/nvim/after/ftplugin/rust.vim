nmap <leader>Ccc :call CargoBuild()<CR>
nmap <leader>Crr :call RunBinary()<CR>

let g:which_key_map.C = {
  \ 'name' : '+cpp',
  \ 'c' : {
  \   'name' : '+compile',
  \   'c' : 'cargo build',
  \   },
  \ 'r' : {
  \   'name' : '+run',
  \   'r' : 'cargo run',
  \   },
  \ }

function! CargoBuild()
  execute "!cargo build"
endfunction

function! RunBinary()
  execute "!cargo run"
endfunction
