-- local function close_nvim_tree()
-- 	require("nvim-tree.view").close()
-- end
--
-- local function open_nvim_tree()
-- 	require("nvim-tree.view").open()
-- end
return {
	"rmagatti/auto-session",
	dependencies = { { "nvim-tree/nvim-tree.lua", "zwhitchcox/auto-session-nvim-tree" } },
	enabled = true,
	config = function()
		local auto_session = require("auto-session")
		-- local auto_session_nvim_tree = require("auto-session-nvim-tree")
		auto_session.setup({

			log_level = "error",
			auto_session_enable_last_session = true,

			-- sync_root_with_cwd = true,
			-- actions = {
			-- 	change_dir = {
			-- 		global = true,
			-- 	},
			-- },
			pre_save_cmds = { close_nvim_tree },
			post_save_cmds = { open_nvim_tree },
			post_open_cmds = { open_nvim_tree },
			post_restore_cmds = { open_nvim_tree },

			-- ⚠️ This will only work if Telescope.nvim is installed
			-- The following are already the default values, no need to provide them if these are already the settings you want.
			session_lens = {
				-- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
				buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
			cwd_change_handling = {
				restore_upcoming_session = false, -- <-- THE DOCS LIE!! This is necessary!!
			},
		})
		-- auto_session_nvim_tree.setup(auto_session)

		-- vim.api.nvim_create_autocmd({ "BufEnter" }, {
		-- 	pattern = "NvimTree*",
		-- 	callback = function()
		-- 		local api = require("nvim-tree.api")
		-- 		local view = require("nvim-tree.view")
		--
		-- 		if not view.is_visible() then
		-- 			api.tree.open()
		-- 		end
		-- 	end,
		-- })
	end,
}
