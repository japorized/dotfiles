set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
{%@@ if profile == "Earl-Grey.local" @@%}
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
{%@@ endif @@%}
source ~/.vimrc
source ~/.config/nvim/completion.vim
source ~/.config/nvim/startify.vim
source ~/.config/nvim/whichkey.vim
{%@@ if profile == "Earl-Grey.local" @@%}
if has("gui_vimr")
  source ~/.config/nvim/ginit.vim
endif
{%@@ endif @@%}
