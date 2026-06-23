local M = {}

local common = {
	{
		name = 'Attach to process (select pid)',
		type = 'python',
		request = 'attach',
		processId = function()
			local pid = vim.fn.input('Enter PID: ')
			return tonumber(pid)
		end,
	},
}

local python = {
	{
		name = 'Launch Current File',
		type = 'python',
		request = 'launch',
		program = '${file}',
		console = 'integratedTerminal',
		justMyCode = true,
	},
}

local configs = {
	python = python,
}

M.configurations = {}

for type, lang in pairs(configs) do
	local base = vim.deepcopy(common)
	vim.list_extend(base, lang)
	M.configurations[type] = base
end

return M.configurations
