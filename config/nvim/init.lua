-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.indentline"
require "user.autocommands"
require "user.devspace"


-- vim.cmd 'source ~/.config/nvim/lua/user/vimade.vim'
vim.cmd 'source ~/.config/nvim/vimscript/settings.vim'
vim.cmd 'source ~/.config/nvim/vimscript/close_tag.vim'
vim.cmd 'source ~/.config/nvim/vimscript/fzf.vim'
vim.cmd 'source ~/.config/nvim/vimscript/test.vim'
vim.cmd 'source ~/.config/nvim/vimscript/terminal.vim'
vim.cmd 'source ~/.config/nvim/vimscript/quickfix.vim'
vim.cmd 'source ~/.config/nvim/vimscript/neovim_remote.vim'
vim.cmd 'source ~/.config/nvim/vimscript/run_commands.vim'
-- vim.cmd 'source ~/.config/nvim/vimscript/dim.vim'


-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.setup()

require('keyseer').setup()
