local M = {}

function M.set_diagnostics()
	vim.diagnostic.config({
		underline = true,
		severity_sort = true,
		virtual_text = false,
		virtual_lines = false,
		update_in_insert = false,
		dynamicRegistration = false,
		signs = {
			text = {
				ERROR = 'E',
				WARN = 'W',
				HINT = 'H',
				INFO = '?',
			},
		},
		float = {
			max_width = 100,
			focusable = true,
			style = 'minimal',
			border = 'single',
			header = { ' Diagnostics', 'Bold' },
		},
	})
end

function M.get_capabilities()
	local custom_capabilities = {
		textDocument = {
			semanticTokens = {
				dynamicRegistration = false,
				overlappingTokenSupport = false,
				multilineTokenSupport = false,
				augmentsSyntaxTokens = false,
			},
			completion = {
				dynamicRegistration = false,
				completionItem = {
					snippetSupport = false,
				},
			},
			formatting = {
				dynamicRegistration = false,
			},
			rangeFormatting = {
				dynamicRegistration = false,
			},
		},
	}
	local blink_capabilities = require('blink.cmp').get_lsp_capabilities()
	return vim.tbl_deep_extend('force', {}, blink_capabilities, custom_capabilities)
end

function M.enable_lsp_servers()
	vim.lsp.enable({
		'gopls',
		'bashls',
		'lua_ls',
		'clangd',
		'dockerls',
		'basedpyright',
		'markdown_oxide',
	})
end

function M.setup_capabilities()
	local capabilities = M.get_capabilities()
	vim.lsp.config('*', capabilities)
end

function M.setup()
	M.set_diagnostics()
	M.setup_capabilities()
	M.enable_lsp_servers()
end

return M
