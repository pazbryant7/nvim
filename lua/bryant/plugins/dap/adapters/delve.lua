local home = vim.fn.expand('~')
local mason_pkg_path = home .. '/.local/share/nvim/mason/packages/delve'
local debug_server_path = mason_pkg_path .. '/dlv'

if vim.fn.executable(debug_server_path) == 0 then
	vim.notify(
		'delve executable not found at: ' .. debug_server_path .. '\nPlease install delve via Mason: :MasonInstall delve',
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
