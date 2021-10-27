let g:neomux_start_term_map = '<Leader>ao'
let g:neomux_winswap_map_prefix = '<Leader>as'
let g:neomux_yank_buffer_map = '<Leader>ay'
let g:neomux_paste_buffer_map = '<Leader>ap'
let g:neomux_term_sizefix_map = '<Leader>af'


noremap <Leader>ah :split<CR>:call NeomuxTerm()<CR>
noremap <Leader>av :vsplit<CR>:call NeomuxTerm()<CR>

" Added by rmcclain to make navigation work from neomux panes
tnoremap <C-j> <C-\><C-n><C-w><C-j>
tnoremap <C-k> <C-\><C-n><C-w><C-k>
tnoremap <C-h> <C-\><C-n><C-w><C-h>
tnoremap <C-l> <C-\><C-n><C-w><C-l>
