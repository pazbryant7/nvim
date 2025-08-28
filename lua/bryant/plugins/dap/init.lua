return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
	},
	config = function()
		local dap = require('dap')
		local dapui = require('dapui')

		-- Setup UI, signs, etc.
		require('bryant.plugins.dap.signs').setup()
		require('bryant.plugins.dap.ui').setup(dap, dapui)

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

		dap.adapters = load_and_merge_modules('bryant.plugins.dap.adapters')
		dap.configurations = load_and_merge_modules('bryant.plugins.dap.configurations')
	end,
    -- stylua: ignore start
		keys = {
			{ '<F1>', function() require('dap').step_over() end, desc = 'Dap Debug: Step Over' },
			{ '<F2>', function() require('dap').step_into() end, desc = 'Dap Debug: Step Into' },
			{ '<F3>', function() require('dap').step_out() end, desc = 'Dap Debug: Step Out' },
			{ '<F4>', function() require('dap').disconnect() end, desc = 'Dap Debug: Disconnect' },
			{ '<F5>', function() require('dap').continue() end, desc = 'Dap Debug: Start/Continue' },
			{ '<leader>dt', function() require('dap').terminate() end, desc = 'Dap Debug: Terminate' },
			{ '<leader>cl', function() require('dap').clear_breakpoints() end, desc = 'Dap Clear Breakpoints' },
			{ '<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Dap Debug: Toggle Breakpoint' },
			{ '<leader>dh', function() require('dap.ui.widgets').hover() end, desc = 'Dap Debug: Hover Variables', mode = { 'n', 'v' }, },
			{ '<leader>dw', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end, desc = 'Dap Debug: Scopes', },
			{ '<leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end, desc = 'Dap Debug: Frames', },
			{ '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = 'Dap Debug: Set Log Point', },
		},
}
