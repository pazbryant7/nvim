return {
	'mrcjkb/rustaceanvim',
	version = '^6',
	ft = { 'rust' },
	init = function()
		vim.g.rustaceanvim = {
			tools = {
				runnables = {
					use_telescope = false,
				},
			},
			server = {
				settings = {
					['rust-analyzer'] = {
						checkOnSave = false,
					},
				},
				on_attach = function(client, bufnr)
					-- Your general LSP keymaps here
					-- E.g., vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { buffer = bufnr })
				end,
			},
		}
	end,
}
