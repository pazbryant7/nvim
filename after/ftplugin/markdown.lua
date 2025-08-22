local v = vim
local o = vim.opt_local

local map = v.keymap.set

if vim.bo.ft ~= 'markdown' then
	return
end

local bufnr = vim.api.nvim_get_current_buf()

o.wrap = true
o.spell = true
o.textwidth = 80

map('n', '<c-t>', '<cmd>Obsidian search<cr>', { desc = 'Obsidian search', buffer = bufnr, remap = false })
map('n', '<c-p>', '<cmd>Obsidian quick_switch<cr>', { desc = 'Obsidian Quick Switch', buffer = bufnr, remap = false })
