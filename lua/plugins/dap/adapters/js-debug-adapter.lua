local js_debug_executable = vim.fn.exepath('js-debug-adapter')

if vim.fn.executable(js_debug_executable) == 0 then
	vim.notify('js-debug-adapter executable not found!', vim.log.levels.INFO)
	return {}
end

local server_config = {
	type = 'server',
	host = 'localhost',
	port = '${port}',
	executable = {
		command = js_debug_executable,
		args = { '${port}' },
	},
	args = {},
}

return {
	['pwa-node'] = server_config,
	['pwa-chrome'] = server_config,
}
