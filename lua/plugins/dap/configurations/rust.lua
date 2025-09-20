local M = {}

local function get_project_root()
	local root_pattern = vim.fs.find({ '.git', 'Cargo.toml' }, { upward = true, stop = vim.env.HOME })[1]
	return root_pattern and vim.fs.dirname(root_pattern) or vim.fn.getcwd()
end

local project_root = get_project_root()

local common_config = {
	{
		name = 'Attach to process (select pid)',
		type = 'codelldb', -- Use codelldb for Rust
		request = 'attach',
		processId = function()
			local pid = vim.fn.input('Enter PID: ')
			return tonumber(pid)
		end,
		cwd = project_root,
		sourceLanguages = { 'rust' },
	},
}

local rust_config = {
	{
		name = 'Launch Main Binary',
		type = 'codelldb',
		request = 'launch',
		program = function()
			local binary_name = vim.fn.fnamemodify(project_root, ':t')
			return project_root .. '/target/debug/' .. binary_name
		end,
		cwd = project_root,
		stopOnEntry = false,
		sourceLanguages = { 'rust' },
	},
}

local test_config = {}

local language_configs = {
	rust = rust_config,
}

M.configurations = {}
for lang, specific_config in pairs(language_configs) do
	local final_config = vim.deepcopy(common_config)
	vim.list_extend(final_config, specific_config)
	vim.list_extend(final_config, test_config)
	M.configurations[lang] = final_config
end

return M.configurations
