-- General purpose linters
return {
	-- https://github.com/mfussenegger/nvim-lint
	"mfussenegger/nvim-lint",
	event = "BufWritePost",
	config = function()
		-- Define a table of linters for each filetype (not extension).
		-- Additional linters can be found here: https://github.com/mfussenegger/nvim-lint#available-linters
		require("lint").linters_by_ft = {
			python = {
				-- Uncomment whichever linters you prefer
				"flake8",
				-- 'mypy',
				-- 'pylint',
			},
			typescript = { "eslint" },
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
			pythonreact = { "eslint" },
		}

		-- Automatically run linters after saving.  Use "InsertLeave" for more aggressive linting.
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			-- Only run linter for the following extensions. Remove this to always run.
			-- pattern = { "*.py", "*.ts", "*.js" },
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
