local usercmd = vim.api.nvim_create_user_command

usercmd('Sort', function()
	local start_line = vim.fn.line("'<")
	local end_line = vim.fn.line("'>")
	local get_lines = vim.api.nvim_buf_get_lines

	local lines = get_lines(0, start_line - 1, end_line, false)

	local non_empty_lines = {}
	for _, line in ipairs(lines) do
		line = vim.trim(line)
		if line ~= '' then
			table.insert(non_empty_lines, line)
		end
	end

	table.sort(non_empty_lines, function(a, b)
		return #a < #b
	end)

	vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, non_empty_lines)
end, {
	range = true,
	desc = 'Sort lines by length (shortest to longest)',
})

usercmd('ToggleSpell', function()
	vim.cmd([[set spell!]])
	local is_spell_on = vim.opt.spell:get() and 'on' or 'off'
	vim.notify(string.format('spell is %s', is_spell_on), vim.log.levels.INFO, { title = 'Neovim Alert' })
end, { desc = 'Spell toggle' })

usercmd('ToggleDiagnostics', function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	local is_enabled = vim.diagnostic.is_enabled()
	local msg = is_enabled and 'enabled' or 'disabled'
	vim.notify(string.format('Diagnostic has been %s', msg), vim.log.levels.INFO, { title = 'Neovim Alert' })
end, { desc = 'Diagnostics toggle' })

usercmd('GoToFileWithTumux', function()
	if vim.env.TMUX then
		local file = vim.fn.expand('<cfile>')
		if file and file ~= '' then
			local cwd = vim.fn.getcwd()
			local prog_name = vim.v.progname
			local cmd_parts = {}
			if vim.env.NVIM_APPNAME then
				table.insert(cmd_parts, 'NVIM_APPNAME=' .. vim.fn.shellescape(vim.env.NVIM_APPNAME))
			end
			table.insert(cmd_parts, prog_name)
			table.insert(cmd_parts, vim.fn.shellescape(file))
			local nvim_command = table.concat(cmd_parts, ' ')
			local tmux_command = string.format("tmux split-window -h -c %s '%s'", vim.fn.shellescape(cwd), nvim_command)
			local result = vim.fn.system(tmux_command)
			if vim.v.shell_error ~= 0 then
				vim.notify('Failed to open tmux pane: ' .. result, vim.log.levels.ERROR, { title = 'Tmux' })
			end
		else
			vim.notify('No file path under cursor.', vim.log.levels.WARN, { title = 'Tmux' })
		end
	else
		vim.notify('Not inside a tmux session.', vim.log.levels.ERROR, { title = 'Tmux' })
	end
end, { desc = 'Go to file under the cursor with tmux' })

usercmd('DeleteOtherBuffers', function()
	local current = vim.api.nvim_get_current_buf()
	local buffers = vim.api.nvim_list_bufs()

	for _, buf in ipairs(buffers) do
		if buf ~= current and vim.api.nvim_buf_is_loaded(buf) and not vim.bo[buf].modified and vim.bo[buf].buflisted then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end

	print('Delete other buffers')
end, { desc = 'Delete other buffers but current' })
