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
		},
		config = function()
			local dap = require('dap')
			local dapui = require('dapui')

			-- Setup components
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
      { '<F1>', function() require('dap').step_over() end, desc = 'Dap Debug: Step Over' },
      { '<F2>', function() require('dap').step_into() end, desc = 'Dap Debug: Step Into' },
      { '<F3>', function() require('dap').step_out() end, desc = 'Dap Debug: Step Out' },
      { '<F4>', function() require('dap').continue() end, desc = 'Dap Debug: Start/Continue' },

      { '<F5>', function() require('dap').disconnect() end, desc = 'Dap Debug: Disconnect' },
      { '<leader>dt', function() require('dap').terminate() end, desc = 'Dap Debug: Terminate' },

      { '<leader>cl', function() require('dap').clear_breakpoints() end, desc = 'Dap Clear Breakpoints', },
      { '<leader>b', function() require('dap').toggle_breakpoint() end, desc = 'Dap Debug: Toggle Breakpoint' },
      { '<leader>dh', function() require('dap.ui.widgets').hover() end, desc = 'Dap Debug: Hover Variables', mode = { 'n', 'v' }, },
      { '<leader>dw', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.scopes) end, desc = 'Dap Debug: Scopes', },
      { '<leader>df', function() local widgets = require('dap.ui.widgets') widgets.centered_float(widgets.frames) end, desc = 'Dap Debug: Frames', },
      { '<leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, desc = 'Dap Debug: Set Log Point', },
		},
	},
}
