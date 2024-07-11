return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	enabled = true,
	dependencies = {
		"mason.nvim",
	},
	opts = {
		ensure_installed = {
			"java-debug-adapter",
			"java-test",
			"js-debug-adapter",
			"black",
			"debugpy",
			"flake8",
			"isort",
			"mypy",
			"pylint",
			"prettier",
			"eslint_d",
			"eslint",
			"stylua",
		},
	},
}
