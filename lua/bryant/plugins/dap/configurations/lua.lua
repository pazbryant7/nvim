local M = {}

local common_config = {
	{
		name = 'Attach to running Neovim instance',
		type = 'nlua',
		request = 'attach',
	},
}

local lua_config = {}

local test_config = {}

local language_configs = {
	lua = lua_config,
}

M.configurations = {}

for lang, specific_config in pairs(language_configs) do
	local final_config = vim.deepcopy(common_config)
	vim.list_extend(final_config, specific_config)
	vim.list_extend(final_config, test_config)
	M.configurations[lang] = final_config
end

return M.configurations
