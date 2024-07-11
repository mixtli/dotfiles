vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end
	-- Default mappings. Feel free to modify or remove as you wish.
	--
	api.config.mappings.default_on_attach(bufnr)
	-- BEGIN_DEFAULT_ON_ATTACH
	vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
	-- END_DEFAULT_ON_ATTACH
end

return {
	"nvim-tree/nvim-tree.lua",
	enabled = true,
	opts = {
		on_attach = on_attach,
		disable_netrw = true,
		hijack_netrw = true,
		hijack_cursor = false,
		update_cwd = true,
		diagnostics = {
			enable = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		update_focused_file = {
			enable = true,
			update_cwd = true,
			ignore_list = {},
		},
		system_open = {
			cmd = nil,
			args = {},
		},
		filters = {
			dotfiles = false,
			custom = {},
		},
		git = {
			enable = true,
			ignore = true,
			timeout = 1000,
		},
		trash = {
			cmd = "trash",
			require_confirm = true,
		},
	},
	config = function(_, opts)
		-- local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
		-- if not config_status_ok then
		--   return
		-- end

		-- Workaround for auto-session bug
		vim.api.nvim_create_autocmd({ "BufEnter" }, {
			pattern = "NvimTree*",
			callback = function()
				local api = require("nvim-tree.api")
				local view = require("nvim-tree.view")

				if not view.is_visible() then
					api.tree.open()
				end
			end,
		})

		require("nvim-tree").setup(opts)
	end,
}
