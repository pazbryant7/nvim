return {
	'mrcjkb/rustaceanvim',
	enabled = function()
		return require('config.utils').executables_exist('/usr/lib/rustup/bin/rust-analyzer', 'cargo')
	end,
	version = '^6',
	ft = 'rust',
	config = function()
		local capabilities = require('plugins.lsp.setup').get_capabilities()

		vim.g.rustaceanvim = {
			tools = {
				runnables = {
					use_telescope = false,
				},
				debuggables = {
					use_telescope = false, -- Keep using fzf-lua
				},
			},
			server = {
				cmd = { '/usr/lib/rustup/bin/rust-analyzer' },
				settings = {
					['rust-analyzer'] = {
						procMacro = { enable = true },
						check = { command = 'clippy' },
						cargo = { features = 'all' },
					},
				},
				capabilities = capabilities,
			},
			dap = {
				autoload_configurations = false,
			},
		}
	end,
}
