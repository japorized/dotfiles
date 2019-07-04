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
