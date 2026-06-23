local M = {}

local skip = {
	'<node_internals>/**',
	'node_modules/**',
}

local common = {
	{
		name = 'Launch Chrome with "localhost"',
		type = 'pwa-chrome',
		request = 'launch',
		url = function()
			return vim.fn.input('Enter URL: ', 'http://localhost:3000')
		end,
		sourceMaps = true,
		protocol = 'inspector',
		skipFiles = skip,
	},
	{
		name = 'Attach to process (select pid)',
		type = 'pwa-node',
		request = 'attach',
		processId = function()
			return vim.fn.input('Enter PID: ')
		end,
		skipFiles = skip,
	},
}

local javascript = {
	{
		skipFiles = skip,
		type = 'pwa-node',
		sourceMaps = true,
		request = 'launch',
		program = '${file}',
		runtimeExecutable = 'node',
		name = 'Launch Current File (node)',
	},
}

local typescript = {
	{
		name = 'Launch Current File (node)',
		type = 'pwa-node',
		request = 'launch',
		program = '${file}',
		runtimeExecutable = 'node',
		sourceMaps = true,
		skipFiles = skip,
	},
}

local aliases = {
	javascriptreact = 'javascript',
	typescriptreact = 'typescript',
}

local configs = {
	javascript = javascript,
	typescript = typescript,
}

M.configurations = {}

for lang, config in pairs(configs) do
	local base = vim.deepcopy(common)
	vim.list_extend(base, config)
	M.configurations[lang] = base
end

for type, lang in pairs(aliases) do
	M.configurations[type] = M.configurations[lang]
end

return M.configurations
