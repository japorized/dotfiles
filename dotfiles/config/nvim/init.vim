set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
{%@@ if profile == "Earl-Grey.local" @@%}
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
{%@@ else @@%}
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_prog = '/usr/bin/python'
{%@@ endif @@%}
source ~/.vimrc

" nuake
let g:nuake_per_tab=1
nnoremap <F4> :Nuake<CR>
inoremap <F4> <C-\><C-n>:Nuake<CR>
tnoremap <F4> <C-\><C-n>:Nuake<CR>

source ~/.config/nvim/completion.vim
source ~/.config/nvim/startify.vim
source ~/.config/nvim/whichkey.vim
{%@@ if profile == "Earl-Grey.local" @@%}
if has("gui_vimr")
  source ~/.config/nvim/ginit.vim
endif
{%@@ endif @@%}
