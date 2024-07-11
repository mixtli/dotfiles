return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
	},
	config = function()
		-- require('dap-ruby').setup()
		require("dapui").setup()
		require("nvim-dap-virtual-text").setup({})
	end,
}
