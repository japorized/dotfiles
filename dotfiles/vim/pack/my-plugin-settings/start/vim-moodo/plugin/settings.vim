let g:moodo_modified_indicator = ""
let g:moodo_tabline_closestr = ''
let g:moodo_mid = "\  %r%h\ %.40f%(\ %q%)\ %(\ %#MoodoReplace#%{&modified?' '.g:moodo_modified_indicator.' ':''}%#Normal# %)\ "
let g:moodo_right = "%(%{moodo#MoodoFT()}%) %l/%L\ \ %2c\ \ "
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
  \ 'vim'        : ''
  \ }
