-- lua/plugins/dap/ui.lua

local M = {}

function M.setup(dap, dapui)
	-- UI Setup
	dapui.setup({
		layouts = {
			{
				elements = {
					{ id = 'scopes', size = 0.25 },
					{ id = 'breakpoints', size = 0.25 },
					{ id = 'stacks', size = 0.25 },
					{ id = 'watches', size = 0.25 },
				},
				position = 'left',
				size = 30,
			},
			{
				elements = {
					{ id = 'repl', size = 0.5 },
					{ id = 'console', size = 0.5 },
				},
				position = 'bottom',
				size = 10,
			},
		},
	})

	dap.set_log_level('TRACE')

	-- Event Listeners
	dap.listeners.after.event_initialized['dapui_config'] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated['dapui_config'] = function()
		dapui.close()
	end
	dap.listeners.before.event_exited['dapui_config'] = function()
		dapui.close()
	end
end

return M
