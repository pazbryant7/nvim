return {
	'mrcjkb/rustaceanvim',
	version = '^6',
	ft = 'rust',
	config = function()
		local on_attach = require('bryant.plugins.lsp.attach').on_attach
		local capabilities = require('bryant.plugins.lsp.setup').get_capabilities()

		vim.g.rustaceanvim = {
			tools = {
				runnables = {
					use_telescope = false,
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
		}
	end,
}
