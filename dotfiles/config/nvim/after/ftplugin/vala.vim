nmap <leader>Ccb :call Build()<CR>

let g:which_key_map.C = {
  \ 'name' : '+c',
  \ 'c' : {
  \   'name' : '+compile',
  \   'b' : 'build',
  \   },
  \ }

function! Build()
  execute "!make"
endfunction
