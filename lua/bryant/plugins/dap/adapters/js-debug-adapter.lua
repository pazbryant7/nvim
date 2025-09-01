local home = vim.fn.expand('~')
local mason_path = home .. '/.local/share/nvim/mason/packages/js-debug-adapter'
local debug_server_path = mason_path .. '/js-debug/src/dapDebugServer.js'

if vim.fn.filereadable(debug_server_path) == 0 then
	vim.notify(
		'JS Debug Server not found at: '
			.. debug_server_path
			.. '\nPlease install js-debug-adapter via Mason: :DapInstall js',
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
