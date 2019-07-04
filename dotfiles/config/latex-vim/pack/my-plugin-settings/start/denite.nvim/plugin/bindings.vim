autocmd FileType denite call s:denite_settings()
function! s:denite_settings() abort
  nnoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
        \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
        \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> y
        \ denite#do_map('do_action', 'yank')
  nnoremap <silent><buffer><expr> q
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <C-c>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
        \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
        \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_settings()
function! s:denite_filter_settings() abort
  inoremap <silent><buffer><expr> <CR>
        \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-c>
        \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
        \ denite#do_map('quit')
endfunction
