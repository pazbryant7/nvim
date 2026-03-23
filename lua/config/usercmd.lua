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

usercmd('ToggleSpell', function()
	vim.o.spell = not vim.o.spell
	vim.notify('spell is ' .. (vim.o.spell and 'on' or 'off'), vim.log.levels.INFO, { title = 'Neovim Alert' })
end, { desc = 'Spell toggle' })

usercmd('ToggleDiagnostics', function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
	local is_enabled = vim.diagnostic.is_enabled()
	local msg = is_enabled and 'enabled' or 'disabled'
	vim.notify(string.format('Diagnostic has been %s', msg), vim.log.levels.INFO, { title = 'Neovim Alert' })
end, { desc = 'Diagnostics toggle' })

-- tmux

local function open_in_tmux_split(file)
	local cwd = vim.fn.getcwd()
	local cmd_parts = {}
	if vim.env.NVIM_APPNAME then
		table.insert(cmd_parts, 'NVIM_APPNAME=' .. vim.fn.shellescape(vim.env.NVIM_APPNAME))
	end
	table.insert(cmd_parts, vim.v.progname)
	table.insert(cmd_parts, vim.fn.shellescape(file))

	local tmux_cmd =
		string.format("tmux split-window -h -c %s '%s'", vim.fn.shellescape(cwd), table.concat(cmd_parts, ' '))
	local result = vim.fn.system(tmux_cmd)
	if vim.v.shell_error ~= 0 then
		vim.notify('Failed to open tmux pane: ' .. result, vim.log.levels.ERROR, { title = 'Tmux' })
	end
end

usercmd('GoToFileWithTmux', function()
	if not vim.env.TMUX then
		vim.notify('Not inside a tmux session.', vim.log.levels.ERROR, { title = 'Tmux' })
		return
	end
	local file = vim.fn.expand('<cfile>')
	if file == '' then
		vim.notify('No file path under cursor.', vim.log.levels.WARN, { title = 'Tmux' })
		return
	end
	open_in_tmux_split(file)
end, { desc = 'Go to file under the cursor with tmux' })
