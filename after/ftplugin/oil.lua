local v = vim
local o = v.opt_local
local map = v.keymap.set

o.laststatus = 3

v.api.nvim_create_autocmd('BufWipeout', {
	pattern = '<buffer>',
	callback = function()
		v.opt.laststatus = 0
	end,
})

local cwd = vim.fn.getcwd()
if cwd ~= '/home/bryant/Documents/github/notes' or cwd ~= '/home/bryant/Documents/github/youtube' then
	return
end

local bufnr = vim.api.nvim_get_current_buf()
map('n', '<c-t>', '<cmd>ObsidianSearch<cr>', { desc = 'Obsidian search', buffer = bufnr, remap = false })
map('n', '<c-p>', '<cmd>ObsidianQuickSwitch<cr>', { desc = 'Obsidian Quick Switch', buffer = bufnr, remap = false })
