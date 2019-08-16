set encoding=utf-8
set laststatus=2
set rtp^=~/.config/latex-vim/,~/.vim rtp+=~/.config/latex-vim/after/,~/.vim/after
let &packpath = &runtimepath
filetype plugin indent on
syntax on
set concealcursor=""
set conceallevel=2
set expandtab
set shortmess+=c
set noshowmode
set ignorecase    " Ignore case when searching
set numberwidth=2
set showmatch
set shiftwidth=2
set smartcase
set tabstop=2
set softtabstop=2
set t_Co=256
set timeoutlen=200
set splitbelow
set signcolumn=yes
set dir=$XDG_DATA_HOME/latex-vim/swap
set sessionoptions="buffers,curdir,tabpages,winsize,winpos"
map <SPACE> <Nop>
let mapleader=" "

set spell
set spelllang=en_ca,en_us,cjk
inoremap <C-b> <c-g>u<Esc>[s1z=`]a<c-g>u

" just do I don't get carpal tunnel syndrome from using a QWERTY keyboard
inoremap <C-l> ^

execute pathogen#infect('bundle/always/{}')
execute pathogen#interpose('bundle/tex/vimtex')
execute pathogen#interpose('bundle/optional/denite.nvim')
execute pathogen#interpose('bundle/optional/neomru.vim')
execute pathogen#interpose('bundle/optional/coc.nvim')
execute pathogen#interpose('bundle/optional/goyo.vim')
execute pathogen#interpose('bundle/optional/ultisnips')
execute pathogen#interpose('bundle/calltoload/thesaurus_query.vim')
Helptags

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noruler
  \| autocmd BufLeave <buffer> set laststatus=2 ruler
so ~/.config/nvim/whichkey.vim
so ~/.config/nvim/completion.vim
so ~/.config/nvim/commontypos.vim

" Overriding some of the keybindings for this configuration
nnoremap <silent> <leader>cvei :tabnew ~/.config/latex-vim/init.vim<CR>
nnoremap <silent> <leader>cvsi :source ~/.config/latex-vim/init.vim<CR>

let g:tex_flavor = 'latex'
let g:tex_fold_enabled=1
let g:tex_conceal="abdmgs"
autocmd Filetype tex setl updatetime=1000
" stop thesaurus plugin from starting with its own keys
let g:tq_map_keys=0

" netrw Configs
nmap <F1> :F<cr>
imap <F1> <C-o>:F<CR>
let g:netrw_liststyle=3    " Tree view
let g:netrw_banner=0       " Hide Banner by default, use I to toggle
let g:netrw_browse_split=3 " Opens new file in a new tab
let g:netrw_winsize=25     " netrw to only occupy 25% of the screen
let g:netrw_altv=1

" Indentline Configs
let g:indentLine_char='|'
let g:indentLine_setColors = 0

let g:qs_highlight_on_keys = ['f', 'F']

let g:multi_cursor_exit_from_insert_mode=0

" Indent Guides
let g:indentLine_enabled = 0
let g:indentLine_char = '┃'

let g:SimplenoteVertical=1

let g:fff#split = "30vnew"
let g:fff#split_direction = "nosplitbelow nosplitright"

source $HOME/.vim/simplenoterc

augroup TeXDefaults
  " immediately start typewriter mode
  call TypeWriterToggle()

  " autostart coc
  let g:coc_start_at_startup=1
augroup END

colorscheme wpgtk
