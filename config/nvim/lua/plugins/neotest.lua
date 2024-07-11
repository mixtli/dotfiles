return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/neotest-python",
		"nvim-neotest/neotest-vim-test",
		"nvim-neotest/nvim-nio",
		"rcasia/neotest-java",
		"haydenmeade/neotest-jest",
	},
	config = function()
		vim.cmd("let test#clojure#runner = 'fireplacetest'")
		require("neotest").setup({
			adapters = {
				require("neotest-java")({
					ignore_wrapper = false, -- whether to ignore maven/gradle wrapper
					--junit_jar = "path/to/junit-standalone.jar",
					junit_jar = vim.env.HOME
						.. "/.local/share/nvim/neotest-java/junit-platform-console-standalone-1.10.1.jar",
				}),
				require("neotest-python")({
					dap = { justMyCode = false, console = "integratedTerminal" },
				}),
				require("neotest-jest")({
					jestCommand = "npm test --",
					-- jestConfigFile = "custom.jest.config.ts",
					env = { CI = true },
					cwd = function()
						return vim.fn.getcwd()
					end,
				}),
				require("neotest-vim-test")({
					allow_file_types = { "clojure" },
				}),
			},
		})
	end,
}
