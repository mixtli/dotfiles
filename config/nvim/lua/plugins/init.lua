return {
  -- My plugins here
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  'tpope/vim-surround',
  "nvim-tree/nvim-web-devicons",
  'weirongxu/plantuml-previewer.vim',
  "moll/vim-bbye",
  'kdheepak/lazygit.nvim',
  "lukas-reineke/indent-blankline.nvim",
  "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
  "tpope/vim-unimpaired",
  'ludovicchabant/vim-gutentags',
  'sindrets/diffview.nvim',
  -- Colorschemes
  "lunarvim/darkplus.nvim",
  "navarasu/onedark.nvim",
  "ellisonleao/gruvbox.nvim",
  -- cmp plugins
  "hrsh7th/nvim-cmp", -- The completion plugin
  "hrsh7th/cmp-buffer", -- buffer completions
  "hrsh7th/cmp-path", -- path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "saadparwaiz1/cmp_luasnip", -- snippet completions
--  "hrsh7th/cmp-nvim-lsp",
  -- snippets
  "L3MON4D3/LuaSnip", --snippet engine
  "rafamadriz/friendly-snippets", -- a bunch of snippets to use

  -- Testing 
  'vim-test/vim-test',
  'tpope/vim-dispatch',

  -- Treesitter
  "JoosepAlviste/nvim-ts-context-commentstring",
-- { "aserowy/tmux.nvim", branch='main'},

  -- 'tpope/vim-commentary',

  'christoomey/vim-tmux-navigator',
  'christoomey/vim-tmux-runner',
  'sbdchd/vim-run',
  'kevinhwang91/rnvimr',

  -- Git
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Solidity support.  Once LSP is better, maybe remove this
  'thesis/vim-solidity',

  'alvan/vim-closetag',

  -- Devcontainers
  'jamestthompson3/nvim-remote-containers',

  -- Language support
  'towolf/vim-helm',
  'aklt/plantuml-syntax',

  -- Java
  'mfussenegger/nvim-jdtls',

  -- Ruby
  'RRethy/nvim-treesitter-endwise',
  'vim-ruby/vim-ruby',
  'tpope/vim-rails',

  -- Debugging
  'mfussenegger/nvim-dap',
  'rcarriga/nvim-dap-ui',
  'nvim-telescope/telescope-dap.nvim',
  'theHamsta/nvim-dap-virtual-text',
  'mfussenegger/nvim-dap-python',

  'martinda/Jenkinsfile-vim-syntax',
  'tyru/open-browser.vim',

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
}

