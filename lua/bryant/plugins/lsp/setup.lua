local M = {}

function M.set_diagnostics()
	vim.diagnostic.config({
		underline = true,
		severity_sort = true,
		virtual_text = false,
		virtual_lines = false,
		update_in_insert = false,
		dynamicRegistration = false,
		float = {
			max_width = 100,
			focusable = true,
			style = 'minimal',
			border = 'single',
			header = { ' Diagnostics', 'Bold' },
			signs = {
				text = { ERROR = 'E', WARN = 'W', HINT = 'H', INFO = '?' },
			},
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

function M.setup_capabilities()
	local capabilities = M.get_capabilities()
	vim.lsp.config('*', capabilities)
end

function M.setup()
	M.set_diagnostics()
	M.setup_capabilities()
end

return M
