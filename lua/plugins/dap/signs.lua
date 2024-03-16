local M = {}

function M.setup()
	-- Update DAP signs with more discrete icons and distinct colors
	vim.fn.sign_define('DapBreakpoint', { text = '●', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
	vim.fn.sign_define(
		'DapBreakpointCondition',
		{ text = '◆', texthl = 'DapBreakpointCondition', linehl = '', numhl = '' }
	)
	vim.fn.sign_define('DapLogPoint', { text = '▶', texthl = 'DapLogPoint', linehl = '', numhl = '' })
	vim.fn.sign_define('DapStopped', { text = '▶', texthl = 'DapStopped', linehl = 'debugPC', numhl = '' })
	vim.fn.sign_define(
		'DapBreakpointRejected',
		{ text = '◎', texthl = 'DapBreakpointRejected', linehl = '', numhl = '' }
	)
end

return M
