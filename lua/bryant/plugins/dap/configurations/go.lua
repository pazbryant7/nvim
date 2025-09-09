local M = {}

local function get_project_root()
	local root_pattern = vim.fs.find({ '.git', 'go.mod' }, { upward = true, stop = vim.env.HOME })[1]
	return root_pattern and vim.fs.dirname(root_pattern) or vim.fn.getcwd()
end

local project_root = get_project_root()

local common_config = {
	{
		name = 'Attach to process (select pid)',
		type = 'go', -- Changed type to 'go'
		request = 'attach',
		processId = function()
			local pid = vim.fn.input('Enter PID: ')
			return tonumber(pid)
		end,
		cwd = project_root,
	},
}

local go_config = {
	{
		name = 'Launch Current File',
		type = 'go',
		request = 'launch',
		program = '${file}', -- Debug the specific file you have open
		cwd = project_root,
	},
	{
		name = 'Launch Main Package',
		type = 'go',
		request = 'launch',
		program = project_root,
		cwd = project_root,
	},
}

local test_config = {
	{
		name = 'Debug tests in current file',
		type = 'go',
		request = 'launch',
		mode = 'test', -- Delve's special mode for running tests
		program = '${file}',
		cwd = project_root,
	},
	{
		name = 'Debug all tests in project',
		type = 'go',
		request = 'launch',
		mode = 'test',
		program = './...', -- Go's pattern for all packages
		cwd = project_root,
	},
}

local language_configs = {
	go = go_config,
}

M.configurations = {}
for lang, specific_config in pairs(language_configs) do
	local final_config = vim.deepcopy(common_config)
	vim.list_extend(final_config, specific_config)
	vim.list_extend(final_config, test_config)
	M.configurations[lang] = final_config
end

return M.configurations
