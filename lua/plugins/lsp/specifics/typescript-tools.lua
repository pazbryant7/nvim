return {
	'pmizio/typescript-tools.nvim',
	enabled = os.getenv('KATA') == nil,
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
		local function exists(path)
			return path and (vim.uv or vim.loop).fs_stat(path) ~= nil
		end

		local function resolve_tsserver_path()
			local bufname = vim.api.nvim_buf_get_name(0)
			local start = bufname ~= '' and vim.fs.dirname(bufname) or vim.uv.cwd()
			local marker = vim.fs.find({ 'package.json', '.git' }, { path = start, upward = true })[1]
			local root = marker and vim.fs.dirname(marker)

			local local_ts = root and root .. '/node_modules/typescript/bin/tsserver'
			local mason_ts = vim.fn.stdpath('data')
				.. '/mason/packages/typescript-language-server/node_modules/typescript/bin/tsserver'

			return exists(local_ts) and local_ts or (exists(mason_ts) and mason_ts or nil)
		end

		require('typescript-tools').setup({
			on_attach = require('plugins.lsp.attach').on_attach,
			capabilities = require('plugins.lsp.setup').get_capabilities(),
			settings = {
				complete_function_calls = false,
				expose_as_code_action = 'all',
				separate_diagnostic_server = false,
				tsserver_path = resolve_tsserver_path(),
			},
		})
	end,
}
