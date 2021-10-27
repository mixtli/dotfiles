"hi ColorColumn ctermbg=1 guibg=#505040  " Used by vim-diminactive to set color of unfocused windows

" Background colors for active vs inactive windows
"hi InactiveWindow guibg=#17252c
hi InactiveWindow guibg=#1d2021  " This matches the backgroud for gruvbox material dark
"hi ActiveWindow guibg=#0D1B22
hi ActiveWindow guibg=#000000


" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

