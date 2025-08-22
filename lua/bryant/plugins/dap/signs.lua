-- lua/plugins/dap/signs.lua

local M = {}

function M.setup()
	vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
	vim.fn.sign_define('DapBreakpointCondition', { text = '🟡', texthl = '', linehl = '', numhl = '' })
	vim.fn.sign_define('DapLogPoint', { text = '📝', texthl = '', linehl = '', numhl = '' })
	vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = 'debugPC', numhl = '' })
	vim.fn.sign_define('DapBreakpointRejected', { text = '❌', texthl = '', linehl = '', numhl = '' })
end

return M
