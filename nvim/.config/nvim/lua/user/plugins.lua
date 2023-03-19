local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

vim.cmd [[packadd Cfilter]]

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use 'tpope/vim-surround'
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'weirongxu/plantuml-previewer.vim'
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"
  use 'kdheepak/lazygit.nvim'
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  -- use 'voldikss/vim-floaterm'
  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

  -- Colorschemes
  use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "morhetz/gruvbox"

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
--  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use


  use {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = {
        enabled = true,
        auto_refresh = true,
        keymap = {
          jump_prev = "[[",
          jump_next = "]]",
          accept = "<CR>",
          refresh = "gr",
          open = "<M-CR>"
        },
        layout = {
          position = "bottom", -- | top | left | right
          ratio = 0.4
        },
      },
      suggestion = {
        enabled = true,
        auto_trigger = false,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {},
    })
    end,
  }

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
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
  }

  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = {
        {"nvim-tree/nvim-web-devicons"},
        --Please make sure you install markdown and markdown_inline parser
        {"nvim-treesitter/nvim-treesitter"}
    }
  })
  -- use "natecraddock/workspaces.nvim"
  -- use "natecraddock/sessions.nvim"

--  use "neovim/nvim-lspconfig" -- enable LSP
--  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
--  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  use 'rmagatti/auto-session' 

  use {
  'rmagatti/session-lens',
  requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
  config = function()
    require('session-lens').setup({--[[your custom config--]]})
  end
}


  -- Telescope
  use "nvim-telescope/telescope.nvim"
  --[[ use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  } ]]

  -- Testing 
  use 'vim-test/vim-test'
  use 'tpope/vim-dispatch'

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
-- use { "aserowy/tmux.nvim", branch='main'}

  use 'christoomey/vim-tmux-navigator'
  use 'christoomey/vim-tmux-runner'
  use 'sbdchd/vim-run'

  -- use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'kevinhwang91/rnvimr'

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"
  use "tpope/vim-rhubarb"
  use {
    'ldelossa/gh.nvim',
    requires = { { 'ldelossa/litee.nvim' } }
  }

  -- Dims inactive panes
  use 'TaDaa/vimade'

  -- Solidity support.  Once LSP is better, maybe remove this
  use 'thesis/vim-solidity'

  use 'alvan/vim-closetag'
  -- use 'rizzatti/dash.vim'

  use({
  'mrjones2014/dash.nvim',
  run = 'make install',
  })

  -- Devcontainers
  use 'jamestthompson3/nvim-remote-containers'



  -- Language support
  use 'towolf/vim-helm'
  use 'aklt/plantuml-syntax'

  -- Java
  use 'mfussenegger/nvim-jdtls'

  -- Debugging
  use 'mfussenegger/nvim-dap'
  use 'suketa/nvim-dap-ruby'
  use 'rcarriga/nvim-dap-ui'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'mfussenegger/nvim-dap-python'


  use 'martinda/Jenkinsfile-vim-syntax'
  use 'tyru/open-browser.vim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

