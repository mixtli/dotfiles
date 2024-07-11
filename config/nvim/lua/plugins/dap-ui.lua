return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap" },
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		dapui.setup({
			controls = {
				-- Requires Neovim nightly (or 0.8 when released)
				enabled = true,
				-- Display controls in this element
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "↻",
					terminate = "□",
				},
			},
		})

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		-- dap.listeners.before.event_terminated["dapui_config"] = function()
		--   dapui.close()
		-- end
		-- dap.listeners.before.event_exited["dapui_config"] = function()
		--   dapui.close()
		-- end

		dap.configurations.python = {
			{
				type = "python",
				request = "launch",
				name = "Python Program",
				console = "integratedTerminal",
				-- module = ".", -- edit this to be your app's main module
				program = "${file}",
				cwd = "${workspaceFolder}",
			},
		}

		-- Add dap configurations based on your language/adapter settings
		-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
		dap.configurations.java = {
			{
				name = "Debug Launch (2GB)",
				type = "java",
				request = "launch",
				vmArgs = "" .. "-Xmx2g ",
			},
			{
				name = "Debug Attach (8000)",
				type = "java",
				request = "attach",
				hostName = "127.0.0.1",
				port = 8000,
			},
			{
				name = "Debug Attach (5005)",
				type = "java",
				request = "attach",
				hostName = "127.0.0.1",
				port = 5005,
			},
			{
				name = "My Custom Java Run Configuration",
				type = "java",
				request = "launch",
				-- You need to extend the classPath to list your dependencies.
				-- `nvim-jdtls` would automatically add the `classPaths` property if it is missing
				-- classPaths = {},

				-- If using multi-module projects, remove otherwise.
				-- projectName = "yourProjectName",

				-- javaExec = "java",
				mainClass = "replace.with.your.fully.qualified.MainClass",

				-- If using the JDK9+ module system, this needs to be extended
				-- `nvim-jdtls` would automatically populate this property
				-- modulePaths = {},
				vmArgs = "" .. "-Xmx2g ",
			},
		}
	end,
}
