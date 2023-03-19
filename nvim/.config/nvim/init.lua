require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.bufferline"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.whichkey"
require "user.autocommands"
require "user.tmux"
require 'user.fzf'
require "user.gh"
require "user.dap"
require "user.ruby-dap"
require "user.auto-session"
require "user.mason"

-- require "user.tabnine"

vim.cmd 'source ~/.config/nvim/lua/user/vimade.vim'
vim.cmd 'source ~/.config/nvim/vimscript/close_tag.vim'
vim.cmd 'source ~/.config/nvim/vimscript/fzf.vim'
vim.cmd 'source ~/.config/nvim/vimscript/test.vim'
vim.cmd 'source ~/.config/nvim/vimscript/terminal.vim'
vim.cmd 'source ~/.config/nvim/vimscript/quickfix.vim'
vim.cmd 'source ~/.config/nvim/vimscript/neovim_remote.vim'
vim.cmd 'source ~/.config/nvim/vimscript/dim.vim'


-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()
