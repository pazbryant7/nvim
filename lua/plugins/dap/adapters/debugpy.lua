local dap_args = {}
local debug_server_path = ''

local mason_shim_path = vim.fn.exepath('debugpy-adapter')
if mason_shim_path ~= '' then
	debug_server_path = mason_shim_path
	dap_args = {}
end

if debug_server_path == '' then
	local direct_shim_path = vim.fn.expand('$MASON/bin/debugpy-adapter')
	if vim.fn.executable(direct_shim_path) == 1 then
		debug_server_path = direct_shim_path
		dap_args = {}
	end
end

if debug_server_path == '' then
	local python_path = vim.fn.expand('$MASON/packages/debugpy/venv/bin/python')
	if vim.fn.executable(python_path) == 1 then
		debug_server_path = python_path
		dap_args = { '-m', 'debugpy.adapter' }
	end
end

-- If none of the paths worked, show an error
if debug_server_path == '' then
	vim.notify(
		'debugpy executable not found!\n' .. 'Please install debugpy via Mason: :MasonInstall debugpy',
		vim.log.levels.ERROR
	)
	return {}
end

return {
	python = {
		type = 'executable',
		command = debug_server_path,
		args = dap_args,
	},
}
