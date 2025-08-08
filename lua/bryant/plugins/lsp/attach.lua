local M = {}

function M.get_keymaps()
	return {

		{ 'grn', vim.lsp.buf.rename, desc = 'LSP Rename' },
		{ 'grr', vim.lsp.buf.references, desc = 'LSP References' },
		{ 'grd', vim.diagnostic.setqflist, desc = 'LSP Diagnostics' },
		{ 'gd', vim.lsp.buf.definition, desc = 'LSP Goto Definition' },
		{ ']d', M.diagnostic_goto(true), desc = 'LSP Next Diagnostic' },
		{ '[d', M.diagnostic_goto(false), desc = 'LSP Prev Diagnostic' },
		{ 'gD', vim.lsp.buf.declaration, desc = 'LSP Goto Declaration' },
		{ ']h', M.diagnostic_goto(true, 'HINT'), desc = 'LSP Next Hint' },
		{ ']i', M.diagnostic_goto(true, 'INFO'), desc = 'LSP Next Info' },
		{ '[h', M.diagnostic_goto(false, 'HINT'), desc = 'LSP Prev Hint' },
		{ '[i', M.diagnostic_goto(false, 'INFO'), desc = 'LSP Prev Info' },
		{ ']e', M.diagnostic_goto(true, 'ERROR'), desc = 'LSP Next Error' },
		{ ']w', M.diagnostic_goto(true, 'WARN'), desc = 'LSP Next Warning' },
		{ '[e', M.diagnostic_goto(false, 'ERROR'), desc = 'LSP Prev Error' },
		{ '[w', M.diagnostic_goto(false, 'WARN'), desc = 'LSP Prev Warning' },
		{ 'gri', vim.lsp.buf.implementation, desc = 'LSP Goto Implementation' },
		{ 'gO', vim.lsp.buf.document_symbol, desc = 'LSP Open Document Symbol' },
		{ 'gt', vim.lsp.buf.type_definition, desc = 'LSP Goto Type Definition' },
		{ '<m-l>', M.diagnostic_goto(true), desc = 'LSP Error Next Diagnostic' },
		{ '<m-h>', M.diagnostic_goto(false), desc = 'LSP Error Prev Diagnostic' },
		{
			'K',
			function()
				vim.lsp.buf.hover({ border = 'single' })
			end,
			desc = 'LSP Hover',
		},
		{ 'gra', vim.lsp.buf.code_action, desc = 'LSP Code Action', mode = { 'n', 'v' } },
		{
			'<c-s>',
			function()
				vim.lsp.buf.signature_help({ border = 'single' })
			end,
			desc = 'LSP Signature Help',
			mode = { 'n', 'i' },
		},
	}
end

function M.diagnostic_goto(next, severity)
	severity = severity and vim.diagnostic.severity[severity] or nil

	local opts = { float = true, severity = severity }
	if next then
		opts.count = 1
	else
		opts.count = -1
	end

	return function()
		vim.diagnostic.jump(opts)
	end
end

function M.on_attach(_, buffer)
	local Keys = require('lazy.core.handler.keys')
	local keymaps = {}
	for _, value in ipairs(M.get_keymaps()) do
		local keys = Keys.parse(value)
		if keys[2] == vim.NIL or keys[2] == false then
			keymaps[keys.id] = nil
		else
			-- Preserve the original mode from the keymap definition
			keys.mode = value.mode or keys.mode or 'n'
			keymaps[keys.id] = keys
		end
	end
	for _, keys in pairs(keymaps) do
		local opts = Keys.opts(keys)
		opts.has = nil
		opts.silent = true
		opts.buffer = buffer
		vim.keymap.set(keys.mode, keys.lhs, keys.rhs, opts)
	end
end

return M
