return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"mfussenegger/nvim-dap",
		},
		opts = {
			handlers = {},
		},
	},
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- ui plugins to make debugging simplier
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			-- gain access to the dap plugin and its functions
			local dap = require("dap")
			-- gain access to the dap ui plugin and its functions
			local dapui = require("dapui")

			-- Setup the dap ui with default configuration
			dapui.setup()

			-- setup an event listener for when the debugger is launched
			dap.listeners.before.launch.dapui_config = function()
				-- when the debugger is launched open up the debug ui
				dapui.open()
			end

			-- set a vim motion for <Space> + d + t to toggle a breakpoint at the line where the cursor is currently on
			vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "[D]ebug [T]oggle Breakpoint" })

			-- set a vim motion for <Space> + d + s to start the debugger and launch the debugging ui
			vim.keymap.set("n", "<leader>ds", dap.continue, { desc = "[D]ebug [S]tart" })

			-- set a vim motion for <Space> + d + s to start the debugger and launch the debugging ui
			vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "[D]ebug [O]ver" })

			-- set a vim motion to close the debugging ui
			vim.keymap.set("n", "<leader>dc", dapui.close, { desc = "[D]ebug [C]lose" })
		end,
	},
}
