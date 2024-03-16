local map = vim.keymap.set

if vim.bo.ft ~= 'fugitive' then
	return
end

local bufnr = vim.api.nvim_get_current_buf()

-- stylua: ignore start
map( 'n', 'gp', ':Git push -u origin ', { buffer = bufnr, remap = false, desc = 'Fugitive set new push origin' })
map('n', '<leader>P', function() vim.cmd.Git('push') end, { buffer = bufnr, remap = false, desc = 'Fugitive push' })
map('n', '<leader>p', function() vim.cmd.Git({ 'pull', '--rebase' }) end, { buffer = bufnr, remap = false, desc = 'Fugitive pull rebase' })
