local M = {}

local entries = {}
local log_buffer

---@param ... any
function M.add(...)
	local items = { ... }
	for _, item in ipairs(items) do
		table.insert(entries, vim.deepcopy(item))
	end
end

function M.clear()
	entries = {}
	vim.notify('Log cleared', vim.log.levels.INFO)
end

function M.show()
	if not log_buffer or not vim.api.nvim_buf_is_valid(log_buffer) then
		log_buffer = vim.api.nvim_create_buf(false, true)
		vim.bo[log_buffer].buftype = 'nofile'
		vim.bo[log_buffer].swapfile = false
		vim.bo[log_buffer].filetype = 'lua'
	end
	vim.api.nvim_set_current_buf(log_buffer)
	local formatted_log = vim.split(vim.inspect(entries), '\n')
	vim.api.nvim_buf_set_lines(log_buffer, 0, -1, false, formatted_log)
end

function M.copy()
	if #entries == 0 then
		vim.notify('Log is empty', vim.log.levels.WARN)
		return
	end
	local formatted_log = vim.inspect(entries)
	vim.fn.setreg('+', formatted_log) -- '+' is the clipboard register
	vim.notify('Log copied to clipboard!')
end

function M.print()
	if #entries == 0 then
		vim.notify('Log is empty', vim.log.levels.WARN)
		return
	end
	vim.print(entries)
end

_G.dd = M
