return {
	'mfussenegger/nvim-dap',
	dependencies = {
		'rcarriga/nvim-dap-ui',
		'nvim-neotest/nvim-nio',
		'jay-babu/mason-nvim-dap.nvim',
	},
	config = function()
		local dap = require('dap')
		local dapui = require('dapui')

		-- Setup dap-ui
		dapui.setup({
			-- You can customize the UI here
			layouts = {
				{
					elements = {
						{ id = 'scopes', size = 0.25 },
						{ id = 'breakpoints', size = 0.25 },
						{ id = 'stacks', size = 0.25 },
						{ id = 'watches', size = 0.25 },
					},
					position = 'left',
					size = 40,
				},
				{
					elements = {
						{ id = 'repl', size = 0.5 },
						{ id = 'console', size = 0.5 },
					},
					position = 'bottom',
					size = 10,
				},
			},
		})

		dap.listeners.after.event_initialized['dapui_config'] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated['dapui_config'] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited['dapui_config'] = function()
			dapui.close()
		end

		-- Sign configuration
		vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = '', linehl = '', numhl = '' })
		vim.fn.sign_define('DapBreakpointCondition', { text = '🟡', texthl = '', linehl = '', numhl = '' })
		vim.fn.sign_define('DapLogPoint', { text = '📝', texthl = '', linehl = '', numhl = '' })
		vim.fn.sign_define('DapStopped', { text = '▶️', texthl = '', linehl = 'debugPC', numhl = '' })
		vim.fn.sign_define('DapBreakpointRejected', { text = '❌', texthl = '', linehl = '', numhl = '' })
	end,
	keys = {
		{
			'<F5>',
			function()
				require('dap').continue()
			end,
			desc = 'Dap Debug: Start/Continue',
		},
		{
			'<F10>',
			function()
				require('dap').step_over()
			end,
			desc = 'Dap Debug: Step Over',
		},
		{
			'<F11>',
			function()
				require('dap').step_into()
			end,
			desc = 'Dap Debug: Step Into',
		},
		{
			'<F12>',
			function()
				require('dap').step_out()
			end,
			desc = 'Dap Debug: Step Out',
		},
		{
			'<leader>b',
			function()
				require('dap').toggle_breakpoint()
			end,
			desc = 'Dap Debug: Toggle Breakpoint',
		},
		{
			'<leader>B',
			function()
				require('dap').set_breakpoint()
			end,
			desc = 'Dap Debug: Set Breakpoint',
		},
		{
			'<leader>lp',
			function()
				require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
			end,
			desc = 'Dap Debug: Set Log Point',
		},
		{
			'<leader>dr',
			function()
				require('dap').repl.open()
			end,
			desc = 'Dap Debug: Open REPL',
		},
		{
			'<leader>dl',
			function()
				require('dap').run_last()
			end,
			desc = 'Dap Debug: Run Last',
		},
		{
			'<leader>dh',
			function()
				require('dap.ui.widgets').hover()
			end,
			desc = 'Dap Debug: Hover Variables',
			mode = { 'n', 'v' },
		},
		{
			'<leader>dp',
			function()
				require('dap.ui.widgets').preview()
			end,
			desc = 'Dap Debug: Preview',
			mode = { 'n', 'v' },
		},
		{
			'<leader>df',
			function()
				local widgets = require('dap.ui.widgets')
				widgets.centered_float(widgets.frames)
			end,
			desc = 'Dap Debug: Frames',
		},
		{
			'<leader>ds',
			function()
				local widgets = require('dap.ui.widgets')
				widgets.centered_float(widgets.scopes)
			end,
			desc = 'Dap Debug: Scopes',
		},
	},
}
