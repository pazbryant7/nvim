local usercmd = vim.api.nvim_create_user_command

usercmd('Sort', function(opts)
	local start_line = opts.line1
	local end_line = opts.line2
	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)

	local non_empty = vim.tbl_filter(function(l)
		return vim.trim(l) ~= ''
	end, lines)

	if #non_empty == 0 then
		return
	end

	table.sort(non_empty, function(a, b)
		return #a < #b
	end)
	vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, non_empty)
end, {
	range = true,
	desc = 'Sort lines by length (shortest to longest)',
})

usercmd('SpellToggle', function()
	vim.o.spell = not vim.o.spell
	vim.notify('spell is ' .. (vim.o.spell and 'on' or 'off'), vim.log.levels.INFO, { title = 'Neovim Alert' })
end, { desc = 'Spell toggle' })

usercmd('RenameFile', function()
	local old_name = vim.fn.expand('%')
	local new_name = vim.fn.input('Rename to: ', old_name)

	if new_name ~= '' and new_name ~= old_name then
		vim.fn.system('mv ' .. old_name .. ' ' .. new_name)
		vim.cmd('edit ' .. new_name)
		vim.cmd('bdelete #')
	end
end, { desc = 'Toggle Spell' })

usercmd('CurrentPath', function()
	local path = vim.fn.expand('%:p')
	vim.fn.setreg('+', path)
	vim.notify(path, vim.log.levels.INFO, { title = 'Neovim Alert' })
end, { desc = 'Get current path' })

usercmd('Jump', function(opts)
	local input = opts.args
	local row_str, col_str = input:match('(%d+)[^%d]+(%d+)')

	if not row_str then
		row_str = input:match('(%d+)')
		col_str = '1'
	end

	if row_str then
		local row = tonumber(row_str) or 1
		local col = (tonumber(col_str) or 1) - 1

		col = math.max(0, col)

		local max_lines = vim.api.nvim_buf_line_count(0)
		row = math.min(row, max_lines)
		row = math.max(1, row)

		pcall(vim.api.nvim_win_set_cursor, 0, { row, col })
		vim.cmd('normal! zz')
	else
		print('Invalid format! Use: row:col (e.g., 9:19)')
	end
end, { nargs = 1, desc = 'Jump directly to row:column' })

usercmd('LspEnable', function()
	vim.g.force_lspconfig = true
	require('lazy').load({ plugins = { 'nvim-lspconfig' } })
	vim.cmd('doautocmd FileType')
end, { desc = 'Enable Lsp by Force' })
