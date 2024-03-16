vim.diagnostic.config({
	underline = false,
	severity_sort = true,
	virtual_text = false,
	virtual_lines = false,
	update_in_insert = false,
	dynamicRegistration = true,
	float = {
		source = true,
		max_width = 100,
		focusable = true,
		style = 'minimal',
		border = 'single',
		header = { ' Diagnostics', 'Bold' },
		signs = {
			text = { ERROR = 'E', WARN = 'W', HINT = 'H', INFO = '?' },
		},
		prefix = function(ctx)
			local severity = vim.diagnostic.severity[ctx.severity]
			return '  ', 'Diagnostic' .. severity
		end,
	},
})

vim.lsp.config('*', {
	capabilities = {
		textDocument = {
			semanticTokens = {
				dynamicRegistration = false,
				overlappingTokenSupport = false,
				multilineTokenSupport = false,
				augmentsSyntaxTokens = false,
			},
			completion = {
				dynamicRegistration = false,
			},
			formatting = {
				dynamicRegistration = false,
			},
			rangeFormatting = {
				dynamicRegistration = false,
			},
		},
	},
})

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'Attach lsp user custom keybinds',
	group = vim.api.nvim_create_augroup('bryant-lsp', { clear = true }),
	callback = function()
		require('bryant.plugins.lsp.attach').on_attach(client, bufnr)
	end,
})
