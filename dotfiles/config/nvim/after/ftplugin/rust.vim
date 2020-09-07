nmap <leader>Cb :call CargoBuild()<CR>
nmap <leader>Cr :split term://cargo run<CR>
nmap <leader>Cd :call BuildDoc()<CR>
nmap <leader>CD :call BuildDocOpen()<CR>
nmap <leader>Ct :split term://cargo test<CR>

let g:which_key_map.C = {
  \ 'name' : '+cargo',
  \ 'b' : 'Build project',
  \ 'r' : 'Build & run project',
  \ 'd' : 'Build documentation',
  \ 'D' : 'Build and open documentation',
  \ 't' : 'Run tests in split terminal'
  \ }

function! CargoBuild()
  execute "!cargo build"
endfunction

function! BuildDoc()
  call asyncrun#run("", {}, "cargo doc")
endfunction

function! BuildDocOpen()
  call asyncrun#run("", {}, "cargo doc --open")
endfunction
