local debug_server_path = vim.fn.expand('$MASON/share/js-debug-adapter/js-debug/src/dapDebugServer.js')

if vim.fn.filereadable(debug_server_path) == 0 then
	debug_server_path = vim.fn.expand('$MASON/packages/js-debug-adapter/js-debug/src/dapDebugServer.js')
end

if vim.fn.filereadable(debug_server_path) == 0 then
	debug_server_path = vim.fn.expand('$MASON/packages/js-debug-adapter/out/src/dapDebugServer.js')
end

if vim.fn.filereadable(debug_server_path) == 0 then
	vim.notify(
		'JS Debug Server not found!\n'
			.. 'Install js-debug-adapter via Mason: :MasonInstall js-debug-adapter\n'
			.. 'Tried paths:\n'
			.. '- '
			.. vim.fn.expand('$MASON/share/js-debug-adapter/js-debug/src/dapDebugServer.js')
			.. '\n'
			.. '- '
			.. vim.fn.expand('$MASON/packages/js-debug-adapter/js-debug/src/dapDebugServer.js')
			.. '\n'
			.. '- '
			.. vim.fn.expand('$MASON/packages/js-debug-adapter/out/src/dapDebugServer.js'),
		vim.log.levels.ERROR
	)
	return {}
end

if vim.fn.executable('node') == 0 then
	vim.notify(
		'Node.js not found!\n' .. 'js-debug-adapter requires Node.js to be installed and available in PATH',
		vim.log.levels.ERROR
	)
	return {}
end

return {
	['pwa-node'] = {
		type = 'server',
		host = 'localhost',
		port = '${port}',
		executable = {
			command = 'node',
			args = {
				debug_server_path,
				'${port}',
			},
		},
	},
	['pwa-chrome'] = {
		type = 'server',
		host = 'localhost',
		port = '${port}',
		executable = {
			command = 'node',
			args = {
				debug_server_path,
				'${port}',
			},
		},
	},
}
