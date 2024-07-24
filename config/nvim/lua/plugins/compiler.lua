return { -- This plugin
	"Zeioth/compiler.nvim",
	cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
	dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
	opts = {},
	config = function(_, opts)
		require("compiler").setup(opts)
	end,
}
