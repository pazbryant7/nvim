return {
	{
		'jay-babu/mason-nvim-dap.nvim',
		dependencies = {
			'mason.nvim',
			'mfussenegger/nvim-dap',
		},
		config = function()
			require('mason-nvim-dap').setup({
				ensure_installed = {
					'codelldb',
					'delve',
					'debugpy',
					'bash-debug-adapter',
					'js',
				},
				automatic_installation = true,
				handlers = {
					function(config)
						require('mason-nvim-dap').default_setup(config)
					end,
				},
			})
		end,
	},

	{
		'mfussenegger/nvim-dap',
		dependencies = {
			'rcarriga/nvim-dap-ui',
			'nvim-neotest/nvim-nio',
			'jay-babu/mason-nvim-dap.nvim',
			'theHamsta/nvim-dap-virtual-text',
		},
		config = function()
			local dap = require('dap')
			local dapui = require('dapui')

			-- Setup components
			require('bryant.plugins.dap.virtual-text').setup()
			require('bryant.plugins.dap.signs').setup()
			require('bryant.plugins.dap.ui').setup(dap, dapui)

			-- Custom JavascriptAdapters until mason-nvim-dap add defaults
			local js_adapters = require('bryant.plugins.dap.adapters.js-debug-adapter')
			local js_config = require('bryant.plugins.dap.configurations.javascript')
			local ts_config = require('bryant.plugins.dap.configurations.typescript')

			dap.adapters = js_adapters
			dap.configurations = vim.tbl_deep_extend('force', {}, js_config, ts_config)
		end,
    -- stylua: ignore start
		keys = {
      { '<F12>', function() require('dap').step_out() end, desc = 'Dap Debug: Step Out' },
      { '<F11>', function() require('dap').step_into() end, desc = 'Dap Debug: Step Into' },
      { '<F10>', function() require('dap').step_over() end, desc = 'Dap Debug: Step Over' },
      { '<leader>dl', function() require('dap').run_last() end, desc = 'Dap Debug: Run Last' },
      { '<F5>', function() require('dap').continue() end, desc = 'Dap Debug: Start/Continue' },
      { '<leader>dr', function() require('dap').repl.open() end, desc = 'Dap Debug: Open REPL' },
      { '<leader>B', function() require('dap').set_breakpoint() end, desc = 'Dap Debug: Set Breakpoint' },
      { '<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Dap Debug: Toggle Breakpoint' },
      { '<leader>dp', function() require('dap.ui.widgets').preview() end, desc = 'Dap Debug: Preview', mode = { 'n', 'v' } },
      { '<leader>dh', function() require('dap.ui.widgets').hover() end, desc = 'Dap Debug: Hover Variables', mode = { 'n', 'v' }, },
      { '<leader>ds', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end, desc = 'Dap Debug: Scopes', },
      { '<leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end, desc = 'Dap Debug: Frames', },
      { '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = 'Dap Debug: Set Log Point', },
		},
	},
}
