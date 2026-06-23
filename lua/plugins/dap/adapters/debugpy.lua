local debugpy_executable = vim.fn.exepath('debugpy-adapter')

if vim.fn.executable(debugpy_executable) == 0 then
	vim.notify('debugpy executable not found!', vim.log.levels.INFO)
	return {}
end

return {
	python = {
		type = 'executable',
		command = debugpy_executable,
		args = {},
	},
}
