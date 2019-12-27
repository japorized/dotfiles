set laststatus=2
set runtimepath^=~/.vim/ runtimepath+=~/.vim/after/
let &packpath = &runtimepath
set nocompatible
filetype plugin indent on
syntax on
set expandtab
set noshowmode
set numberwidth=2
set showmatch
set shiftwidth=2
set smartcase
set tabstop=2
set softtabstop=2
set t_Co=256
set timeoutlen=200
set splitbelow
map <SPACE> <Nop>
let mapleader=" "
colorscheme wpgtk

execute pathogen#infect('bundle/always/{}')
execute pathogen#interpose('bundle/optional/goyo.vim')
execute pathogen#interpose('bundle/optional/limelight.vim')
Helptags

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
so ~/.config/slim-vim/whichkey.vim
so ~/.config/nvim/commontypos.vim

" netrw Configs
nmap <F1> :Lexplore<cr>
imap <F1> <C-o>:Lexplore<CR>
let g:netrw_liststyle=3    " Tree view
let g:netrw_banner=0       " Hide Banner by default, use I to toggle
let g:netrw_browse_split=3 " Opens new file in a new tab
let g:netrw_winsize=25     " netrw to only occupy 25% of the screen
let g:netrw_altv=1

" Gundo configurations
nnoremap <F5> :GundoToggle<CR>
let g:gundo_preview_height= 30
let g:gundo_help = 0
let g:gundo_return_on_revert= 0

" Indentline Configs
let g:indentLine_char='|'

" Goyo
nmap <F3> :Goyo<cr>
let s:save_option = {}
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  if exists(':Limelight') == 2
    Limelight
    let s:save_option['limelight'] = 1
  endif
endfunction

function! s:goyo_leave()
  silent !tmux set status on
  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  if get(s:save_option,'limelight', 0)
    execute 'Limelight!'
  endif
endfunction
augroup goyo_map
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

" Limelight
  " Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

  " Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

  " Default: 0.5
let g:limelight_default_coefficient = 0.3

  " Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 2

  " Beginning/end of paragraph
  " When there's no empty line between the paragraphs
  " and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

  " Highlighting priority (default: 10)
  " Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

let g:qs_highlight_on_keys = ['f', 'F']

let g:multi_cursor_exit_from_insert_mode=0

let g:startify_custom_header = ''
let g:startify_enable_special = 0
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:SimplenoteVertical=1
source $HOME/.vim/simplenoterc
