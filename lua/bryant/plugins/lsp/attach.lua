local M = {}

function M.get_keymaps()
	return {
		{ 'grr', vim.lsp.buf.references, desc = 'LSP References' },
		{ 'grn', vim.lsp.buf.rename, desc = 'LSP Rename' },
		{ 'gO', vim.lsp.buf.document_symbol, desc = 'LSP Open Document Symbol' },
		{ 'gd', vim.lsp.buf.definition, desc = 'LSP Goto Definition' },
		{ ']d', M.diagnostic_goto(true), desc = 'LSP Next Diagnostic' },
		{ 'gD', vim.lsp.buf.declaration, desc = 'LSP Goto Declaration' },
		{ '[d', M.diagnostic_goto(false), desc = 'LSP Prev Diagnostic' },
		{ ']e', M.diagnostic_goto(true, 'ERROR'), desc = 'LSP Next Error' },
		{ '[e', M.diagnostic_goto(false, 'ERROR'), desc = 'LSP Prev Error' },
		{ ']i', M.diagnostic_goto(true, 'INFO'), desc = 'LSP Next Info' },
		{ '[i', M.diagnostic_goto(false, 'INFO'), desc = 'LSP Prev Info' },
		{ ']h', M.diagnostic_goto(true, 'HINT'), desc = 'LSP Next Hint' },
		{ '[h', M.diagnostic_goto(false, 'HINT'), desc = 'LSP Prev Hint' },
		{ ']w', M.diagnostic_goto(true, 'WARN'), desc = 'LSP Next Warning' },
		{ '[w', M.diagnostic_goto(false, 'WARN'), desc = 'LSP Prev Warning' },
		{ 'gri', vim.lsp.buf.implementation, desc = 'LSP Goto Implementation' },
		{ 'gt', vim.lsp.buf.type_definition, desc = 'LSP Goto Type Definition' },
		{
			'K',
			function()
				vim.lsp.buf.hover({ border = 'single' })
			end,
			desc = 'LSP Hover',
		},
		{
			'gra',
			vim.lsp.buf.code_action,
			desc = 'LSP Code Action',
			mode = { 'n', 'v' },
		},
		{
			'<c-s>',
			function()
				vim.lsp.buf.signature_help({ border = 'single' })
			end,
			desc = 'LSP Signature Help',
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

function M.on_attach(client, buffer)
	local Keys = require('lazy.core.handler.keys')
	local keymaps = {}

	for _, value in ipairs(M.get_keymaps()) do
		local keys = Keys.parse(value)
		if keys[2] == vim.NIL or keys[2] == false then
			keymaps[keys.id] = nil
		else
			keymaps[keys.id] = keys
		end
	end

	for _, keys in pairs(keymaps) do
		local opts = Keys.opts(keys)
		opts.has = nil
		opts.silent = true
		opts.buffer = buffer
		vim.keymap.set(keys.mode or 'n', keys.lhs, keys.rhs, opts)
	end
end

return M
