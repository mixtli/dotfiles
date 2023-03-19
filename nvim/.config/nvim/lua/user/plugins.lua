local fn = vim.fn

vim.cmd [[packadd Cfilter]]

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
require('lazy').setup({
  -- My plugins here
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
  "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
  'tpope/vim-surround',
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },

  "nvim-tree/nvim-web-devicons",
  "nvim-tree/nvim-tree.lua",
  {
    "iamcco/markdown-preview.nvim",
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  'weirongxu/plantuml-previewer.vim',
  "akinsho/bufferline.nvim",
  "moll/vim-bbye",
  'kdheepak/lazygit.nvim',
  "nvim-lualine/lualine.nvim",
  "akinsho/toggleterm.nvim",
  "ahmedkhalf/project.nvim",
  "lewis6991/impatient.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "goolord/alpha-nvim",
  "antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
  "folke/which-key.nvim",
  -- 'voldikss/vim-floaterm',
  { 'ibhagwan/fzf-lua',
    -- optional for icon support
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

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


  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  },

  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
    dependencies = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
  },
  -- "natecraddock/workspaces.nvim",
  -- "natecraddock/sessions.nvim",

--  "neovim/nvim-lspconfig", -- enable LSP
--  "williamboman/nvim-lsp-installer", -- simple to use language server installer
--  "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
  "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters

  'rmagatti/auto-session', 

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },

  -- Testing 
  'vim-test/vim-test',
  'tpope/vim-dispatch',

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "JoosepAlviste/nvim-ts-context-commentstring",
-- { "aserowy/tmux.nvim", branch='main'},

  'christoomey/vim-tmux-navigator',
  'christoomey/vim-tmux-runner',
  'sbdchd/vim-run',

  -- {'tzachar/cmp-tabnine', build ='./install.sh', dependencies = 'hrsh7th/nvim-cmp'}
  'kevinhwang91/rnvimr',

  -- Git
  "lewis6991/gitsigns.nvim",
  "tpope/vim-fugitive",
  "tpope/vim-rhubarb",
  {
    'ldelossa/gh.nvim',
    dependencies = { { 'ldelossa/litee.nvim' } }
  },

  -- Dims inactive panes
  'TaDaa/vimade',

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
  'suketa/nvim-dap-ruby',
  'rcarriga/nvim-dap-ui',
  'nvim-telescope/telescope-dap.nvim',
  'theHamsta/nvim-dap-virtual-text',
  'mfussenegger/nvim-dap-python',


  'martinda/Jenkinsfile-vim-syntax',
  'tyru/open-browser.vim',

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
})

