local home = vim.fn.expand('~')
local mason_pkg_path = home .. '/.local/share/nvim/mason/packages/debugpy'
local debug_server_path = mason_pkg_path .. '/venv/bin/python'

if vim.fn.executable(debug_server_path) == 0 then
	vim.notify(
		'debugpy executable not found at: '
			.. debug_server_path
			.. '\nPlease install debugpy via Mason: :MasonInstall debugpy',
		vim.log.levels.ERROR
	)
	return {}
end

return {
	python = {
		type = 'executable',
		command = debug_server_path,
		args = { '-m', 'debugpy.adapter' },
	},
}
