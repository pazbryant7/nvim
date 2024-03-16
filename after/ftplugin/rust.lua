local v = vim

local map = v.keymap.set

if vim.bo.ft ~= 'rust' then
	return
end

local bufnr = vim.api.nvim_get_current_buf()

map('n', 'gra', function()
	vim.cmd.RustLsp('codeAction')
end, { silent = true, buffer = bufnr, remap = false })

map('n', 'K', function()
	vim.cmd.RustLsp({ 'hover', 'actions' })
end, { silent = true, buffer = bufnr, remap = false })
