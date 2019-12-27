set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'
source ~/.vimrc

" nuake
let g:nuake_per_tab=1
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

source ~/.config/nvim/startify.vim
source ~/.config/nvim/whichkey.vim
source ~/.config/nvim/completion.vim
