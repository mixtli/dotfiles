return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	enabled = false,
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ "williamboman/mason.nvim" }, -- Optional
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "hrsh7th/cmp-buffer" }, -- Optional
		{ "hrsh7th/cmp-path" }, -- Optional
		{ "saadparwaiz1/cmp_luasnip" }, -- Optional
		{ "hrsh7th/cmp-nvim-lua" }, -- Optional

		-- Snippets
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "rafamadriz/friendly-snippets" }, -- Optional
	},
	config = function()
		-- require('java').setup()
		-- require('lspconfig').jdtls.setup({})
		-- local lsp = require('lsp-zero').preset({
		--   name = 'minimal',
		--   set_lsp_keymaps = true,
		--   manage_nvim_cmp = true,
		--   suggest_lsp_servers = false,
		-- })

		local lsp = require("lsp-zero").preset({})
		-- (Optional) Configure lua language server for neovim
		lsp.nvim_workspace()
		lsp.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			lsp.default_keymaps({ buffer = bufnr })
		end)

		lsp.skip_server_setup({ "jdtls" })
		lsp.setup()
	end,
}
