" Startify configs
if has("autocmd")
  autocmd User Startified setlocal cursorline
endif
let g:ascii = [
\ '',
\ '    .(       _   ________  ___     __           __  _ ___      ',
\ '   /%/\     | | / /  _/  |/  / __ / /____ _____/ /_(_) _/_ __  ',
\ '  (%(%))    | |/ // // /|_/ /(_-</ __/ _ `/ __/ __/ / _/ // /  ',
\ ' .-"..`-.   |___/___/_/  /_/ /__/\__/\_,_/_/  \__/_/_/ \_, /   ',
\ ' `-"."`-"dd                                           /___/    ',
\ ]
" let g:ascii = [
" \ '',
" \ '    _   ________  ___     __           __  _ ___      ',
" \ '   | | / /  _/  |/  / __ / /____ _____/ /_(_) _/_ __  ',
" \ '   | |/ // // /|_/ /(_-</ __/ _ `/ __/ __/ / _/ // /  ',
" \ '   |___/___/_/  /_/ /__/\__/\_,_/_/  \__/_/_/ \_, /   ',
" \ '                                             /___/    ',
" \ '',
" \ ]
" let g:startify_custom_header = 'map(g:ascii + startify#fortune#boxed(), "\"   \".v:val")'
let g:startify_custom_header = 'map(g:ascii, "\"   \".v:val")'
let g:startify_list_order = ['files', 'dir', 'sessions', 'bookmarks']
let g:startify_files_number = 7
let g:startify_bookmarks = [ 
  \ {'m': '~/dotfiles/dotfiles/vimrc'},
  \ {'z': '~/dotfiles/dotfiles/zshrc'},
  \ {'h': '~/.config/sxhkd/sxhkdrc'},
  \ {'w': '~/.config/bspwm/bspwmrc'},
  \ {'x': '~/dotfiles/dotfiles/tmux.conf'}
  \ ]
let g:startify_update_oldfiles = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]
let g:startify_commands = [
    \ {'M': ['Magit', ':MagitOnly']},
    \ {'S': ['Simplenote', ':SimplenoteList']},
    \ ]
let g:startify_custom_footer = [
\ '                 ..e=******=e..                         ',
\ '               .r""    .F        ^"4.                     ',
\ '            .@"        $           .d$b.                  ',
\ '          z$b.        J"        .d$$$$$$$c                ',
\ '        .$$$$$$bc.    $    .e$$$$$$$$$$$$$$c              ',
\ '       d$$$$$$$$$$$$bdbe$$$$$$$$$$$$$$$$$$$$$.            ',
\ '      d$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$b           ',
\ '     $$$$$$$$$$$$$$$$$$$$$$$$$$$F*$$$$$$$$$$$$$$          ',
\ '    $$$$$$$$$$$$$$$$$$$$$$$$$$$%3   ^"**$$$$$$$$$.        ',
\ '   d$$$$$$$$$$$$$$$$$$$$$$$$$$"  L         .^$$$$$        ',
\ '  4$$$$$$$$$$$$$$$$$$$$$$$$$"    4          "^$$$$$       ',
\ '  $$$$$$$$$$$$$$$$$$$$$$$*"       b           ^$$$$L      ',
\ ' 4$$$$$$$$$$$$$$$$$$$$"           PL            "$*"      ',
\ ' $$$$$$$$$$$$$$$$$$$$$             $        .=""          ',
\ '  "*$$$$$$$$$$$$$$$$$$             ^F  .r^"               ',
\ '     ^*$$$$$$$$$$$$$$$            ..*"                    ',
\ '         "$$$$$$$$$$$P        .=""                        ',
\ '            "*$$$$$$$    ./^"                             ',
\ '               "*$$$L.="                                  ',
\ '                  "                                       ',
\ '',
\ '',
\ '',
\ '',
\ ]
" let g:startify_custom_footer = [
" \'                                ____                    ',
" \'                           ____ \__ \ ',
" \'                           \__ \__/ / __',
" \'                           __/ ____ \ \ \    ____',
" \'                          / __ \__ \ \/ / __ \__ \ ',
" \'                     ____ \ \ \__/ / __ \/ / __/ / __',
" \'                ____ \__ \ \/ ____ \/ / __/ / __ \ \ \ ',
" \'                \__ \__/ / __ \__ \__/ / __ \ \ \ \/',
" \'                __/ ____ \ \ \__/ ____ \ \ \ \/ / __',
" \'               / __ \__ \ \/ ____ \__ \ \/ / __ \/ /',
" \'               \ \ \__/ / __ \__ \__/ / __ \ \ \__/',
" \'                \/ ____ \/ / __/ ____ \ \ \ \/ ____',
" \'                   \__ \__/ / __ \__ \ \/ / __ \__ \ ',
" \'                   __/ ____ \ \ \__/ / __ \/ / __/ / __',
" \'                  / __ \__ \ \/ ____ \/ / __/ / __ \/ /',
" \'                  \/ / __/ / __ \__ \__/ / __ \/ / __/',
" \'                  __/ / __ \ \ \__/ ____ \ \ \__/ / __',
" \'                 / __ \ \ \ \/ ____ \__ \ \/ ____ \/ /',
" \'                 \ \ \ \/ / __ \__ \__/ / __ \__ \__/',
" \'                  \/ / __ \/ / __/ ____ \ \ \__/',
" \'                     \ \ \__/ / __ \__ \ \/',
" \'                      \/      \ \ \__/ / __',
" \'                               \/ ____ \/ /',
" \'                                  \__ \__/',
" \'                                  __/',
" \'',
" \'',
" \'',
" \]
