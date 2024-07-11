return {
	-- My plugins here
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"nvim-tree/nvim-web-devicons",
	"weirongxu/plantuml-previewer.vim",
	"mattn/emmet-vim",
	"moll/vim-bbye",
	"kdheepak/lazygit.nvim",
	"antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
	"tpope/vim-unimpaired",
	"nvim-neotest/nvim-nio",
	"ludovicchabant/vim-gutentags",
	"sindrets/diffview.nvim",
	-- Colorschemes
	"lunarvim/darkplus.nvim",
	-- "navarasu/onedark.nvim",
	"ellisonleao/gruvbox.nvim",
	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",
	-- snippets
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use
	"ianding1/leetcode.vim",
	-- Testing
	"vim-test/vim-test",

	"radenling/vim-dispatch-neovim",
	"tpope/vim-dispatch",
	"clojure-vim/vim-jack-in",

	-- Treesitter
	"JoosepAlviste/nvim-ts-context-commentstring",
	-- { "aserowy/tmux.nvim", branch='main'},

	-- 'tpope/vim-commentary',
	-- 'knubie/vim-kitty-navigator',
	"christoomey/vim-tmux-navigator",
	"christoomey/vim-tmux-runner",
	"sbdchd/vim-run",
	"kevinhwang91/rnvimr",

	-- Rice
	"HiPhish/rainbow-delimiters.nvim",

	-- Git
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- Solidity support.  Once LSP is better, maybe remove this
	"thesis/vim-solidity",

	"alvan/vim-closetag",

	-- Devcontainers
	"jamestthompson3/nvim-remote-containers",
	"microsoft/vscode-java-test",
	"microsoft/java-debug",

	-- Language support
	"towolf/vim-helm",
	"aklt/plantuml-syntax",

	-- Ruby
	"RRethy/nvim-treesitter-endwise",
	"vim-ruby/vim-ruby",
	"tpope/vim-rails",

	-- Clojure
	"tpope/vim-fireplace",

	-- Racket
	"benknoble/vim-racket",
	-- Debugging
	"mfussenegger/nvim-dap",
	"nvim-telescope/telescope-dap.nvim",
	"theHamsta/nvim-dap-virtual-text",
	"mfussenegger/nvim-dap-python",

	"martinda/Jenkinsfile-vim-syntax",
	"tyru/open-browser.vim",

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
}
