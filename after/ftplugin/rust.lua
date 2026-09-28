local v = vim
local map = v.keymap.set

if vim.bo.ft ~= 'rust' then
	return
end

local bufnr = vim.api.nvim_get_current_buf()
local opts = { silent = true, buffer = bufnr, remap = false }

opts.desc = 'Code Action'
map('n', 'gra', function()
	vim.cmd.RustLsp('codeAction')
end, opts)

opts.desc = 'Hover Actions'
map('n', 'K', function()
	vim.cmd.RustLsp({ 'hover', 'actions' })
end, opts)

opts.desc = '[R]ust [D]ebuggables'
map('n', '<leader>rd', function()
	vim.notify('🔍 Loading debuggable targets...', vim.log.levels.INFO)
	vim.cmd('RustLsp debuggables')
end, opts)

opts.desc = '[R]ust [T]estables'
map('n', '<leader>rt', function()
	vim.notify('🧪 Loading test targets...', vim.log.levels.INFO)
	vim.cmd('RustLsp testables')
end, opts)

opts.desc = '[R]ust [R]unnables'
map('n', '<leader>rr', function()
	vim.notify('🚀 Loading runnable targets...', vim.log.levels.INFO)
	vim.cmd('RustLsp runnables')
end, opts)

opts.desc = '[R]ust Quick [D]ebug'
map('n', '<leader>rD', function()
	vim.notify('🎯 Quick debug current file...', vim.log.levels.INFO)
	local ok, dap = pcall(require, 'dap')
	if not ok then
		vim.notify('nvim-dap is not installed', vim.log.levels.WARN, { title = 'Rust debug' })
		return
	end
	dap.continue()
end, opts)
