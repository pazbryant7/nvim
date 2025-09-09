local codelldb_path = vim.fn.exepath('codelldb')

if codelldb_path == '' then
	codelldb_path = vim.fn.expand('$MASON/bin/codelldb')
end

if vim.fn.executable(codelldb_path) == 0 then
	codelldb_path = vim.fn.expand('$MASON/packages/codelldb/extension/adapter/codelldb')
end

if vim.fn.executable(codelldb_path) == 0 then
	vim.notify(
		'codelldb executable not found!\n'
			.. 'Install codelldb via Mason: :MasonInstall codelldb\n'
			.. 'Tried paths:\n'
			.. '- '
			.. vim.fn.exepath('codelldb')
			.. '\n'
			.. '- '
			.. vim.fn.expand('$MASON/bin/codelldb')
			.. '\n'
			.. '- '
			.. vim.fn.expand('$MASON/packages/codelldb/extension/adapter/codelldb'),
		vim.log.levels.ERROR
	)
	return {}
end

local liblldb_path
if vim.fn.has('mac') == 1 then
	liblldb_path = vim.fn.expand('$MASON/packages/codelldb/extension/lldb/lib/liblldb.dylib')
elseif vim.fn.has('win32') == 1 then
	liblldb_path = vim.fn.expand('$MASON/packages/codelldb/extension/lldb/bin/liblldb.dll')
else
	liblldb_path = vim.fn.expand('$MASON/packages/codelldb/extension/lldb/lib/liblldb.so')
end

local liblldb_dir = vim.fn.fnamemodify(liblldb_path, ':h')

if vim.fn.filereadable(liblldb_path) == 0 then
	vim.notify(
		'liblldb not found at: ' .. liblldb_path .. '\n' .. 'codelldb installation may be incomplete',
		vim.log.levels.WARN
	)
end

return {
	codelldb = {
		type = 'server',
		port = '${port}',
		executable = {
			command = 'env',
			args = {
				'LLDB_LIB_DIR=' .. liblldb_dir,
				codelldb_path,
				'--port',
				'${port}',
			},
			options = {
				detached = false,
			},
		},
	},
}
