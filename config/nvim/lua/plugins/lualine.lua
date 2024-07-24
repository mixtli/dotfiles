local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local location = {
	"location",
	padding = 0,
}

-- cool function for progress
local progress = function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "otavioschwanck/tmux-awesome-manager.nvim" },
	enabled = true,
	opts = {
		options = {
			--theme = "gruvbox",
			theme = "auto",
			disabled_filetypes = {
				"dapui_watches",
				"dapui_breakpoints",
				"dapui_scopes",
				"dapui_console",
				"dapui_stacks",
				"dap-repl",
				"alpha",
				"dashboard",
				"NvimTree",
				"Outline",
			},
		},
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			"alpha",
			"dashboard",
			"NvimTree",
			"Outline",
			"dapui_watches",
			"dapui_breakpoints",
			"dapui_scopes",
			"dapui_console",
			"dapui_stacks",
			"dap-repl",
		},
		always_divide_middle = true,
		globalstatus = false,
		sections = {
			lualine_a = { branch, diagnostics },
			lualine_b = {},
			--lualine_b = { mode },
			--lualine_c = { require("auto-session.lib").current_session_name },

			-- lualine_c = {
			-- 	function()
			-- 		return require("tmux-awesome-manager.src.integrations.status").open_terms()
			-- 	end,
			-- },
			-- lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_x = { diff, spaces, "encoding", filetype },
			lualine_y = {},
			lualine_z = { location },
		},
		inactive_sections = {
			lualine_a = { { "filename", status = true } },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		-- winbar = {
		-- 	lualine_a = {
		-- 		-- {
		-- 		-- 	"filename",
		-- 		-- 	path = 2,
		-- 		-- 	status = true,
		-- 		-- 	-- color = { fg = "#550088", bg = "lightgrey", gui = "italic,bold" },
		-- 		-- },
		-- 	},
		-- 	lualine_b = {},
		-- 	lualine_c = {},
		-- 	lualine_x = {},
		-- 	lualine_y = {},
		-- 	lualine_z = {},
		-- },
		--
		-- inactive_winbar = {
		-- 	lualine_a = {
		-- 		-- {
		-- 		-- 	"filename",
		-- 		-- 	path = 2,
		-- 		-- 	status = true,
		-- 		-- 	-- color = { fg = "#330055", bg = "grey", gui = "italic,bold" },
		-- 		-- },
		-- 	},
		-- 	lualine_b = {},
		-- 	lualine_c = {},
		-- 	lualine_x = {},
		-- 	lualine_y = {},
		-- 	lualine_z = {},
		-- },
		-- tabline = {
		-- 	lualine_a = {},
		-- 	lualine_b = {},
		-- 	lualine_c = {},
		-- 	lualine_x = {},
		-- 	lualine_y = {},
		-- 	lualine_z = {},
		-- },
		extensions = {},
	},
}
