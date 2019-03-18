set encoding=utf-8
set laststatus=2
set rtp^=~/.config/latex-vim/,~/.vim rtp+=~/.config/latex-vim/after/,~/.vim/after
let &packpath = &runtimepath
set nocompatible
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
map <SPACE> <Nop>
let mapleader=" "
colorscheme chaos

" just do I don't get carpal tunnel syndrome from using a QWERTY keyboard
inoremap <C-l> ^

execute pathogen#infect('bundle/always/{}')
execute pathogen#interpose('bundle/tex/vimtex')
execute pathogen#interpose('bundle/optional/denite.nvim')
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
nnoremap <silent> <leader>cei :tabnew ~/.config/latex-vim/init.vim<CR>
nnoremap <silent> <leader>csi :source ~/.config/latex-vim/init.vim<CR>

let g:moodo_mid = "\  %r%h\ %.40f%(\ %q%m%)\ "
let g:moodo_right = "%(\ %{FugitiveHead(8)}\ |%)%(%{MoodoFT()}%) %l/%L\ \ %2c\ \ %{coc#status()}"
let g:moodo_tabline_modified = ""
let g:moodo_tabline_closestr = ''
let g:moodo_modes = {
  \ 'n'      : '',
  \ 'no'     : '',
  \ 'v'      : '',
  \ 'V'      : '',
  \ "\<C-V>" : '',
  \ 's'      : '閭',
  \ 'S'      : '閭',
  \ "\<C-S>" : '閭',
  \ 'i'      : '',
  \ 'ic'     : '',
  \ 'ix'     : '',
  \ 'R'      : '',
  \ 'Rc'     : '',
  \ 'Rv'     : '',
  \ 'Rx'     : '',
  \ 'c'      : 'גּ',
  \ 'cv'     : 'גּ',
  \ 'ce'     : 'גּ',
  \ 'r'      : '',
  \ 'rm'     : '',
  \ '!'      : '',
  \ 't'      : ''
  \ }
let g:moodo_fticons = {
  \ 'conf'       : '',
  \ 'fugitive'   : '',
  \ 'help'       : '',
  \ 'magit'      : '',
  \ 'markdown'   : '',
  \ 'simplenote' : 'ﴬ',
  \ 'startify'   : '',
  \ 'tex'        : 'TeX',
  \ 'vim'        : ''
  \ }

function! MoodoIndicators() abort
  let typewriterstat = g:typewriter_mode ? '  ' : ''
  let str = typewriterstat . ' '
  return str
endfunction

let g:tex_flavor = 'latex'
let g:tex_conceal="abdmgs"
let g:vimtex_fold_enabled=1
autocmd Filetype tex setl updatetime=1000
let g:vimtex_view_general_viewer = '/home/japorized/.bin/tabbed-zathura'
let g:vimtex_view_general_options = '-f @pdf'
let g:vimtex_compiler_progname='nvr'
let g:vimtex_quickfix_latexlog = {
      \ 'overfull' : 0,
      \ 'underfull' : 0,
      \ 'font' : 0,
      \ 'packages' : {
      \   'natbib' : 0,
      \ },
      \}
let g:vimtex_compiler_latexmk = {
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \   '-shell-escape'
    \ ],
    \}
let g:vimtex_quickfix_mode=0
let g:vimtex_imaps_leader=";"
let g:vimtex_imaps_disabled = ['.']
let g:neotex_delay = 1000

" netrw Configs
nmap <F1> :F<cr>
imap <F1> <C-o>:F<CR>
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
let g:indentLine_setColors = 0

" Goyo
nmap <F3> :Goyo<cr>
let s:save_option = {}
function! s:goyo_enter()
  silent !tmux set status off
  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
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
  set showcmd
  set scrolloff=0
  if get(s:save_option,'limelight', 0)
    execute 'Limelight!'
  endif
endfunction
augroup goyo_map
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
augroup END

let g:qs_highlight_on_keys = ['f', 'F']

let g:multi_cursor_exit_from_insert_mode=0

" GitGutter
let g:gitgutter_sign_added='┃'
let g:gitgutter_sign_modified='┃'
let g:gitgutter_sign_removed='◢'
let g:gitgutter_sign_removed_first_line='◥'
let g:gitgutter_sign_modified_removed='◢'

" Indent Guides
let g:indentLine_enabled = 0
let g:indentLine_char = '┃'

" Startify
let g:ascii_header = [
\' _  _  __  _  _    ____  __  ____    __     __  ____  ____  _  _ ',
\'/ )( \(  )( \/ )  (  __)/  \(  _ \  (  )   / _\(_  _)(  __)( \/ )',
\'\ \/ / )( / \/ \   ) _)(  O ))   /  / (_/\/    \ )(   ) _)  )  ( ',
\' \__/ (__)\_)(_/  (__)  \__/(__\_)  \____/\_/\_/(__) (____)(_/\_)',
\ ]
let g:startify_custom_header = 'map(g:ascii_header, "\"   \".v:val")'
let g:startify_enable_special = 0
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_commands = [
    \ {'S': ['Simplenote', ':SimplenoteList']},
    \ ]

let g:SimplenoteVertical=1

let g:fff#split = "30vnew"
let g:fff#split_direction = "nosplitbelow nosplitright"

" thesaurus_query.nvim "
let g:tq_map_keys=0
nnoremap <leader>ts :Thesaurus<Space>
nnoremap <leader>tql :ThesaurusQueryLookupCurrentWord<CR>
nnoremap <leader>tqr :ThesaurusQueryReplaceCurrentWord<CR>
nnoremap <leader>tR :ThesaurusQueryReset<CR>
let g:which_key_map.t = {
      \ 'name' : '+thesaurus',
      \ 's' : 'search',
      \ 'q' : {
      \   'name' : '+query',
      \   'r' : 'replace',
      \   'l' : 'lookup'
      \   },
      \ 'R' : 'query-reset'
      \ }
source $HOME/.vim/simplenoterc
