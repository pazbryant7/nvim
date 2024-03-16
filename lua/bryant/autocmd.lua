local api = vim.api
local map = vim.keymap.set
local autocmd = api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local bryant_group = api.nvim_create_augroup('bryant_group', { clear = true })

autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = bryant_group,
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 300 })
	end,
})

autocmd({ 'WinEnter', 'BufEnter', 'InsertLeave' }, {
	desc = 'Enable cursorline when leaving a window, buffer, or entering insert mode',
	group = bryant_group,
	pattern = '*',
	callback = function()
		vim.opt_local.cursorline = true
	end,
})

autocmd({ 'WinLeave', 'BufLeave', 'InsertEnter' }, {
	desc = 'Disable cursorline when leaving a window, buffer, or entering insert mode',
	group = bryant_group,
	pattern = '*',
	callback = function()
		vim.opt_local.cursorline = false
	end,
})

autocmd('BufReadPost', {
	desc = 'Go to last loc when opening a buffer',
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

autocmd({ 'BufNewFile', 'BufRead' }, {
	desc = 'Ignore diagnostics in some directories',
	pattern = {
		'**/node_modules/**',
		'node_modules',
		'/node_modules/*',
	},
	callback = function()
		vim.diagnostic.enable(false)
	end,
})

autocmd('FileType', {
	desc = 'Disable auto-comment',
	command = 'set formatoptions-=o',
	group = bryant_group,
})

autocmd('TermOpen', {
	desc = 'remove colucmns in terminal',
	command = 'setlocal signcolumn=no',
})

autocmd('RecordingEnter', {
	desc = 'notify when start macro',
	callback = function()
		vim.opt.cmdheight = 1
		local msg = string.format('key: %s', vim.fn.reg_recording())
		vim.notify(msg, vim.log.levels.INFO, {
			title = 'Macro Recording',
		})
	end,
})

autocmd('RecordingLeave', {
	desc = 'notify when finish macro',
	callback = function()
		vim.opt.cmdheight = 0
		vim.notify('has finished', vim.log.levels.INFO, {
			title = 'Macro Recording',
		})
	end,
})

autocmd('FileType', {
	group = bryant_group,
	desc = "Define windows to close with 'q'",
	pattern = {
		'qf',
		'man',
		'help',
		'noice',
		'empty',
		'notify',
		'lspinfo',
		'fugitive',
		'grug-far',
		'gitcommit',
		'dap-float',
		'gitconfig',
		'gitrebase',
		'dap-float',
		'checkhealth',
		'startuptime',
		'tsplayground',
		'nvcheatsheet',
		'grug-far-help',
		'neotest-output',
		'neotest-summary',
		'grug-far-history',
		'neotest-output-panel',
	},
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set('n', 'q', function()
			local num_windows = #vim.api.nvim_list_wins()
			if num_windows > 1 then
				vim.cmd('close')
			else
				vim.cmd('new')
				vim.cmd('bdelete! ' .. bufnr)

				vim.notify(
					'You have closed the last window. Avoiding leave neovim.',
					vim.log.levels.INFO
				)
				-- Option 2: Show a notification instead of opening a new buffer
				-- Uncomment the following lines and comment out Option 1 if you prefer a notification
				-- vim.notify("This is the last special window. Closing it won't quit Neovim.", vim.log.levels.INFO)
				-- vim.cmd('close') -- Still closes the window, but you stay in Neovim.
				--                 -- Note: If this was the *only* buffer, closing it might still leave Neovim with an empty unnamed buffer.
				--                 -- Using `new` and then `bdelete!` is generally safer for truly replacing the last buffer.
			end
		end, opts)
	end,
})

autocmd('BufHidden', {
	group = bryant_group,
	desc = 'Remove unamed buffers',
	callback = function(event)
		if
			event.file == ''
			and vim.bo[event.buf].buftype == ''
			and not vim.bo[event.buf].modified
		then
			vim.schedule(function()
				pcall(vim.api.nvim_buf_delete, event.buf, {})
			end)
		end
	end,
})

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

autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
	group = bryant_group,
	desc = 'Inteligent relative number',
	callback = function()
		if vim.opt.number:get() and vim.fn.mode() ~= 'i' then
			vim.opt.relativenumber = true
		end
	end,
})

autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
	group = bryant_group,
	desc = 'Inteligent relative number',
	callback = function()
		if vim.opt.number:get() then
			vim.opt.relativenumber = false
		end
	end,
})

autocmd('BufWritePre', {
	group = augroup('TrimWhiteSpaceGrp', { clear = true }),
	desc = 'Remove all trailing whitespace on save',
	command = [[:%s/\s\+$//e]],
})

autocmd({ 'FileType' }, {
	desc = 'enable_editorconfig_syntax',
	group = bryant_group,
	pattern = { 'editorconfig' },
	callback = function()
		vim.opt_local.syntax = 'editorconfig'
	end,
})

autocmd('BufEnter', {
	desc = 'Register fzf-lua as a default select.ui',
	once = true,
	group = bryant_group,
	callback = function()
		require('fzf-lua').register_ui_select()
	end,
})
