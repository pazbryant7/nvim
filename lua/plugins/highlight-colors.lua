return {
	'brenoprata10/nvim-highlight-colors',
	event = { 'BufReadPre', 'BufNewFile' },
	opts = {
		enable_tailwind = false,
		render = 'background',
	},
	config = function(_, opts)
		-- Use this plugin's scanner instead of LSP document-color highlights.
		vim.lsp.document_color.enable(false)
		require('nvim-highlight-colors').setup(opts)
	end,
}
