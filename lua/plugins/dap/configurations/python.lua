local M = {}

local function get_project_root()
	local root_pattern =
		vim.fs.find({ '.git', 'pyproject.toml', 'requirements.txt' }, { upward = true, stop = vim.env.HOME })[1]
	return root_pattern and vim.fs.dirname(root_pattern) or vim.fn.getcwd()
end

local project_root = get_project_root()

local common_config = {
	{
		name = 'Attach to process (select pid)',
		type = 'python',
		request = 'attach',
		processId = function()
			local pid = vim.fn.input('Enter PID: ')
			return tonumber(pid)
		end,
		cwd = project_root,
	},
}

local python_config = {
	{
		name = 'Launch Current File',
		type = 'python',
		request = 'launch',
		program = '${file}',
		cwd = project_root,
		console = 'integratedTerminal',
		justMyCode = true,
	},
}

local test_config = {}

local language_configs = {
	python = python_config,
}

M.configurations = {}

for lang, specific_config in pairs(language_configs) do
	local final_config = vim.deepcopy(common_config)
	vim.list_extend(final_config, specific_config)
	vim.list_extend(final_config, test_config)
	M.configurations[lang] = final_config
end

return M.configurations
