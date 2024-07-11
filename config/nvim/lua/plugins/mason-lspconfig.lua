return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"mason.nvim",
		"mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("neodev").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				--"emmet_language_server",
				"emmet_ls",
				"bashls",
				"clangd",
				"dockerls",
				"docker_compose_language_service",
				"gopls",
				"gradle_ls",
				"graphql",
				"groovyls",
				"helm_ls",
				"jsonls",
				"jdtls",
				"tsserver",
				"autotools_ls",
				"marksman",
				"pyright",
				"solargraph",
				"sqlls",
				"taplo",
				"terraformls",
				"yamlls",
			},
		})

		local lspconfig = require("lspconfig")
		local configs = require("lspconfig/configs")
		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		--		local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

		-- local capabilities = vim.tbl_deep_extend(
		-- 	"force",
		-- 	vim.lsp.protocol.make_client_capabilities(),
		-- 	require("cmp_nvim_lsp").default_capabilities()
		-- )
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true
		capabilities.textDocument.completion = require("cmp_nvim_lsp").default_capabilities().textDocument.completion

		lspconfig.emmet_ls.setup({
			-- on_attach = on_attach,
			capabilities = capabilities,
			filetypes = {
				"css",
				"eruby",
				"html",
				"javascript",
				"javascriptreact",
				"less",
				"sass",
				"scss",
				"svelte",
				"pug",
				"typescriptreact",
				"vue",
			},
			init_options = {
				html = {
					options = {
						-- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
						["bem.enabled"] = true,
					},
				},
			},
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})

		require("lspconfig").racket_langserver.setup({})
		require("mason-lspconfig").setup_handlers({

			-- default is to set up language server with blank options
			function(server_name)
				require("lspconfig")[server_name].setup({})
			end,
			["tsserver"] = function()
				require("lspconfig").tsserver.setup({
					single_file_support = false,
					init_options = {
						preferences = {
							disableSuggestions = true,
						},
					},
				})
			end,
		})
	end,
}
