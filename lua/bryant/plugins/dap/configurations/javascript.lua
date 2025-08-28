local M = {}
local dap_utils = {
	pick_process = function()
		return vim.fn.input('Enter PID: ')
	end,
}

local common_config = {
	{
		type = 'pwa-chrome',
		request = 'launch',
		name = 'Launch Chrome with "localhost"',
		url = function()
			local co = coroutine.running()
			return coroutine.create(function()
				vim.ui.input({ prompt = 'Enter URL: ', default = 'http://localhost:3000' }, function(url)
					if url == nil or url == '' then
						return
					else
						coroutine.resume(co, url)
					end
				end)
			end)
		end,
		webRoot = '${workspaceFolder}',
		protocol = 'inspector',
		sourceMaps = true,
		userDataDir = false,
		skipFiles = { '<node_internals>/**', 'node_modules/**', '${workspaceFolder}/node_modules/**' },
	},
	{
		name = 'Next.js: debug server-side',
		type = 'pwa-node',
		request = 'attach',
		port = 9231,
		skipFiles = { '<node_internals>/**', 'node_modules/**' },
		cwd = '${workspaceFolder}',
	},
	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Launch Current File (pnpm dev)',
		cwd = vim.fn.getcwd(),
		runtimeExecutable = 'pnpm',
		runtimeArgs = { 'run-script', 'dev' },
		sourceMaps = true,
		protocol = 'inspector',
		args = { '${file}' },
	},
	{
		type = 'pwa-chrome',
		request = 'attach',
		name = 'Attach to Chrome (select port)',
		program = '${file}',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		port = function()
			return vim.fn.input('Select port: ', '9222')
		end,
		webRoot = '${workspaceFolder}',
		skipFiles = { '<node_internals>/**', 'node_modules/**' },
	},
	{
		type = 'pwa-node',
		request = 'attach',
		name = 'Attach to process (select pid)',
		cwd = vim.fn.getcwd(),
		processId = dap_utils.pick_process,
		skipFiles = { '<node_internals>/**' },
	},
}

local typescript_config = {
	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Launch Current File (ts-node)',
		cwd = vim.fn.getcwd(),
		runtimeArgs = { '--loader', 'ts-node/esm' },
		runtimeExecutable = 'node',
		args = { '${file}' },
		sourceMaps = true,
		protocol = 'inspector',
		skipFiles = { '<node_internals>/**', 'node_modules/**' },
	},
	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Launch Current File (tsx)',
		cwd = vim.fn.getcwd(),
		runtimeExecutable = 'tsx',
		args = { '${file}' },
		sourceMaps = true,
		protocol = 'inspector',
		skipFiles = { '<node_internals>/**', 'node_modules/**' },
	},
	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Test Current File (deno)',
		cwd = vim.fn.getcwd(),
		runtimeArgs = { 'test', '--inspect-brk', '--allow-all', '${file}' },
		runtimeExecutable = 'deno',
		attachSimplePort = 9229,
	},
}

local javascript_config = {
	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Launch Current File (node)',
		cwd = vim.fn.getcwd(),
		runtimeExecutable = 'node',
		args = { '${file}' },
		sourceMaps = true,
		protocol = 'inspector',
		skipFiles = { '<node_internals>/**', 'node_modules/**' },
	},
}

local test_config = {
	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Test Current File (jest)',
		cwd = vim.fn.getcwd(),
		runtimeArgs = { '${workspaceFolder}/node_modules/.bin/jest' },
		runtimeExecutable = 'node',
		args = { '${file}', '--coverage', 'false' },
		rootPath = '${workspaceFolder}',
		sourceMaps = true,
		console = 'integratedTerminal',
		internalConsoleOptions = 'neverOpen',
		skipFiles = { '<node_internals>/**', 'node_modules/**' },
	},
	{
		type = 'pwa-node',
		request = 'launch',
		name = 'Test Current File (vitest)',
		cwd = vim.fn.getcwd(),
		program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
		args = { '--inspect-brk', '--threads', 'false', 'run', '${file}' },
		autoAttachChildProcesses = true,
		smartStep = true,
		console = 'integratedTerminal',
		skipFiles = { '<node_internals>/**', 'node_modules/**' },
	},
}

local function create_language_config(common, lang_specific, test)
	local final_config = vim.deepcopy(common)

	vim.list_extend(final_config, lang_specific)
	vim.list_extend(final_config, test)

	return final_config
end

M.configurations = {}
M.configurations.javascript = create_language_config(common_config, javascript_config, test_config)
M.configurations.typescript = create_language_config(common_config, typescript_config, test_config)

M.configurations.javascriptreact = M.configurations.javascript
M.configurations.typescriptreact = M.configurations.typescript

return M.configurations
