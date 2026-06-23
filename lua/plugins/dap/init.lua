return {
	'mfussenegger/nvim-dap',
	dependencies = {
		{ 'theHamsta/nvim-dap-virtual-text' },
		{ 'rcarriga/nvim-dap-ui', dependencies = 'nvim-neotest/nvim-nio' },
	},
	config = function()
		local dap = require('dap')
		require('plugins.dap.ui').setup(dap)
		require('nvim-dap-virtual-text').setup({ enabled = true })
		require('plugins.dap.signs').setup()

		local function load_and_merge_modules(module_prefix)
			local path = vim.fn.stdpath('config') .. '/lua/' .. module_prefix:gsub('%.', '/')
			local iter = vim.fs.dir(path)
			if not iter then
				vim.notify('DAP config directory not found: ' .. path, vim.log.levels.WARN)
				return {}
			end
			return vim.iter(iter):fold({}, function(acc, name, ftype)
				if ftype ~= 'file' or not name:match('%.lua$') then
					return acc
				end
				local mod = module_prefix .. '.' .. name:gsub('%.lua$', '')
				local ok, t = pcall(require, mod)
				if not ok or type(t) ~= 'table' then
					vim.notify('Failed to load DAP module: ' .. mod, vim.log.levels.ERROR)
					return acc
				end
				return vim.tbl_extend('force', acc, t)
			end)
		end

		dap.adapters = load_and_merge_modules('plugins.dap.adapters')
		dap.configurations = load_and_merge_modules('plugins.dap.configurations')
	end,

	keys = {
		{
			'<F1>',
			function()
				require('dap').step_over()
			end,
			desc = 'Dap: Step Over',
		},
		{
			'<F2>',
			function()
				require('dap').step_into()
			end,
			desc = 'Dap: Step Into',
		},
		{
			'<F3>',
			function()
				require('dap').step_out()
			end,
			desc = 'Dap: Step Out',
		},
		{
			'<F4>',
			function()
				require('dap').disconnect()
			end,
			desc = 'Dap: Disconnect',
		},
		{
			'<F5>',
			function()
				local ok, fzf = pcall(require, 'fzf-lua')
				if ok then
					local current = vim.ui.select
					if not (current and tostring(current):find('fzf')) then
						fzf.register_ui_select()
					end
				end
				require('dap').continue()
			end,
			desc = 'Dap: Continue',
		},
		{
			'<F6>',
			function()
				require('dap').run_last()
			end,
			desc = 'Dap: Run Last',
		},

		{
			'<leader><leader>t',
			function()
				require('dap').terminate()
			end,
			desc = 'Dap: Terminate',
		},
		{
			'<leader><leader>c',
			function()
				require('dap').clear_breakpoints()
			end,
			desc = 'Dap: Clear Breakpoints',
		},
		{
			'<leader><leader>b',
			function()
				require('dap').toggle_breakpoint()
			end,
			desc = 'Dap: Toggle Breakpoint',
		},

		{
			'<leader><leader>l',
			function()
				require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
			end,
			desc = 'Dap: Log Point',
		},

		{
			'<leader><leader>p',
			function()
				require('dap.ui.widgets').preview()
			end,
			desc = 'Dap: Preview',
		},

		{
			'<leader><leader>h',
			function()
				require('dap.ui.widgets').hover()
			end,
			desc = 'Dap: Hover',
			mode = { 'n', 'v' },
		},

		{
			'<leader><leader>f',
			function()
				local w = require('dap.ui.widgets')
				w.centered_float(w.frames)
			end,
			desc = 'Dap: Frames',
		},

		{
			'<leader><leader>s',
			function()
				local w = require('dap.ui.widgets')
				w.centered_float(w.scopes)
			end,
			desc = 'Dap: Scopes',
		},
	},
}
