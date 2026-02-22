local M = {}

function M.setup(dap)
	local ok, dapui = pcall(require, 'dapui')

	if not ok then
		vim.notify('dapui not available', vim.log.levels.WARN)
		return
	end

	local opts = {
		layouts = {
			{
				elements = {

					{
						id = 'breakpoints',
						size = 0.25,
					},
					{
						id = 'scopes',
						size = 0.25,
					},
					{
						id = 'stacks',
						size = 0.25,
					},
					{
						id = 'watches',
						size = 0.25,
					},
				},
				position = 'left',
				size = 40,
			},
			{
				elements = {
					{
						id = 'repl',
						size = 0.5,
					},
					{
						id = 'console',
						size = 0.5,
					},
				},
				position = 'bottom',
				size = 10,
			},
		},
	}

	dapui.setup(opts)

	local open = function()
		pcall(dapui.open, { reset = true })
	end
	local close = function()
		pcall(dapui.close)
	end

	for _, evt in ipairs({ 'attach', 'launch' }) do
		dap.listeners.before[evt].dapui_config = open
	end

	for _, evt in ipairs({ 'event_terminated', 'event_exited' }) do
		dap.listeners.before[evt].dapui_config = close
	end
end

return M
