local M = {}

function M.executables_exist(...)
	local executables = { ... }
	for _, exe in ipairs(executables) do
		if vim.fn.executable(exe) ~= 1 then
			return false
		end
	end
	return true
end

return M
