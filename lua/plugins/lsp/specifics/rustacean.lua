return {
	'mrcjkb/rustaceanvim',
	version = '^6',
	ft = 'rust',
	config = function()
		local on_attach = require('plugins.lsp.attach').on_attach
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
				on_attach = on_attach,
				capabilities = capabilities,
			},
			dap = {
				autoload_configurations = false,
			},
		}
	end,
}
