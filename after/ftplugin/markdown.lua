local v = vim
local o = vim.opt_local

local map = v.keymap.set

if vim.bo.ft ~= 'markdown' then
	return
end

local bufnr = vim.api.nvim_get_current_buf()

o.spc = ''

vim.opt_local.wrap = true
vim.opt_local.spell = true
vim.opt_local.textwidth = 80

map(
	'n',
	'<c-t>',
	'<cmd>ObsidianSearch<cr>',
	{ desc = 'Obsidian search', buffer = bufnr, remap = false }
)

map(
	'n',
	'<c-p',
	'<cmd>ObsidianQuickSwitch<cr>',
	{ desc = 'Obsidian Quick Switch', buffer = bufnr, remap = false }
)
