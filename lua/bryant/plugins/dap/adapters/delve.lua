local debug_server_path = vim.fn.exepath('dlv')

if debug_server_path == '' then
	debug_server_path = vim.fn.expand('$MASON/bin/dlv')
end

if vim.fn.executable(debug_server_path) == 0 then
	debug_server_path = vim.fn.expand('$MASON/packages/delve/dlv')
end

if vim.fn.executable(debug_server_path) == 0 then
	vim.notify(
		'delve executable not found!\n'
			.. 'Install delve via Mason: :MasonInstall delve\n'
			.. 'Tried paths:\n'
			.. '- '
			.. vim.fn.exepath('dlv')
			.. '\n'
			.. '- '
			.. vim.fn.expand('$MASON/bin/dlv')
			.. '\n'
			.. '- '
			.. vim.fn.expand('$MASON/packages/delve/dlv'),
		vim.log.levels.ERROR
	)
	return {}
end

return {
	go = {
		type = 'server',
		port = '${port}',
		executable = {
			command = debug_server_path,
			args = { 'dap', '-l', '127.0.0.1:${port}' },
		},
	},
}
