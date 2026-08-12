return {
	'pmizio/typescript-tools.nvim',
	enabled = function()
		return require('config.utils').executables_exist('node', 'tsc')
	end,
	ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
	cmd = {
		'TSToolsFixAll',
		'TSToolsRenameFile',
		'TSToolsFileReferences',
		'TSToolsOrganizeImports',
		'TSToolsAddMissingImports',
	},
	config = function()
		require('typescript-tools').setup({
			on_attach = require('plugins.lsp.attach').on_attach,
			capabilities = require('plugins.lsp.setup').get_capabilities(),
			settings = {
				complete_function_calls = false,
				expose_as_code_action = 'all',
				separate_diagnostic_server = false,
			},
		})
	end,
}
