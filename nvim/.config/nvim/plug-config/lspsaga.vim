lua << END
  local saga = require 'lspsaga'
  saga.init_lsp_saga {
    code_action_prompt = {
      -- codeAction is broken in solargraph (ruby lsp)
      enable = false,
    }
  }
END


nnoremap <silent> gh :Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent>K :Lspsaga hover_doc<CR>
