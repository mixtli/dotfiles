call plug#begin('~/.config/nvim/autoload/plugged')

" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" File Explorer
Plug 'scrooloose/NERDTree'
" Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'

" Theme
Plug 'joshdick/onedark.vim'
Plug 'sainnhe/gruvbox-material'

" Conqueror of Completion
"Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Test Runners
Plug 'vim-test/vim-test'

" Ruby
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-rails'

" Status Line
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'

Plug 'nvim-lualine/lualine.nvim'

" Allow neovim to open a file at line number.  Useful for opening stack trace
Plug 'bogado/file-line'

" Fzf - Find files, search lists
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

" Plugins for git
Plug 'mhinz/vim-signify'  " git gutter
Plug 'tpope/vim-fugitive' " main git plugin
Plug 'tpope/vim-rhubarb' " open github
Plug 'junegunn/gv.vim' "git commit browser
Plug 'voldikss/vim-floaterm' " float any terminal app in vim

" Which Key.  Menu that pops up key bindings when you press leader
Plug 'liuchengxu/vim-which-key'
Plug 'AckslD/nvim-whichkey-setup.lua', {'branch': 'main'}

" Snippets
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Ranger integration
Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" Tmux integration
" Plug 'christoomey/vim-tmux-navigator'
" Plug 'urbainvaes/vim-tmux-pilot'
" Plug 'christoomey/vim-tmux-runner'
"
Plug 'aserowy/tmux.nvim', { 'branch': 'main' }

" Easy code commenting
Plug 'preservim/nerdcommenter'

" Javascript support (experimenting)
"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }

Plug 'moll/vim-node'

" Surround.  example:  cs({ to change surrounding ( to {
Plug 'tpope/vim-surround'

" Automatically keep ctags up to date
" Plug 'ludovicchabant/vim-gutentags'

" Go Integration.  Use for build/run/etc.  disable completion functions and
" use Coc
Plug 'fatih/vim-go'

" Dim inactive windows
"Plug 'blueyed/vim-diminactive'

" Goyo zen mode
Plug 'junegunn/goyo.vim'

" Markdown support
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install' }

" Dash documentation integration
Plug 'rizzatti/dash.vim'

" Open URL in browser
Plug 'dhruvasagar/vim-open-url'

" Integrate with w3m browser
Plug 'yuratomo/w3m.vim'

" Restore vim sessions
Plug 'tpope/vim-obsession'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer', { 'branch': 'main' }
"Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
" Use a fork to fix some shit
Plug 'rinx/lspsaga.nvim', { 'branch': 'main' }
Plug 'hrsh7th/cmp-nvim-lsp', { 'branch': 'main' }
Plug 'hrsh7th/cmp-buffer', { 'branch': 'main' }
Plug 'hrsh7th/nvim-cmp', { 'branch': 'main' }

"Plug 'nvim-lua/completion-nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update

Plug 'nikvdp/neomux'

Plug 'roxma/vim-tmux-clipboard'

call plug#end()



