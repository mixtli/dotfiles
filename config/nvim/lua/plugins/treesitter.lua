return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local status_ok, configs = pcall(require, "nvim-treesitter.configs")
		if not status_ok then
			return
		end

		configs.setup({
			ensure_installed = {
				"bash",
				"c",
				"clojure",
				"css",
				"fennel",
				"graphql",
				"html",
				"html",
				"http",
				"java",
				"javascript",
				"json",
				"lua",
				"markdown",
				"python",
				"ruby",
				"vim",
				"vimdoc",
				"xml",
			},
			modules = {},
			auto_install = true,
			sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
			ignore_install = { "" }, -- List of parsers to ignore installing
			endwise = {
				enable = true,
			},
			autopairs = {
				enable = true,
			},
			highlight = {
				enable = true, -- false will disable the whole extension
				disable = { "" }, -- list of language that will be disabled
				additional_vim_regex_highlighting = true,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "gnr",
					scope_incremental = "gnc",
					node_decremental = "gnm",
				},
			},
			indent = { enable = true, disable = { "yaml" } },
		})
	end,
}
