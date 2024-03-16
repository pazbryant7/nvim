return {
	'mfussenegger/nvim-dap',

	config = function()
		local dap = require('dap')
		require('plugins.dap.signs').setup()

		local function load_and_merge_modules(module_prefix)
			local merged_table = {}
			local search_path = vim.fn.stdpath('config') .. '/lua/' .. module_prefix:gsub('%.', '/')
			local files_iterator = vim.fs.dir(search_path)
			if not files_iterator then
				vim.notify('DAP config directory not found: ' .. search_path, vim.log.levels.WARN)
				return merged_table
			end

			for file_name, file_type in files_iterator do
				if file_type == 'file' and file_name:match('%.lua$') then
					local module_name = file_name:gsub('%.lua$', '')
					local module_path = module_prefix .. '.' .. module_name
					local ok, content = pcall(require, module_path)
					if ok and type(content) == 'table' then
						merged_table = vim.tbl_extend('force', merged_table, content)
					else
						vim.notify('Failed to load DAP module: ' .. module_path, vim.log.levels.ERROR)
					end
				end
			end

			return merged_table
		end

		dap.adapters = load_and_merge_modules('plugins.dap.adapters')
		dap.configurations = load_and_merge_modules('plugins.dap.configurations')
	end,

	keys = {
		{
			'<F3>',
			function()
				require('dap').step_out()
			end,
			desc = 'Dap: Step Out',
		},
		{
			'<F2>',
			function()
				require('dap').step_into()
			end,
			desc = 'Dap: Step Into',
		},
		{
			'<F1>',
			function()
				require('dap').step_over()
			end,
			desc = 'Dap: Step Over',
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
			'<leader>dt',
			function()
				require('dap').terminate()
			end,
			desc = 'Dap: Terminate',
		},
		{
			'<leader>dc',
			function()
				require('dap').clear_breakpoints()
			end,
			desc = 'Dap: Clear Breakpoints',
		},
		{
			'<leader>db',
			function()
				require('dap').toggle_breakpoint()
			end,
			desc = 'Dap: Toggle Breakpoint',
		},

		{
			'<leader>dl',
			function()
				require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
			end,
			desc = 'Dap: Log Point',
		},

		{
			'<leader>dp',
			function()
				require('dap.ui.widgets').preview()
			end,
			desc = 'Dap: Preview',
		},

		{
			'<leader>dh',
			function()
				require('dap.ui.widgets').hover()
			end,
			desc = 'Dap: Hover',
			mode = { 'n', 'v' },
		},

		{
			'<leader>df',
			function()
				local w = require('dap.ui.widgets')
				w.centered_float(w.frames)
			end,
			desc = 'Dap: Frames',
		},

		{
			'<leader>dS',
			function()
				local w = require('dap.ui.widgets')
				w.centered_float(w.scopes)
			end,
			desc = 'Dap: Scopes',
		},
	},
}
