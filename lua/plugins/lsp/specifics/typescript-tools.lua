return {
	'pmizio/typescript-tools.nvim',
	ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
	cmd = {
		'TSToolsRenameFile',
		'TSToolsFileReferences',
		'TSToolsFixAll',
		'TSToolsOrganizeImports',
		'TSToolsAddMissingImports',
	},
	config = function()
		local on_attach = require('plugins.lsp.attach').on_attach
		local capabilities = require('plugins.lsp.setup').get_capabilities()
		require('typescript-tools').setup({
			on_attach = on_attach,
			config = {
				capabilities = capabilities,
			},
			settings = {
				complete_function_calls = true,
				expose_as_code_action = 'all',
				separate_diagnostic_server = true,
			},
		})
	end,
}
