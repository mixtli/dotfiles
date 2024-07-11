return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	enabled = true,
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = false,
				keymap = {
					accept = "<A-a>",
					accept_word = false,
					accept_line = false,
					next = "<A-]>",
					prev = "<A-[>",
					dismiss = "<A-'>",
				},
			},
		})
	end,
}
