return {
  -- My plugins here
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  'tpope/vim-surround',

  --[[ {
    "zbirenbaum/copilot-cmp",
    dependencies = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup()
    end
  },
]]
  "nvim-tree/nvim-web-devicons",
  "nvim-tree/nvim-tree.lua",
  'weirongxu/plantuml-previewer.vim',
  "moll/vim-bbye",
  'kdheepak/lazygit.nvim',
  "lukas-reineke/indent-blankline.nvim",
  "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight

  -- Colorschemes
  "lunarvim/colorschemes", -- A bunch of colorschemes you can try out
  "lunarvim/darkplus.nvim",
  "morhetz/gruvbox",

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



  -- "natecraddock/workspaces.nvim",
  -- "natecraddock/sessions.nvim",

--  "neovim/nvim-lspconfig", -- enable LSP
--  "williamboman/nvim-lsp-installer", -- simple to use language server installer
--  "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters


  -- Testing 
  'vim-test/vim-test',
  'tpope/vim-dispatch',

  -- Treesitter
  "JoosepAlviste/nvim-ts-context-commentstring",
-- { "aserowy/tmux.nvim", branch='main'},

  'christoomey/vim-tmux-navigator',
  'christoomey/vim-tmux-runner',
  'sbdchd/vim-run',

  'kevinhwang91/rnvimr',

  -- Git
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",

  -- Dims inactive panes
  -- 'TaDaa/vimade',

  -- Solidity support.  Once LSP is better, maybe remove this
  'thesis/vim-solidity',

  'alvan/vim-closetag',
  -- 'rizzatti/dash.vim',

  -- {
  --   'mrjones2014/dash.nvim',
  --   build = 'make install',
  -- },

  -- Devcontainers
  'jamestthompson3/nvim-remote-containers',

  -- Language support
  'towolf/vim-helm',
  'aklt/plantuml-syntax',

  -- Java
  'mfussenegger/nvim-jdtls',

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

