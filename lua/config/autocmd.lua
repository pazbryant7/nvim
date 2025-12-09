local api = vim.api
local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup

local bryant_group = augroup('bryant_group', { clear = true })

-- Highlight on yank
autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = bryant_group,
	callback = function()
		vim.hl.on_yank({ higroup = 'IncSearch', timeout = 300 })
	end,
})

-- Cursorline management
autocmd({ 'WinEnter', 'BufEnter', 'InsertLeave' }, {
	desc = 'Enable cursorline',
	group = bryant_group,
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

autocmd({ 'WinLeave', 'BufLeave', 'InsertEnter' }, {
	desc = 'Disable cursorline',
	group = bryant_group,
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

-- Go to last location when opening a buffer
autocmd('BufReadPost', {
	desc = 'Go to last loc when opening a buffer',
	group = bryant_group,
	callback = function()
		local mark = api.nvim_buf_get_mark(0, '"')
		local lcount = api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Ignore diagnostics in node_modules
autocmd({ 'BufNewFile', 'BufRead' }, {
	desc = 'Ignore diagnostics in node_modules',
	group = bryant_group,
	pattern = { '**/node_modules/**', 'node_modules', '/node_modules/*' },
	callback = function()
		vim.diagnostic.enable(false)
	end,
})

-- General FileType settings
autocmd('FileType', {
	desc = 'Disable auto-comment',
	group = bryant_group,
	command = 'set formatoptions-=o',
})

-- Terminal settings
autocmd('TermOpen', {
	desc = 'Remove columns in terminal',
	group = bryant_group,
	command = 'setlocal signcolumn=no',
})

-- Recording notifications
autocmd('RecordingEnter', {
	desc = 'Notify when starting macro',
	group = bryant_group,
	callback = function()
		vim.opt.cmdheight = 1
		vim.notify(string.format('key: %s', vim.fn.reg_recording()), vim.log.levels.INFO, {
			title = 'Neovim Alert',
		})
	end,
})

autocmd('RecordingLeave', {
	desc = 'Notify when finishing macro',
	group = bryant_group,
	callback = function()
		vim.opt.cmdheight = 0
		vim.notify('has finished', vim.log.levels.INFO, { title = 'Neovim Alert' })
	end,
})

-- Windows closeable with 'q'
local close_with_q_filetypes = {
	'qf',
	'man',
	'help',
	'noice',
	'empty',
	'notify',
	'lspinfo',
	'markdown',
	'grug-far',
	'gitcommit',
	'dap-float',
	'gitconfig',
	'gitrebase',
	'gitconfig',
	'gitcommit',
	'checkhealth',
	'startuptime',
	'tsplayground',
	'nvcheatsheet',
	'grug-far-help',
	'neotest-output',
	'neotest-summary',
	'grug-far-history',
	'neotest-output-panel',
}

autocmd('FileType', {
	group = bryant_group,
	desc = "Define windows to close with 'q'",
	pattern = close_with_q_filetypes,
	callback = function()
		local bufnr = api.nvim_get_current_buf()
		vim.keymap.set('n', 'q', function()
			if #api.nvim_list_wins() > 1 then
				vim.cmd('quit')
			else
				vim.cmd('new')
				vim.cmd('bdelete! ' .. bufnr)
				vim.notify(
					'You have closed the last window. Avoiding leave neovim.',
					vim.log.levels.INFO,
					{ title = 'Neovim Alert' }
				)
			end
		end, { buffer = bufnr, remap = false })
	end,
})

-- Remove unnamed buffers
autocmd('BufHidden', {
	group = bryant_group,
	desc = 'Remove unnamed buffers',
	callback = function(event)
		if event.file == '' and vim.bo[event.buf].buftype == '' and not vim.bo[event.buf].modified then
			vim.schedule(function()
				pcall(api.nvim_buf_delete, event.buf, {})
			end)
		end
	end,
})

-- Wrap lines in nofile buffers
autocmd('BufEnter', {
	desc = 'Wrap lines in no file type',
	group = bryant_group,
	callback = function()
		if vim.bo.buftype == 'nofile' then
			vim.opt_local.wrap = true
			vim.opt_local.textwidth = 80
		end
	end,
})

-- Intelligent relative number
autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
	group = bryant_group,
	desc = 'Enable relative number',
	callback = function()
		if vim.opt.number:get() and vim.fn.mode() ~= 'i' then
			vim.opt.relativenumber = true
		end
	end,
})

autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
	group = bryant_group,
	desc = 'Disable relative number',
	callback = function()
		if vim.opt.number:get() then
			vim.opt.relativenumber = false
		end
	end,
})

-- Remove trailing whitespace on save
autocmd('BufWritePre', {
	group = bryant_group,
	desc = 'Remove all trailing whitespace on save',
	command = [[:%s/\s\+$//e]],
})

-- EditorConfig syntax
autocmd('FileType', {
	desc = 'Enable editorconfig syntax',
	group = bryant_group,
	pattern = 'editorconfig',
	callback = function()
		vim.opt_local.syntax = 'editorconfig'
	end,
})

-- FZF Lua UI select
autocmd('BufEnter', {
	desc = 'Register fzf-lua as default select.ui',
	once = true,
	group = bryant_group,
	callback = function()
		pcall(function()
			require('fzf-lua').register_ui_select()
		end)
	end,
})

-- Obsidian toggle checkbox
autocmd('User', {
	pattern = 'ObsidianNoteEnter',
	group = bryant_group,
	callback = function(ev)
		vim.keymap.set('n', '<m-t>', '<cmd>Obsidian toggle_checkbox<cr>', {
			buffer = ev.buf,
			desc = 'Toggle checkbox',
		})
	end,
})

-- Window title
autocmd('BufEnter', {
	desc = 'Set window title',
	group = bryant_group,
	callback = function()
		vim.o.titlestring = vim.fn.expand('%:t')
	end,
})
