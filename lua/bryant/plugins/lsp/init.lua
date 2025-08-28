return {
	{
		'folke/lazydev.nvim',
		ft = 'lua', -- only load on lua files
		opts = {},
	},

	{
		'mason-org/mason-lspconfig.nvim',
		opts = {
			ensure_installed = {
				'html',
				'gopls',
				'cssls',
				'ts_ls',
				'jsonls',
				'bashls',
				'lua_ls',
				'yamlls',
				'clangd',
				'marksman',
				'dockerls',
				'basedpyright',
				'emmet_language_server',
			},
			automatic_enable = {
				exclude = { 'ts_ls', 'rust_analyzer' },
			},
		},
		config = function(_, opts)
			require('mason-lspconfig').setup(opts)
			require('bryant.plugins.lsp.setup').setup()
			require('bryant.plugins.lsp.attach').on_attach()
		end,
	},

	{
		'neovim/nvim-lspconfig',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			'williamboman/mason-lspconfig.nvim',
		},
	},

	{
		'williamboman/mason.nvim',
		cmd = 'Mason',
		dependencies = {
			'WhoIsSethDaniel/mason-tool-installer.nvim',
		},
		config = function()
			local ensure_installed = {
				-- lua
				'stylua',
				'luacheck',
				-- web dev
				'prettierd',
				'prettier',
				-- bash
				'shfmt',
				'shellcheck',
				'shellharden',
				-- golang
				'gofumpt',
				'goimports',
				'golangci-lint',
				-- python
				'ruff',
				-- markdown
				'alex',
				'markdownlint',
				-- javascript
				'eslint_d',
				'js-debug-adapter',
				-- toml
				'taplo',
				-- c
				'clang-format',
			}

			require('mason').setup({
				ui = {
					border = 'single',
				},
			})

			require('mason-tool-installer').setup({
				ensure_installed = ensure_installed,
			})
		end,
		keys = {
			{ '<leader>M', '<cmd>Mason<cr>', desc = 'Open Mason' },
		},
	},

	{
		'nvim-neotest/neotest',
		dependencies = {
			'nvim-neotest/nvim-nio',
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter',

			-- Language adapters
		},
		config = function()
			require('neotest').setup({
				adapters = {
					-- adapters
				},

				-- Global configuration
				discovery = {
					enabled = true,
					concurrent = 1,
				},

				-- Test running configuration
				running = {
					concurrent = true,
				},

				-- Summary window configuration
				summary = {
					enabled = true,
					animated = true,
					follow = true,
					expand_errors = true,
				},

				-- Output configuration
				output = {
					enabled = true,
					open_on_run = 'short', -- short, long, or false
				},

				-- Status configuration (for statusline integration)
				status = {
					enabled = true,
					virtual_text = false,
					signs = true,
				},

				-- Icons and highlights
				icons = {
					child_indent = '│',
					child_prefix = '├',
					collapsed = '─',
					expanded = '╮',
					failed = '✖',
					final_child_indent = ' ',
					final_child_prefix = '╰',
					non_collapsible = '─',
					passed = '✓',
					running = '●',
					running_animated = { '/', '|', '\\', '-', '/', '|', '\\', '-' },
					skipped = '○',
					unknown = '?',
					watching = '👁',
				},

				-- Floating window configuration
				floating = {
					border = 'rounded',
					max_height = 0.6,
					max_width = 0.6,
					options = {},
				},

				-- Strategies for running tests
				strategies = {
					integrated = {
						height = 40,
						width = 120,
					},
				},

				-- Diagnostic integration
				diagnostic = {
					enabled = true,
					severity = get_capabilities.diagnostic.severity.ERROR,
				},
			})

			-- Optional: Set up signs for test status
			get_capabilities.fn.sign_define('neotest_passed', { text = '✓', texthl = 'NeotestPassed' })
			get_capabilities.fn.sign_define('neotest_failed', { text = '✖', texthl = 'NeotestFailed' })
			get_capabilities.fn.sign_define('neotest_running', { text = '●', texthl = 'NeotestRunning' })
			get_capabilities.fn.sign_define('neotest_skipped', { text = '○', texthl = 'NeotestSkipped' })
			get_capabilities.fn.sign_define('neotest_unknown', { text = '?', texthl = 'NeotestUnknown' })
		end,
		keys = {
			{
				'<leader>tt',
				function()
					require('neotest').run.run()
				end,
				desc = 'Test: Run Nearest Test',
			},
			{
				'<leader>tf',
				function()
					require('neotest').run.run(get_capabilities.fn.expand('%'))
				end,
				desc = 'Test: Run Current File',
			},
			{
				'<leader>td',
				function()
					require('neotest').run.run(get_capabilities.fn.getcwd())
				end,
				desc = 'Test: Run All Tests in Directory',
			},
			{
				'<leader>tl',
				function()
					require('neotest').run.run_last()
				end,
				desc = 'Test: Run Last Test',
			},
			{
				'<leader>tw',
				function()
					require('neotest').watch.toggle()
				end,
				desc = 'Test: Toggle Watch Mode',
			},

			-- Debug tests (requires DAP)
			{
				'<leader>tD',
				function()
					require('neotest').run.run({ strategy = 'dap' })
				end,
				desc = 'Test: Debug Nearest Test',
			},

			-- Test results and output
			{
				'<leader>ts',
				function()
					require('neotest').summary.toggle()
				end,
				desc = 'Test: Toggle Summary Window',
			},
			{
				'<leader>to',
				function()
					require('neotest').output.open({ enter = true, auto_close = true })
				end,
				desc = 'Test: Open Output Window',
			},
			{
				'<leader>tO',
				function()
					require('neotest').output_panel.toggle()
				end,
				desc = 'Test: Toggle Output Panel',
			},

			-- Navigation
			{
				']t',
				function()
					require('neotest').jump.next({ status = 'failed' })
				end,
				desc = 'Test: Jump to Next Failed Test',
			},
			{
				'[t',
				function()
					require('neotest').jump.prev({ status = 'failed' })
				end,
				desc = 'Test: Jump to Previous Failed Test',
			},

			-- Stop tests
			{
				'<leader>tS',
				function()
					require('neotest').run.stop()
				end,
				desc = 'Test: Stop Running Tests',
			},
		},
	},
}
