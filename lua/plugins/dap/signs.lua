local M = {}
local api = vim.api
local set_hl = vim.api.nvim_set_hl
local autocmd = api.nvim_create_autocmd
local augroup = api.nvim_create_augroup
local dap_group = augroup('dap_group', { clear = true })

M.set_dap_highlights = function()
	set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939' })
	set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef' })
	set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379' })
end

local SIGNS = {
	DapBreakpoint = { text = '', texthl = 'DapBreakpoint' },
	DapBreakpointCondition = { text = '', texthl = 'DapBreakpoint' },
	DapBreakpointRejected = { text = '󰅙', texthl = 'DapBreakpoint' },
	DapLogPoint = { text = '󱞶', texthl = 'DapLogPoint' },
	DapStopped = { text = '', texthl = 'DapStopped', linehl = 'debugPC' },
}

M.apply_all_signs = function()
	for name, opts in pairs(SIGNS) do
		vim.fn.sign_define(name, vim.tbl_extend('keep', opts, {}))
	end
end

M.aplly_all = function()
	M.set_dap_highlights()
	M.apply_all_signs()
end

M.setup = function()
	M.aplly_all()

	autocmd('ColorScheme', {
		desc = 'Redefine DAP signs on colorscheme change',
		group = dap_group,
		callback = function()
			M.aplly_all()
		end,
	})
end

return M
