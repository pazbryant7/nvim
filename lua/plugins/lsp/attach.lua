local M = {}

local function on_list(options)
	vim.fn.setqflist({}, 'r', options)
	if #options.items > 1 then
		vim.cmd.copen()
		vim.cmd.cfirst()
	else
		vim.cmd.cfirst()
	end
end

function M.diagnostic_goto(next, severity)
	severity = severity and vim.diagnostic.severity[severity] or nil

	return function()
		vim.diagnostic.jump({
			count = (next and 1 or -1) * vim.v.count1,
			float = true,
			severity = severity,
		})
	end
end

function M.get_keymaps()
	return {
		{ 'gD', vim.lsp.buf.declaration, desc = 'LSP Goto Declaration' },

		{ ']e', M.diagnostic_goto(true, 'ERROR'), desc = 'LSP Next Error' },
		{ '[e', M.diagnostic_goto(false, 'ERROR'), desc = 'LSP Prev Error' },

		{ ']w', M.diagnostic_goto(true, 'WARN'), desc = 'LSP Next Warning' },
		{ '[w', M.diagnostic_goto(false, 'WARN'), desc = 'LSP Prev Warning' },

		{
			'K',
			function()
				vim.lsp.buf.hover()
			end,
			desc = 'LSP Hover',
		},
		{
			'gd',
			function()
				vim.lsp.buf.definition({ on_list = on_list })
			end,
			desc = 'LSP Goto Definition',
		},
	}
end

function M.on_attach(client, buffer)
	for _, keymap in ipairs(M.get_keymaps()) do
		local skip_hover = keymap[1] == 'K'
			and (vim.bo[buffer].filetype == 'rust' or not client:supports_method('textDocument/hover'))
		if not skip_hover then
			vim.keymap.set(keymap.mode or 'n', keymap[1], keymap[2], {
				buffer = buffer,
				desc = keymap.desc,
				silent = true,
			})
		end
	end
end

return M
