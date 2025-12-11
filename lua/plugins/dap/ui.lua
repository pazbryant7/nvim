local M = {}

function M.setup(dap)
	local ok, dapui = pcall(require, 'dapui')
	if not ok then
		vim.notify('dapui not available', vim.log.levels.WARN)
		return
	end

	dapui.setup() -- use default settings

	local open = function()
		pcall(dapui.open)
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
