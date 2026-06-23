local M = {}

local function get_project_root()
	local root_pattern = vim.fs.find({ '.git', 'package.json' }, { upward = true, stop = vim.env.HOME })[1]
	return root_pattern and vim.fs.dirname(root_pattern) or vim.fn.getcwd()
end

local shared_skip_files = {
	'<node_internals>/**',
	'node_modules/**',
}

local project_root = get_project_root()

local common_config = {
	{
		name = 'Launch Chrome with "localhost"',
		type = 'pwa-chrome',
		request = 'launch',
		url = function()
			return vim.fn.input('Enter URL: ', 'http://localhost:3000')
		end,
		webRoot = project_root,
		sourceMaps = true,
		protocol = 'inspector',
		skipFiles = shared_skip_files,
	},
	{
		name = 'Attach to process (select pid)',
		type = 'pwa-node',
		request = 'attach',
		processId = function()
			return vim.fn.input('Enter PID: ')
		end,
		cwd = project_root,
		skipFiles = shared_skip_files,
	},
}

local javascript_config = {
	{
		name = 'Launch Current File (node)',
		type = 'pwa-node',
		request = 'launch',
		program = '${file}',
		cwd = project_root,
		sourceMaps = true,
		runtimeExecutable = 'node',
		skipFiles = shared_skip_files,
	},
}

local typescript_config = {
	{
		name = 'Launch Current File (tsx)',
		type = 'pwa-node',
		request = 'launch',
		program = '${file}',
		cwd = project_root,
		runtimeExecutable = 'tsx',
		sourceMaps = true,
		skipFiles = shared_skip_files,
	},
}

local test_config = {}

local language_configs = {
	javascript = javascript_config,
	typescript = typescript_config,
}

local language_aliases = {
	javascriptreact = 'javascript',
	typescriptreact = 'typescript',
}

M.configurations = {}

for lang, specific_config in pairs(language_configs) do
	local final_config = vim.deepcopy(common_config)
	vim.list_extend(final_config, specific_config)
	vim.list_extend(final_config, test_config)
	M.configurations[lang] = final_config
end

for new_lang, existing_lang in pairs(language_aliases) do
	M.configurations[new_lang] = M.configurations[existing_lang]
end

return M.configurations
