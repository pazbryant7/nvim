if vim.bo.ft ~= 'http' then
	return
end

local v = vim
local bufnr = vim.api.nvim_get_current_buf()
local opts = { silent = true, buffer = bufnr, remap = false }

local map = v.keymap.set

-- run kulala
map({ 'n', 'v' }, '<cr>', function()
	pcall(function()
		require('kulala').run()
	end)
end, opts)
