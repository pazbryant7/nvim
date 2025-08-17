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

-- Toggle blink cmp
local autoCompletionEnabled = true
function EnableAutoCompletion()
	vim.b.completion = true
	autoCompletionEnabled = true
	print('Auto-completion enabled')
end

function DisableAutoCompletion()
	vim.b.completion = false
	require('blink.cmp').hide()
	autoCompletionEnabled = false
	print('Auto-completion disabled')
end

function ToggleAutoCompletion()
	if autoCompletionEnabled then
		DisableAutoCompletion()
	else
		EnableAutoCompletion()
	end
end

usercmd('ToggleAutoCompletion', ToggleAutoCompletion, { desc = 'Toggle Blink Cmp Completion' })
