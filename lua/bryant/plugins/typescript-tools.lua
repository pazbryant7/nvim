return {
	'pmizio/typescript-tools.nvim',
	dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
	cmd = {
		'TSToolsRenameFile',
		'TSToolsFileReferences',
		'TSToolsFixAll',
		'TSToolsOrganizeImports',
		'TSToolsAddMissingImports',
	},
	opts = {
		complete_function_calls = true,
		expose_as_code_action = 'all',
		separate_diagnostic_server = true,
	},
	ft = {
		'javascript',
		'typescript',
		'javascript.jsx',
		'typescript.tsx',
		'typescriptreact',
		'javascriptreact',
	},
}
