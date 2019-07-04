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
let g:startify_session_dir = '~/.data/latex-vim/session'
