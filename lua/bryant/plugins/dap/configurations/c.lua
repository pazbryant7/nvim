local M = {}

local function get_project_root()
	-- Look for common C project indicators
	local root_pattern = vim.fs.find(
		{ '.git', 'Makefile', 'CMakeLists.txt', 'compile_commands.json', 'build' },
		{ upward = true, stop = vim.env.HOME }
	)[1]
	return root_pattern and vim.fs.dirname(root_pattern) or vim.fn.getcwd()
end

local project_root = get_project_root()

local common_config = {
	{
		name = 'Attach to process (select pid)',
		type = 'codelldb',
		request = 'attach',
		processId = function()
			local pid = vim.fn.input('Enter PID: ')
			return tonumber(pid)
		end,
		cwd = project_root,
		sourceLanguages = { 'c' },
	},
}

local c_config = {
	{
		name = 'Launch executable',
		type = 'codelldb',
		request = 'launch',
		program = function()
			-- Look for common executable locations
			local possible_paths = {
				project_root .. '/a.out', -- Default gcc output
				project_root .. '/build/main',
				project_root .. '/build/' .. vim.fn.fnamemodify(project_root, ':t'),
				project_root .. '/bin/main',
				project_root .. '/bin/' .. vim.fn.fnamemodify(project_root, ':t'),
				project_root .. '/main',
				project_root .. '/' .. vim.fn.fnamemodify(project_root, ':t'),
			}

			-- Check if any of the common paths exist
			for _, path in ipairs(possible_paths) do
				if vim.fn.executable(path) == 1 then
					return path
				end
			end

			-- If none found, prompt user
			return vim.fn.input('Path to executable: ', project_root .. '/', 'file')
		end,
		cwd = project_root,
		stopOnEntry = false,
		sourceLanguages = { 'c' },
		-- Add some useful environment for C debugging
		environment = {},
		-- Enable pretty printing for better variable display
		setupCommands = {
			{
				text = '-enable-pretty-printing',
				description = 'Enable pretty printing',
				ignoreFailures = false,
			},
		},
	},
	{
		name = 'Launch with arguments',
		type = 'codelldb',
		request = 'launch',
		program = function()
			return vim.fn.input('Path to executable: ', project_root .. '/', 'file')
		end,
		args = function()
			local args_string = vim.fn.input('Program arguments: ')
			return vim.split(args_string, ' ')
		end,
		cwd = project_root,
		stopOnEntry = false,
		sourceLanguages = { 'c' },
		setupCommands = {
			{
				text = '-enable-pretty-printing',
				description = 'Enable pretty printing',
				ignoreFailures = false,
			},
		},
	},
}

local test_config = {}

local language_configs = {
	c = c_config,
}

M.configurations = {}
for lang, specific_config in pairs(language_configs) do
	local final_config = vim.deepcopy(common_config)
	vim.list_extend(final_config, specific_config)
	vim.list_extend(final_config, test_config)
	M.configurations[lang] = final_config
end

return M.configurations
