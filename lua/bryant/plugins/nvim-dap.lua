return {
	enabled = false,
	'mfussenegger/nvim-dap',
	dependencies = {
		{ 'rcarriga/nvim-dap-ui', opts = {} },
		{ 'theHamsta/nvim-dap-virtual-text', opts = {} },
		'nvim-neotest/nvim-nio',
	},
	config = function()
		local dap = require('dap')
		local dapui = require('dapui')

		-- Automatically open/close dap-ui
		dap.listeners.after.event_initialized['dapui_config'] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated['dapui_config'] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited['dapui_config'] = function()
			dapui.close()
		end
	end,
}
